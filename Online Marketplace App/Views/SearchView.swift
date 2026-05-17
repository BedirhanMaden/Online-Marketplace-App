//
//  SearchView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 9.01.2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String
    @StateObject var viewModel=SearchViewModel()
    init(searchText: String) {
        self.searchText = searchText
    }
    var body: some View {
        
        if(viewModel.areProductsLoaded){
            ScrollView{
                VStack{
                    TitleText2(text: ("Searched For: " + searchText))
                    
                    ForEach(viewModel.productList, id:\.self) { product in
                        
                        
                        NavigationLink(destination: ProductDetailView(product: product)){
                            
                            
                            ProductRowView(product: product )
                            
                        }
                    }
                }
            }
        }else{
            LoadingView().onAppear{
                viewModel.loadProducts(searchText: self.searchText)
            }
        }

    }
}

#Preview {
    SearchView(searchText: "md")
}
