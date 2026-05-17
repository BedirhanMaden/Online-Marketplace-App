//
//  CategoryView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 15.12.2023.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel=CategoryViewModel()

    var body: some View {
        if(viewModel.areCategoriesLoaded){
            VStack{
                TitleText(text: "Categories")
                List(viewModel.categoryList, id:\.self) { category in

                    NavigationLink(destination: CategoryProductListView(category: category)){
                        Text(category).bold().font(.title3)
                    }


                }
            }

        }else{
            LoadingView().onAppear{
                viewModel.loadCategories()
            }

        }

    }
}

#Preview {
    CategoryView()
}
