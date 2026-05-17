//
//  SignInViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import Foundation
import Firebase
class SignInViewModel : ObservableObject{
    @Published var isNextViewActive=false
    @Published var userName = ""
    @Published var password = ""
    @Published var user: User? = nil
    @Published var basketList: [Basket] = []
    @Published var errorMessage = ""
    var isListLoaded: Bool=false

    var basketDataSource = BasketDataSource()

    init(){
        basketDataSource.delegate=self
    }


    func moveToNextView(){
        isNextViewActive=true
    }
    func loadList(){
        basketDataSource.fetchBasket()
    }

    func signIn(){
        Auth.auth().signIn(withEmail: userName, password: password) { result, error in
            if error != nil{
                print("Error in sign in")
                self.errorMessage="Email or Password does not match. Please try again."
                print(error?.localizedDescription)
            }
        }
    }
    func authHandler(){
       
    }
}

extension SignInViewModel:BasketDataSourceDelegate{
    func basketListLoaded(basketList: [Basket]) {
        self.isListLoaded=true
        self.basketList=basketList
    }
}
