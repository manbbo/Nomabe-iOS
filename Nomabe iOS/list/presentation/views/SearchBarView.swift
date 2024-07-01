//
//  SearchBarView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onSearchCancel: () -> Void
    
    var body: some View {
        HStack {
            TextField("Procurar...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button("Cancelar") {
                searchText = ""
                onSearchCancel()
                hideKeyboard()
            }
            .padding(.trailing)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBarView(searchText: $searchText, onSearchCancel: {})
    }
}
