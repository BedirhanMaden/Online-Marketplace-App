//
//  ProductDetailView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import SwiftUI
import Firebase
struct ProductDetailView: View {
    @StateObject var viewModel=ProductDetailViewModel()
   
    @State var product: Product
    @EnvironmentObject var settings: Settings
    init( product: Product) {
        self.product = product

    }

    var body: some View {
        if(viewModel.areProductsLoaded){
                    ScrollView {
                        VStack{
                            TitleText(text: viewModel.title)
                            Spacer()
                            ScrollView(.horizontal){

                                HStack{
                                    ForEach(0..<viewModel.urlText.count, id:\.self) { i in
                                        
                                        AsyncImage(url: URL(string: viewModel.urlText[i])){ image in
                                            
                                            image.resizable() .scaledToFill()
                                            
                                            
                                        } placeholder: {
                                            LoadingView()
                                            
                                        }.frame(width: 300,height: 300)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                            
                            HStack{
                                TextDS(text: "Brand: \(viewModel.brand)")
                                TextDS(text: "Product: \(viewModel.title)")
                            }
                            
                            
                            TextDS(text: viewModel.description) .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        
                    }

                    HStack{

                        if(viewModel.discountPercentage>0){
                            HStack{
                                Text(("$" + String(viewModel.price))).strikethrough().font(.subheadline).foregroundColor(.black).padding(Spacing.spacing_2)
                                let newPrice = viewModel.price - (Int(Double(viewModel.price) * viewModel.discountPercentage / 100))
                                
                                Text(("$" + String(newPrice))).font(.title2).foregroundColor(.teal).padding(Spacing.spacing_2)
                            }
                        }else{
                            Text(("$" + String(viewModel.price))).font(.title2).foregroundColor(.teal).padding(Spacing.spacing_2)
                        }
                        
                        Spacer()

                            VStack{
                                if(viewModel.stock<10){
                                    TextDS(text: "Only \(viewModel.stock) Left!")
                                }

                                if settings.currentUser == nil{

                                    TextDS(text: "Log In To Order")

                                }else{
                                    ButtonDS(buttonText: "Add", buttonImageName: "Button") {

                                        settings.currentBasket?.products.append(product)

                                        viewModel.updateBasket(basket: settings.currentBasket ?? Basket(uid: "nouser", products: []), uid: settings.currentBasket?.uid ?? "nouser")
                                    }


                            }
                        }

                        

                
            }
        }else{
            LoadingView().onAppear{
                viewModel.loadProduct(productId: product.id ?? 1)
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product())
}
