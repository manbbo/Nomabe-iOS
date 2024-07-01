//
//  FoodListView.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject private var viewModel = FoodListViewModel()
    
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
                                TalkWithAIScreenView()
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

#Preview {
    FoodListView()
}
