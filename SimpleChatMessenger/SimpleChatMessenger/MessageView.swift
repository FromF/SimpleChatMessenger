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
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(name: "Tester")
    }
}
