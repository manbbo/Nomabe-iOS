//
//  TalkWithAIScreenView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct TalkWithAIScreenView: View {
    @StateObject private var viewModel: TalkWithAIViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: TalkWithAIViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollViewReader { scrollView in
                    ScrollView {
                        LazyVStack {
                            if (!viewModel.chatHist.isEmpty) {
                                ForEach(viewModel.chatHist, id: \.messageId) { chat in
                                    MessageView(message: chat)
                                        .id(chat.messageId)
                                }
                                .onChange(of: viewModel.chatHist) { _, __ in
                                    scrollToBottom(scrollView: scrollView)
                                }
                            }
                        }
                    }
                    .onAppear {
                        scrollToBottom(scrollView: scrollView)
                    }
                    .padding()
                    
                    InputBarView(
                        content: $viewModel.content,
                        isDisabled: $viewModel.isDisabled,
                        isChatDisabled: $viewModel.isChatDisabled,
                        sendMessage: {
                            viewModel.sendMessage()
                            scrollToBottom(scrollView: scrollView)
                            hideKeyboard()
                        }
                    )
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
                scrollView.scrollTo(viewModel.getLastChatId(), anchor: .bottom)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TalkWithAIScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TalkWithAIViewModel(separatorSymbol: "", foodItems: [])
        TalkWithAIScreenView(viewModel: viewModel)
    }
}
