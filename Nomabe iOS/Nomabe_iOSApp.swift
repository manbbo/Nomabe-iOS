//
//  Nomabe_iOSApp.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import SwiftUI

@main
struct Nomabe_iOSApp: App {
    
    var body: some Scene {
        WindowGroup {
            let service = FoodListService()
            let repository = FoodListRepository(service: service)
            let interactor = FoodListInteractor(repository: repository)
            let viewModel = FoodListViewModel(interactor: interactor)
            FoodListView(viewModel: viewModel)
        }
    }
}
