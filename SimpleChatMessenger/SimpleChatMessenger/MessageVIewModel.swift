//
//  MessageVIewModel.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/27.
//  Copyright © 2019 F-Works. All rights reserved.
//

import Foundation
import FirebaseFirestore

@Observable class MessageViewModel {
    private(set) var messages: [MessageElement] = []
    private var lister: ListenerRegistration?
    /// コレクションの名称
    private let collectionName = "messages"
    
    init() {
        let db = Firestore.firestore()
        
        lister = db.collection(collectionName).addSnapshotListener { (querySnapshot, error) in
            if let error {
                print(error.localizedDescription)
                return
            }
            if let querySnapshot {
                for documentChange in querySnapshot.documentChanges {
                    if documentChange.type == .added {
                        do {
                            // Codableを使って構造体に変換する
                            let message = try documentChange.document.data(as: MessageElement.self)
                            self.messages.append(message)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                // 日付順に並べ替えする
                self.messages.sort { lhs, rhs in
                    return lhs.createAt < rhs.createAt ? true : false
                }
            }
        }
    }
    
    deinit {
        lister?.remove()
    }
    
    func addMessage(message: String , name: String) {
        do {
            let message = MessageElement(name: name, message: message, createAt: Date())
            let db = Firestore.firestore()
            try db.collection(collectionName).addDocument(from: message) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                print("success")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
