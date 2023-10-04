//
//  ContentView.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/26.
//  Copyright © 2019 F-Works. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange
                
                VStack {
                    Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                        .padding(.top, 12)
                    
                    TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    if name.isEmpty == false {
                        NavigationLink {
                            MessageView(name: name)
                        } label: {
                            HStack {
                                Text("Join")
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .frame(width: 100, height: 54)
                        .background(Color.orange)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 27))
                        .padding(.bottom, 15)
                    }
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .animation(.default, value: name.isEmpty == false)
    }
}

#Preview {
    ContentView()
}
