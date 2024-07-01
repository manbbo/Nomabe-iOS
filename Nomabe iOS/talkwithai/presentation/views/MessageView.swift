//
//  MessageView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct MessageView: View {
    var message: MessageModel
    
    var body: some View {
        HStack {
            if (message.sentMessage) {
                Spacer()
            }
            
            Text(message.content)
                .foregroundColor(.white)
                .padding()
                .background(message.sentMessage ? .blue : .green)
                .cornerRadius(20.0)
            
            if (!message.sentMessage) {
                Spacer()
            }
        }
    }
}

#Preview {
    MessageView(
        message: MessageModel(messageId: 0, sentMessage: false, content: "test"))
}
