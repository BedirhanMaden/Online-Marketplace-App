//
//  ProductViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject{

    @Published var urlText: [String]=[]
    @Published var title: String=""
    @Published var price: Int=1
    @Published var description: String=""
    @Published var discountPercentage : Double = 1.1
    @Published var rating             : Double = 1.1
    @Published var stock              : Int = 1
    @Published var brand              : String = ""
    @Published var category           : String = ""
    @Published var areProductsLoaded=false
    @Published var database=BasketDataSource()

    var productDataSource = ProductSpecificDataSource()

    init() {
        productDataSource.delegate=self
    }
 
    func loadProduct(productId:Int){
        productDataSource.loadPostData(productId: productId)
    }
    
    func updateBasket(basket: Basket, uid: String){
        database.updateBasket(basket: basket, uid: uid)
    }


}
extension ProductDetailViewModel : ProductSpecificDataSourceDelegate{
    func productLoaded(product: Product) {
        self.areProductsLoaded=true
        urlText=product.images ?? []
        title=product.title ?? ""
        price=product.price ?? 0
        description=product.description ?? ""
        discountPercentage = product.discountPercentage ?? 1
        rating = product.discountPercentage ?? 1
        stock = product.stock ?? 1
        brand = product.brand ?? ""
        category = product.category ?? ""
    }
    

}
