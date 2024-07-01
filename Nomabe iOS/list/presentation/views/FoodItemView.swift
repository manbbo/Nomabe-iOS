//
//  FoodItemView.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import SwiftUI

struct FoodItemView: View {
    var foodItem: ProductItem
    @State private var isPresented = false
    
    init(foodItem: ProductItem) {
        self.foodItem = foodItem
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack{
                AsyncImage(url: URL(string: foodItem.itemImage)){
                    image in image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
            }
            HStack {
                Text(foodItem.itemName)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Spacer()
                Text(foodItem.getFormattedPrice())
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            Text(foodItem.itemNutrition.getItemNames())
                .foregroundColor(.black)
                .lineLimit(1)
            Text(foodItem.itemNutrition.getMacros())
                .foregroundColor(.black)
                .lineLimit(1)
                .font(.system(size: 13))
            Text(foodItem.itemDescription)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0.8, trailing: 0))
                .foregroundColor(.black)
        })
        .padding()
        .background(.white)
        .cornerRadius(8.0)
        .frame(maxWidth: .infinity, maxHeight: 330.0)
        .contentShape(Rectangle())
        .onTapGesture {
            isPresented = true
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            TalkWithAIScreenView()
        })
    }
}

#Preview {
    FoodItemView(foodItem: mockedFoodListResponse[0])
}
