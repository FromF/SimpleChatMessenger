//
//  DateExtension.swift
//  SimpleChatMessenger
//
//  Created by 藤治仁 on 2022/05/10.
//  Copyright © 2022 F-Works. All rights reserved.
//

import Foundation

extension Date {
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: self)
    }
}
