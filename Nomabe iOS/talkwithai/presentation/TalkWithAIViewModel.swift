//
//  TalkWithAIViewModel.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine

class TalkWithAIViewModel: ObservableObject {
    @Published private var content = ""
    @Published private var isDisabled = true
    @Published var chatHist: [MessageModel] = []// = mockedChatHist
    private var cancellables = Set<AnyCancellable>()
    
    private let interactor: TalkWithAIInteractorProtocol
    
    init(interactor: TalkWithAIInteractorProtocol) {
        self.interactor = interactor
    }
}
