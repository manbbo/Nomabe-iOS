//
//  FoodListService.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import Foundation
import Combine

protocol FoodListServiceProtocol {
    func fetchFoodList() -> AnyPublisher<[ProductItem], Error>
}

class FoodListService: FoodListServiceProtocol {
    func fetchFoodList() -> AnyPublisher<[ProductItem], any Error> {
        // create a call here
        
        let response = mockedFoodListResponse
        return Just(response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
