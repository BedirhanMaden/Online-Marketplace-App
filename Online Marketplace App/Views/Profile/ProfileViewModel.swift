//
//  ProfileViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 3.01.2024.
//

import Foundation
import Firebase
class ProfileViewModel : ObservableObject{
    
    @Published var moveToNextView: Bool = false

    func logOut(){
        do{
            try Auth.auth().signOut()
            moveToNextView=true
        }catch{
            print("Error signing out")
        }

    }






}
