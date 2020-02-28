//
//  ContentView.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2019/12/26.
//  Copyright © 2019 F-Works. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var name = ""
    @State var uid = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange
                
                VStack {
                    Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                        .padding(.top, 12)
                    
                    TextField("Name ", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    if name != "" && uid != "" {
                        NavigationLink(destination: MessageView(name: name, uid: uid)) {
                            HStack {
                                Text("Join")
                                Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            }
                            
                        }
                        .frame(width: 100, height: 54)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(27)
                        .padding(.bottom, 15)
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .animation(.default)
        .onAppear() {
            guard let user = Auth.auth().currentUser else { return }
            self.uid = user.uid
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
