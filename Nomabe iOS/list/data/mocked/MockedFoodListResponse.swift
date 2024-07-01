//
//  MockedFoodListRequest.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import Foundation

var mockedFoodListResponse: [ProductItem] = [
    ProductItem(
        itemID: "1",
        itemName: "Frango Grelhado com Legumes",
        itemDescription: "Delicioso frango grelhado acompanhado de uma seleção de legumes frescos.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Frango",
                    weight: 150,
                    calories: 250,
                    proteins: 40,
                    fats: 5,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Legumes",
                    weight: 100,
                    calories: 50,
                    proteins: 3,
                    fats: 0.5,
                    carbohydrates: 10
                )
            ]
        ),
        itemPrice: 18.99
    ),
    ProductItem(
        itemID: "2",
        itemName: "Salada Caesar",
        itemDescription: "Clássica salada Caesar com alface crocante, frango, croutons e parmesão.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Alface",
                    weight: 50,
                    calories: 10,
                    proteins: 1,
                    fats: 0.1,
                    carbohydrates: 2
                ),
                NutritionItem(
                    itemName: "Frango",
                    weight: 100,
                    calories: 165,
                    proteins: 31,
                    fats: 3.6,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Croutons",
                    weight: 20,
                    calories: 80,
                    proteins: 2,
                    fats: 4,
                    carbohydrates: 10
                ),
                NutritionItem(
                    itemName: "Parmesão",
                    weight: 10,
                    calories: 40,
                    proteins: 3,
                    fats: 3,
                    carbohydrates: 1
                )
            ]
        ),
        itemPrice: 12.50
    ),
    ProductItem(
        itemID: "3",
        itemName: "Spaghetti à Bolonhesa",
        itemDescription: "Tradicional spaghetti com molho à bolonhesa, preparado com carne moída e tomates frescos.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Spaghetti",
                    weight: 200,
                    calories: 310,
                    proteins: 10,
                    fats: 2,
                    carbohydrates: 60
                ),
                NutritionItem(
                    itemName: "Molho Bolonhesa",
                    weight: 150,
                    calories: 200,
                    proteins: 15,
                    fats: 10,
                    carbohydrates: 10
                )
            ]
        ),
        itemPrice: 15.99
    ),
    ProductItem(
        itemID: "4",
        itemName: "Salmão com Aspargos",
        itemDescription: "Salmão grelhado servido com aspargos frescos e um toque de limão.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Salmão",
                    weight: 200,
                    calories: 400,
                    proteins: 45,
                    fats: 22,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Aspargos",
                    weight: 100,
                    calories: 20,
                    proteins: 2,
                    fats: 0.2,
                    carbohydrates: 4
                )
            ]
        ),
        itemPrice: 22.99
    ),
    ProductItem(
        itemID: "5",
        itemName: "Tacos de Carne",
        itemDescription: "Tacos recheados com carne temperada, alface, tomate e queijo cheddar.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Carne",
                    weight: 150,
                    calories: 250,
                    proteins: 20,
                    fats: 15,
                    carbohydrates: 5
                ),
                NutritionItem(
                    itemName: "Tortilla",
                    weight: 50,
                    calories: 150,
                    proteins: 4,
                    fats: 3,
                    carbohydrates: 25
                ),
                NutritionItem(
                    itemName: "Queijo Cheddar",
                    weight: 30,
                    calories: 120,
                    proteins: 7,
                    fats: 10,
                    carbohydrates: 1
                )
            ]
        ),
        itemPrice: 14.99
    ),
    ProductItem(
        itemID: "6",
        itemName: "Pizza Margherita",
        itemDescription: "Pizza clássica Margherita com molho de tomate, mussarela e manjericão fresco.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Massa de Pizza",
                    weight: 200,
                    calories: 260,
                    proteins: 8,
                    fats: 4,
                    carbohydrates: 45
                ),
                NutritionItem(
                    itemName: "Molho de Tomate",
                    weight: 100,
                    calories: 50,
                    proteins: 2,
                    fats: 0.5,
                    carbohydrates: 10
                ),
                NutritionItem(
                    itemName: "Mussarela",
                    weight: 100,
                    calories: 280,
                    proteins: 20,
                    fats: 20,
                    carbohydrates: 3
                )
            ]
        ),
        itemPrice: 19.99
    ),
    ProductItem(
        itemID: "7",
        itemName: "Risoto de Cogumelos",
        itemDescription: "Risoto cremoso com uma mistura de cogumelos frescos e queijo parmesão.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Arroz Arborio",
                    weight: 200,
                    calories: 250,
                    proteins: 6,
                    fats: 8,
                    carbohydrates: 40
                ),
                NutritionItem(
                    itemName: "Cogumelos",
                    weight: 100,
                    calories: 40,
                    proteins: 3,
                    fats: 0.5,
                    carbohydrates: 8
                ),
                NutritionItem(
                    itemName: "Parmesão",
                    weight: 50,
                    calories: 200,
                    proteins: 14,
                    fats: 16,
                    carbohydrates: 2
                )
            ]
        ),
        itemPrice: 17.99
    ),
    ProductItem(
        itemID: "8",
        itemName: "Hambúrguer Gourmet",
        itemDescription: "Hambúrguer suculento com queijo, bacon, alface, tomate e molho especial.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Carne de Hambúrguer",
                    weight: 200,
                    calories: 400,
                    proteins: 30,
                    fats: 30,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Pão de Hambúrguer",
                    weight: 100,
                    calories: 250,
                    proteins: 8,
                    fats: 4,
                    carbohydrates: 45
                ),
                NutritionItem(
                    itemName: "Queijo",
                    weight: 50,
                    calories: 200,
                    proteins: 12,
                    fats: 16,
                    carbohydrates: 2
                ),
                NutritionItem(
                    itemName: "Bacon",
                    weight: 30,
                    calories: 150,
                    proteins: 10,
                    fats: 12,
                    carbohydrates: 1
                )
            ]
        ),
        itemPrice: 21.99
    ),
    ProductItem(
        itemID: "9",
        itemName: "Ceviche de Peixe",
        itemDescription: "Ceviche fresco de peixe marinado em limão com cebola roxa, coentro e pimenta.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Peixe",
                    weight: 150,
                    calories: 150,
                    proteins: 30,
                    fats: 2,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Limão",
                    weight: 50,
                    calories: 15,
                    proteins: 0.5,
                    fats: 0.2,
                    carbohydrates: 5
                ),
                NutritionItem(
                    itemName: "Cebola Roxa",
                    weight: 50,
                    calories: 20,
                    proteins: 0.5,
                    fats: 0.1,
                    carbohydrates: 5
                ),
                NutritionItem(
                    itemName: "Coentro",
                    weight: 10,
                    calories: 2,
                    proteins: 0.1,
                    fats: 0,
                    carbohydrates: 0.4
                )
            ]
        ),
        itemPrice: 16.99
    ),
    ProductItem(
        itemID: "10",
        itemName: "Pad Thai",
        itemDescription: "Autêntico Pad Thai com noodles de arroz, camarão, tofu, amendoim e broto de feijão.",
        itemImage: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
        itemNutrition: NutritionValues(
            nutritionItems: [
                NutritionItem(
                    itemName: "Noodles de Arroz",
                    weight: 200,
                    calories: 220,
                    proteins: 4,
                    fats: 1,
                    carbohydrates: 50
                ),
                NutritionItem(
                    itemName: "Camarão",
                    weight: 100,
                    calories: 99,
                    proteins: 24,
                    fats: 1,
                    carbohydrates: 0
                ),
                NutritionItem(
                    itemName: "Tofu",
                    weight: 50,
                    calories: 70,
                    proteins: 8,
                    fats: 4,
                    carbohydrates: 2
                ),
                NutritionItem(
                    itemName: "Amendoim",
                    weight: 20,
                    calories: 100,
                    proteins: 4,
                    fats: 8,
                    carbohydrates: 3
                ),
                NutritionItem(
                    itemName: "Broto de Feijão",
                    weight: 30,
                    calories: 10,
                    proteins: 1,
                    fats: 0.1,
                    carbohydrates: 2
                )
            ]
        ),
        itemPrice: 19.99
    )
]
