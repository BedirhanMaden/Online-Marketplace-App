//
//  HomeView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel=HomeViewModel()
    @EnvironmentObject var settings: Settings
    
    var body: some View {


            if(viewModel.areProductsLoaded){
                NavigationStack{
                    ScrollView{
                        VStack{
                            TitleText(text: "Shopping App")
                            HStack{
                                Spacer()
                                TextField("Search Here", text: $viewModel.textFieldText).padding(Spacing.spacing_5)


                                Spacer()

                                    Button {

                                    } label: {
                                        NavigationLink(destination: SearchView(searchText: viewModel.textFieldText)){
                                            Image("Search").resizable().frame(width: 100,height: 60)
                                        }
                                    }.padding(Spacing.spacing_5)
                                Spacer()
                                }

                            Spacer()
                            HStack{




                                
                            }
                            Spacer()
                            TitleText2(text: "Featured")
                            //   List(viewModel.productList, id:\.self) { product in
                            //    NavigationLink(destination: ProductDetailView(product: product)){

                            //         ProductRowView(urlText: product.image!, title: product.title!, price: product.price!, ratingRate: (product.rating?.rate)!, ratingCount: (product.rating?.count)!)
                            //           }

                            //      }

                            ForEach(viewModel.productList, id:\.self) { product in


                                NavigationLink(destination: ProductDetailView(product: product)){


                                    ProductRowView(product: product )

                                }
                            }
                        }
                    }
                }



            }else{
                LoadingView().onAppear{
                    viewModel.loadProducts()
                }

            }

    }
}





#Preview {
    HomeView()
}
