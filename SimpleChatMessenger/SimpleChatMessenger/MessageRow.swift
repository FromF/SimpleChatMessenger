//
//  MessageRow.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/27.
//  Copyright © 2019 F-Works. All rights reserved.
//

import SwiftUI

struct MessageRow: View {
    let message: String
    let isMyMessage: Bool
    let user: String
    let date: Date
    
    var body: some View {
        HStack {
            if isMyMessage {
                Spacer()
                
                VStack {
                    Text(message)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundStyle(Color.white)
                    Text(date.text)
                        .font(.callout)
                }
            } else {
                VStack(alignment: .leading) {
                    Text(message)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(6)
                        .foregroundStyle(Color.white)

                    HStack {
                        Text(user)
                        
                        Text(date.text)
                            .font(.callout)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    List {
        MessageRow(message: "Hoge", isMyMessage: false, user: "other", date: Date())
        MessageRow(message: "Hoge", isMyMessage: true, user: "other", date: Date())
    }
}
