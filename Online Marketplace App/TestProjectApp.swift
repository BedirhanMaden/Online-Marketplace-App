//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import SwiftUI
import Firebase

 class Settings: ObservableObject {
    @Published var currentUser: User? = nil
    @Published var currentBasket: Basket? = nil

}

@main
struct TestProjectApp: App {
    var settings = Settings()
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {

        WindowGroup {
            
            SignInView().environmentObject(settings)

        }
    }
}
