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
    private(set) var messages: [messageElement] = []
    private var lister: ListenerRegistration?
    
    init() {
        let db = Firestore.firestore()
        
        lister = db.collection("messages").addSnapshotListener { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let snap = snap {
                for i in snap.documentChanges {
                    if i.type == .added {
                        let name = i.document.get("name") as! String
                        let message = i.document.get("message") as! String
                        let createdAt = i.document.get("createAt", serverTimestampBehavior: .estimate) as! Timestamp
                        let createDate = createdAt.dateValue()
                        let id = i.document.documentID

                        self.messages.append(messageElement(id: id, name: name, message: message, createAt: createDate))
                    }
                }
                // 日付順に並べ替えする
                self.messages.sort { before, after in
                    return before.createAt < after.createAt ? true : false
                }
            }
        }
    }
    
    deinit {
        lister?.remove()
    }
    
    func addMessage(message: String , user: String) {
        let data = [
            "message": message,
            "name": user,
            "createAt":FieldValue.serverTimestamp(),
        ] as [String : Any]
        
        let db = Firestore.firestore()
        
        db.collection("messages").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("success")
        }
    }
}
