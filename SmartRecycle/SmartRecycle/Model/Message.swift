//
//  Message.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 20/1/2024.
//

//MARK: Source Code follow to GitHub "SwiftGPT" https://github.com/mbabicz/SwiftGPT?tab=readme-ov-file

import Foundation
import UIKit
import SwiftUI

enum MessageType {
    case text
    case indicator
    case error
}

struct Message: Identifiable, Equatable {
    var id = UUID()
    var content: Any
    let type: MessageType
    let isUserMessage: Bool

    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id && lhs.content as AnyObject === rhs.content as AnyObject && lhs.type == rhs.type && lhs.isUserMessage == rhs.isUserMessage
    }
}
