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
    @Binding var isChatDisabled: Bool
    var sendMessage: () -> Void
    
    var body: some View {
        HStack {
            TextField("Faça seu pedido...", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .disabled(isChatDisabled)
                .onChange(of: content) { _,__ in
                    setIsDisabled()
                }
            Button("Enviar") {
                sendMessage()
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
    @State static var isChatDisabled = false
    
    static var previews: some View {
        InputBarView(content: $content,
                     isDisabled: $isDisabled,
                     isChatDisabled: $isChatDisabled,
                     sendMessage: {
            isDisabled = false
        })
    }
}
