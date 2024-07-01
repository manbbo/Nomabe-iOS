//
//  TalkWithAIScreenView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct TalkWithAIScreenView: View {
    @State private var content = ""
    @Environment(\.dismiss) private var dismiss
    @State private var isDisabled = true
    
    @State var chatHist = mockedChatHist

    var body: some View {
        NavigationStack{
            VStack{
                ScrollViewReader { scrollView in
                    ScrollView {
                        LazyVStack {
                            ForEach(chatHist, id: \.messageId) { chat in
                                MessageView(message: chat)
                                    .id(chat.messageId)
                            }
                            
                            .onChange(of: chatHist) { _, __ in
                                scrollToBottom(scrollView: scrollView)
                            }
                        }
                    }
                    .onAppear {
                        scrollToBottom(scrollView: scrollView)
                    }
                    .padding()
                    
                    InputBarView(content: $content, isDisabled: $isDisabled, sendMessage: {
                        chatHist.append(MessageModel(messageId: chatHist.count, sentMessage: true, content: content))
                        content = ""
                        
                        scrollToBottom(scrollView: scrollView)
                        hideKeyboard()
                    })
                    
//                    HStack {
//                        TextField("Faça seu pedido...", text: $content)
//                            .onChange(of: content) { m, _ in
//                                if (m.isEmpty) { isDisabled = true }
//                                else { isDisabled = false }
//                            }
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding(.horizontal)
//                        Button("Enviar") {
//                            chatHist.append(MessageModel(messageId: chatHist.count, sentMessage: true, content: content))
//                            content = ""
//                            
//                            scrollToBottom(scrollView: scrollView)
//                            hideKeyboard()
//                        }
//                        .disabled(isDisabled)
//                        .padding(.trailing)
//                    }
                }
            }
            .navigationTitle("Pergunte à Nomabe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
            })
        }
    }
    
    func scrollToBottom(scrollView: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation {
                scrollView.scrollTo(chatHist.last?.messageId, anchor: .bottom)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//#Preview {
//    TalkWithAIScreenView()
//}
