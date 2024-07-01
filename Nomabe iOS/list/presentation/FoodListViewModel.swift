//
//  FoodListViewModel.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine

class FoodListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var isSearchBarVisible = false
    @Published var isPresented = false
    @Published var searchResults: [ProductItem] = []
    private var cancellables = Set<AnyCancellable>()
    
        
        private let interactor: FoodListInteractorProtocol
        
        init(interactor: FoodListInteractorProtocol) {
            self.interactor = interactor
            bindSearchText()
            fetchFoodItems()
    }

    private func bindSearchText() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.fetchFoodItems()
            }
            .store(in: &cancellables)
    }
    
    func fetchFoodItems() {
            interactor.fetchFoodItems()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print("Error fetching food items: \(error)")
                    case .finished:
                        break
                    }
                }, receiveValue: { [weak self] items in
                    if self?.searchText.isEmpty == true {
                        self?.searchResults = items
                    } else {
                        self?.searchResults = items.filter { $0.matches(query: self?.searchText ?? "") }
                    }
                })
                .store(in: &cancellables)
        }
    
    func setIsPresented() {
        isPresented.toggle()
    }
    
    func getIsPresented() -> Bool {
        return isPresented
    }

    func toggleSearchBar() {
        isSearchBarVisible.toggle()
    }

    func cancelSearch() {
        searchText = ""
        fetchFoodItems()
        toggleSearchBar()
    }
}
