//
//  CartView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import SwiftUI
import Firebase
struct CartView: View {
    @StateObject var viewModel=CartViewModel()
    @EnvironmentObject var settings: Settings

    var body: some View {
        NavigationStack{
            VStack{
                TitleText(text: "Cart")
                Spacer()
                if(settings.currentUser == nil){

                    NavigationLink("Click To Log In", destination: SignInView())




                }else{

                    if(settings.currentBasket != nil){
                        List {
                            ForEach(settings.currentBasket!.products, id: \.self) { product in
                                NavigationLink(destination: ProductDetailView(product: product)){


                                    CartRowView(product: product )

                                }
                            }.onDelete { indexSet in
                                settings.currentBasket?.products.remove(atOffsets: indexSet)
                                viewModel.updateBasket(basket: settings.currentBasket ?? Basket(uid: "nouser", products: []), uid: settings.currentBasket?.uid ?? "nouser")
                                // TODO: delete items
                            }
                        }

                        HStack{
                            Spacer()
                            TitleText3(text: ("Total: $" + String(viewModel.total)))
                            Spacer()
                            ButtonDS(buttonText: "Order", buttonImageName: "Button") {

                            }
                            Spacer()

                        }

                    }



                    // if(settings.currentUser==nil){


                    //  }else{
                    //       viewModel.getUserCart(userId: settings.currentUser?.id ?? 0)
                    // }
                }
            }.onAppear(perform: {
                viewModel.calculateTotal(basket: settings.currentBasket)
            })
        }
    }
    }

#Preview {
    CartView()
}
