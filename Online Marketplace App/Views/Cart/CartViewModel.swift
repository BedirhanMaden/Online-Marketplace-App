//
//  CartViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import Foundation

class CartViewModel:ObservableObject{

    @Published var cartList:[Cart]=[]
    @Published var userCart: Cart? = nil
    @Published var userProducts: [Products] = []
    @Published var areCartsLoaded: Bool=false
    @Published var database = BasketDataSource()
    @Published var total = 0
    var cartDataSource = CartDataSource()

    init() {
        cartDataSource.delegate=self
    }

    func calculateTotal(basket: Basket?){
        var tempTotal=0
        if basket != nil{
            for product in basket!.products {
                tempTotal = tempTotal + Int(Double(product.price ?? 0) * (100 - (product.discountPercentage ?? 0))/100)
            }
        }
        self.total=tempTotal
    }

    func loadCarts(){
        cartDataSource.loadCartData()
    }
  
    func updateBasket(basket: Basket, uid: String){
        database.updateBasket(basket: basket, uid: uid)
    }


    func getUserCart(userId: Int){
        for i in 0...cartList.count{
            if(cartList[i].userId==userId){
                userCart=cartList[i]
                userProducts=userCart?.products ?? []
            }
        }
    }
}

extension CartViewModel:CartDataSourceDelegate{
    func cartsLoaded(carts: [Cart]) {
        self.areCartsLoaded=true
        self.cartList=carts
    }

}

