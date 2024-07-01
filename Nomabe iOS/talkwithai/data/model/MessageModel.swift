//
//  MessageModel.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation

struct MessageModel: Equatable {
    let messageId: Int
    let sentMessage: Bool
    let content: String
    
    static func fromJson(json: [String: Any]) -> MessageModel? {
        guard
            let messageId = json["messageId"] as? Int,
            let sentMessage = json["sentMessage"] as? Bool,
            let content = json["content"] as? String
        else {
            return nil
        }
        
        return MessageModel(messageId: messageId,
                            sentMessage: sentMessage,
                            content: content)
    }
}
