//
//  messageRow.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/27.
//  Copyright © 2019 F-Works. All rights reserved.
//

import SwiftUI

struct messageRow: View {
    var message = ""
    var isMyMessage = false
    var user = ""
    
    var body: some View {
        HStack {
            if isMyMessage {
                Spacer()
                
                Text(message)
                .padding(8)
                .background(Color.red)
                .cornerRadius(6)
                .foregroundColor(Color.white)
            } else {
                VStack(alignment: .leading) {
                    Text(message)
                    .padding(8)
                    .background(Color.green)
                    .cornerRadius(6)
                    .foregroundColor(Color.white)
                    
                    Text(user)
                }
                
                Spacer()
            }
        }
    }
}

struct messageRow_Previews: PreviewProvider {
    static var previews: some View {
        messageRow(message: "Hoge", isMyMessage: true)
    }
}
