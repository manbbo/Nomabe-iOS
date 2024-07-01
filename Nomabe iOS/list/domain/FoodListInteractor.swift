//
//  FoodListInteractor.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine

protocol FoodListInteractorProtocol {
    func fetchFoodItems() -> AnyPublisher<[ProductItem], Error>
}

class FoodListInteractor: FoodListInteractorProtocol {
    private let repository: FoodListRepositoryProtocol
    
    init(repository: FoodListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchFoodItems() -> AnyPublisher<[ProductItem], Error> {
        return repository.getFoodItems()
    }
}
