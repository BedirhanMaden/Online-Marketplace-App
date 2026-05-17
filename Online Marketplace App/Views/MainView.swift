//
//  TabView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 2.01.2024.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView{
            TabView {

                HomeView().tabItem {
                    NavigationButtonDS(buttonImageName: "house.fill", buttonText: "Home")
                }.padding()

                CartView().tabItem {
                    NavigationButtonDS(buttonImageName: "basket.fill", buttonText: "Cart")
                }.padding()

                CategoryView().tabItem {
                    NavigationButtonDS(buttonImageName: "list.bullet", buttonText: "Categories")
                }.padding()

                ProfileView().tabItem {
                    NavigationButtonDS(buttonImageName: "person.crop.circle.fill", buttonText: "Profile")
                }.padding()
           
            }
        }
    }
}

#Preview {
    MainView()
}
