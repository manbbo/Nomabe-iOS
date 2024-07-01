//
//  InputBarView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct InputBarView: View {
    @Binding var content: String
    @Binding var isDisabled: Bool
    var sendMessage: () -> Void
    
    var body: some View {
        HStack {
            TextField("Faça seu pedido...", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .onChange(of: content) { _,__ in
                    setIsDisabled()
                }
            Button("Enviar") {
                sendMessage()
                //                chatHist.append(MessageModel(messageId: chatHist.count, sentMessage: true, content: content))
                //                content = ""
                //
                //                scrollToBottom(scrollView: scrollView)
                //                hideKeyboard()
            }
            .disabled(isDisabled)
            .padding(.trailing)
        }
    }
    
    func setIsDisabled() {
        if (content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) { isDisabled = true }
        else { isDisabled = false }
    }
}

struct InputBarView_Previews: PreviewProvider {
    @State static var content = ""
    @State static var isDisabled = true
    
    static var previews: some View {
        InputBarView(content: $content,
                     isDisabled: $isDisabled,
                     sendMessage: {
            isDisabled = false
        })
    }
}
