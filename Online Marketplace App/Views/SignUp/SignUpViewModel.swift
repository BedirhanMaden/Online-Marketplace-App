//
//  SignUpViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 3.01.2024.
//

import Foundation
import Firebase
class SignUpViewModel : ObservableObject{
    @Published var isNextViewActive=false
    @Published var userName = ""
    @Published var password = ""
    @Published var errorMessage = ""




    func moveToNextView(){
        isNextViewActive=true
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: userName, password: password) { result, error in
            if error != nil{
                print("Error in registration")
                print(error?.localizedDescription)
                self.errorMessage="Email or password is not valid. Please try again."
            }else{
                self.isNextViewActive=true
            }
        }
    }





}

