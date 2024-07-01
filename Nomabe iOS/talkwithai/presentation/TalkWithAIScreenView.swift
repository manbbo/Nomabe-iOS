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
    
    @State var chatHist = [
        MessageModel(messageId: 0, sentMessage: true, content: "Olá!"),
        MessageModel(messageId: 1, sentMessage: false, content: "Oi! Como posso ajudar hoje?"),
        MessageModel(messageId: 2, sentMessage: true, content: "Estou procurando um prato saudável para a minha dieta. Você pode me ajudar?"),
        MessageModel(messageId: 3, sentMessage: false, content: "Claro! Temos várias opções saudáveis. Você tem alguma preferência?"),
        MessageModel(messageId: 4, sentMessage: true, content: "Prefiro algo com frango ou peixe."),
        MessageModel(messageId: 5, sentMessage: false, content: "Ótimo! Aqui estão algumas sugestões:\n1. Frango Grelhado com Legumes\n2. Salmão com Aspargos\n3. Ceviche de Peixe\nQual deles você gostaria de saber mais?"),
        MessageModel(messageId: 6, sentMessage: true, content: "Me fale mais sobre o Frango Grelhado com Legumes."),
        MessageModel(messageId: 7, sentMessage: false, content: "O Frango Grelhado com Legumes é delicioso e saudável. Ele vem com uma seleção de legumes frescos. Tem 250 calorias e 40g de proteínas. Gostaria de pedir este prato?"),
        MessageModel(messageId: 8, sentMessage: true, content: "Sim, parece perfeito! Vou querer esse."),
        MessageModel(messageId: 9, sentMessage: false, content: "Ótima escolha! Seu pedido de Frango Grelhado com Legumes foi confirmado. Algo mais que eu possa ajudar?"),
        MessageModel(messageId: 10, sentMessage: true, content: "Não, obrigado!"),
        MessageModel(messageId: 11, sentMessage: false, content: "De nada! Tenha um ótimo dia!")
    ]

    
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
                    
                    HStack {
                        TextField("Faça seu pedido...", text: $content)
                            .onChange(of: content) { m, _ in
                                if (m.isEmpty) { isDisabled = true }
                                else { isDisabled = false }
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Button("Enviar") {
                            chatHist.append(MessageModel(messageId: chatHist.count, sentMessage: true, content: content))
                            content = ""
                            
                            scrollToBottom(scrollView: scrollView)
                            hideKeyboard()
                        }
                        .disabled(isDisabled)
                        .padding(.trailing)
                    }
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

#Preview {
    TalkWithAIScreenView()
}
