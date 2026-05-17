//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import Foundation

class HomeViewModel:ObservableObject{
    
    @Published var productList:[Product]=[]
    @Published var areProductsLoaded: Bool=false
    @Published var textFieldText = ""
    var productDataSource = ProductListDataSource()

    init() {
        productDataSource.delegate=self
    }

    func loadProducts(){
        productDataSource.loadProductData()
    }

}

extension HomeViewModel:ProductListDataSourceDelegate{
    func productsLoaded(products: [Product]) {
        self.areProductsLoaded=true
        self.productList=products

    }

}

