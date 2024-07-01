//
//  FoodListView.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import SwiftUI

struct FoodListView: View {
    @State private var searchText = ""
    @State private var isSearchBarVisible = false
    @State private var selection: String? = nil
    @State private var isPresented = false

    var data = mockedFoodListResponse

    var searchResults: [ProductItem] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.matches(query: searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if isSearchBarVisible {
                    HStack {
                        TextField("Procurar...", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        Button("Cancelar") {
                            searchText = ""
                            isSearchBarVisible = false
                            hideKeyboard()
                        }
                        .padding(.trailing)
                    }
                }
            }
            
            ZStack {
                List(searchResults, id: \.itemID) { foodItem in
                    FoodItemView(foodItem: foodItem)
                }
                .listStyle(PlainListStyle())
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        TalkWithAIButtonView {
                                isPresented = true
                        }
                        .sheet(isPresented: $isPresented, content: {
                            TalkWithAIScreenView()
                        })
                    }
                }
                .padding(.trailing, 16)
                .padding(.bottom, 16)
                
                
            }
            .navigationTitle("Pratos")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                withAnimation {
                    isSearchBarVisible.toggle()
                }
            }) {
                Image(systemName: "magnifyingglass")
            })
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    FoodListView()
}
