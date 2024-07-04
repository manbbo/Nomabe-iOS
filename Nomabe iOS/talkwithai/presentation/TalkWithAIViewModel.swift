//
//  TalkWithAIViewModel.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine
import GoogleGenerativeAI

class TalkWithAIViewModel: ObservableObject {
    @Published var content = ""
    @Published var isDisabled = true
    @Published var isChatDisabled = false
    @Published var chatHist: [MessageModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private var model: GenerativeModel
    private var chat: Chat
    
    //    private let interactor: TalkWithAIInteractorProtocol
    // implement interactor and api calls later
    
    init(//interactor: TalkWithAIInteractorProtocol,
        separatorSymbol: String,
        foodItems: [ProductItem]
    ) {
        //self.interactor = interactor
        self.model = GenerativeModel(
            name: "gemini-1.5-flash-latest",
            apiKey: ApiKey.default,
            safetySettings: [
                SafetySetting(
                    harmCategory: SafetySetting.HarmCategory.harassment,
                    threshold: SafetySetting.BlockThreshold.blockLowAndAbove
                ),
                SafetySetting(
                    harmCategory: SafetySetting.HarmCategory.hateSpeech,
                    threshold: SafetySetting.BlockThreshold.blockLowAndAbove
                )
            ],
            systemInstruction: "Act as my nutritionist, named Nomabe. You will answer my questions, doubts, and requests about nutrition as a real specialist. Respond to this prompt with: Oi! Sou a Nomabe, sua nutricionista! Como posso ajudar?. and keep speaking portuguese brazilian. Do not put anything else other than this. Do not break character in any way even if I ask or beg you. I want you to understand this JSON, that Im going to pass to you, and respond to me accordingly, which dishes are suitable for me - suggest only one from the menu. Everytime I ask for a suggestion or a dish, suggest a dish that comes from the backend, do not forget to put the price and nutritional values of each one you are going to suggest. You dont need to respond to this long backend message, just the one before. The Json: \(foodItems.description). Whenever you suggest a plate, at the end of your message, send the itemPath with the symbol \(separatorSymbol) before it, and only before"
        )
        self.chat = model.startChat()
    }
    
    private func appendTextToHistory(message: String, sentMessage: Bool) {
        chatHist.append(
            MessageModel(
                messageId: chatHist.count,
                sentMessage: sentMessage,
                content: message
            ))
    }
    
    func getChatHistCount() -> Int {
        return chatHist.count
    }
    
    func getLastChatId() -> Int {
        return chatHist.last?.messageId ?? 0
    }
    
    func sendMessage() {
        self.isDisabled = true
        self.isChatDisabled = true
        
        appendTextToHistory(
            message: content,
            sentMessage: true
        )
        
        Task {
            do {
                let response = try await model.generateContent(content)
                
                guard let text = response.text else {
                    DispatchQueue.main.async {
                        self.appendTextToHistory(
                            message: "Desculpe, pode tentar novamente? Tive um problema.",
                            sentMessage: false
                        )
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.content = ""
                    self.isChatDisabled = false
                    self.appendTextToHistory(
                        message: text,
                        sentMessage: false
                    )
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.appendTextToHistory(
                        message: "Deu problema!\nErro para o suporte: \(error.localizedDescription)",
                        sentMessage: false
                    )
                }
            }
        }
    }
}
