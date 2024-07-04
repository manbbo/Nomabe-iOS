//
//  FoodListView.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject private var viewModel: FoodListViewModel
    
    init(viewModel: FoodListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if viewModel.isSearchBarVisible {
                        SearchBarView(searchText: $viewModel.searchText, onSearchCancel: {
                            viewModel.cancelSearch()
                        })
                    }
                }
                
                ZStack {
                    List(viewModel.searchResults, id: \.itemID) { foodItem in
                        FoodItemView(foodItem: foodItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            TalkWithAIButtonView {
                                viewModel.setIsPresented()
                            }
                            .sheet(isPresented: $viewModel.isPresented, content: {
                                let aiViewModel = TalkWithAIViewModel(
                                separatorSymbol: "\\\\\\\\", foodItems: mockedFoodListResponse)
                                TalkWithAIScreenView(viewModel: aiViewModel)
                            })
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 16)
                }
                .navigationBarTitle("Pratos")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    viewModel.toggleSearchBar()
                }) {
                    Image(systemName: "magnifyingglass")
                })
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        let service = FoodListService()
        let repository = FoodListRepository(service: service)
        let interactor = FoodListInteractor(repository: repository)
        let viewModel = FoodListViewModel(interactor: interactor)
        
        FoodListView(viewModel: viewModel)
    }
}
