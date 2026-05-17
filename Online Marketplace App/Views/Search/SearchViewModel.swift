//
//  SearchViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 9.01.2024.
//

import Foundation

class SearchViewModel:ObservableObject{

    @Published var productList:[Product]=[]
    @Published var areProductsLoaded: Bool=false

    var productDataSource = ProductListDataSource()

    init() {
        productDataSource.delegate=self
    }

    func loadProducts(searchText: String){
        productDataSource.loadSearchedProductData(searchedText: searchText)
    }

}

extension SearchViewModel:ProductListDataSourceDelegate{
    func productsLoaded(products: [Product]) {
        self.areProductsLoaded=true
        self.productList=products

    }

}

