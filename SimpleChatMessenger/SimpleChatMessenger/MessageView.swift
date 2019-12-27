//
//  MessageView.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/27.
//  Copyright © 2019 F-Works. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var name = ""
    @ObservedObject var messageVM = messageViewModel()
    @State var typeMessage = ""
    
    var body: some View {
        VStack {
            List(messageVM.messages, id: \.id) {i in
                Text(i.message)
            }
            .navigationBarTitle("Chats",displayMode: .large)
            HStack {
                TextField("Message", text: $typeMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.messageVM.addMessage(message: self.typeMessage, user: self.name)
                    self.typeMessage = ""
                }) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(name: "Tester")
    }
}
