//
//  MessageElement.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2022/05/10.
//  Copyright © 2022 F-Works. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct MessageElement: Codable {
    @DocumentID var id: String?
    var name: String
    var message: String
    var createAt: Date
}
