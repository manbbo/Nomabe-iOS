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

    init() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.fetchFoodItems()
            }
            .store(in: &cancellables)
    }

    func fetchFoodItems() {
        if searchText.isEmpty {
            searchResults = mockedFoodListResponse
        } else {
            searchResults = mockedFoodListResponse.filter { $0.matches(query: searchText) }
        }
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
