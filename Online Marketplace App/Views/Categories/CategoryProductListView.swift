//
//  CategoryProductListView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import SwiftUI

struct CategoryProductListView: View {
    @StateObject var viewModel=CategoryProductListViewModel()
    @State var category: String

    init( category: String) {
        self.category = category
    }

    var body: some View {

        ScrollView{
            TitleText(text: category)

            if(viewModel.areProductsLoaded){
                ForEach(viewModel.productList, id:\.self) { product in


                    NavigationLink(destination: ProductDetailView(product: product)){


                        ProductRowView(product: product )

                    }
                }


            }else{
                LoadingView().onAppear{
                    viewModel.loadProducts(categoryName: category)
                }

            }
        }
    }
}

#Preview {
    CategoryProductListView(category: "electronics")
}
