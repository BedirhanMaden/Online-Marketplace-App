//
//  CategoryProductListViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import Foundation

class CategoryProductListViewModel:ObservableObject{

    @Published var productList:[Product]=[]
    @Published var areProductsLoaded: Bool=false
    var productDataSource = ProductListDataSource()

    init() {
        productDataSource.delegate=self
    }

    func loadProducts(categoryName: String){
        productDataSource.loadFilteredProductData(categoryName: categoryName)
    }

}

extension CategoryProductListViewModel:ProductListDataSourceDelegate{
    func productsLoaded(products: [Product]) {
        self.areProductsLoaded=true
        self.productList=products

    }

}

