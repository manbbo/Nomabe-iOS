//
//  FooListRepository.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine

protocol FoodListRepositoryProtocol{
    func getFoodItems() -> AnyPublisher<[ProductItem], Error>
}

class FoodListRepository: FoodListRepositoryProtocol {
    private let service: FoodListServiceProtocol
    
    init(service: FoodListServiceProtocol) {
        self.service = service
    }
    
    func getFoodItems() -> AnyPublisher<[ProductItem], Error> {
        return service.fetchFoodList()
    }
}
