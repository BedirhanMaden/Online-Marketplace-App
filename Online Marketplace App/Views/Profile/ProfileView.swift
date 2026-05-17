//
//  ProfileView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 3.01.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settings: Settings
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        if(viewModel.moveToNextView && settings.currentUser == nil ){

            NavigationStack{

                NavigationLink("Click To Log In", destination: SignInView())

            }


            //TODO change moveToNextView

        }else{
            VStack{

                TitleText(text: "ProfileView")

                Spacer()

                if(settings.currentUser==nil){
                    TitleText2(text: "No currentuser")
                }else{
                    TitleText2(text: settings.currentUser?.email ?? "ww")
                }

                ButtonDS(buttonText: "Edit", buttonImageName: "Button") {

                }

                ButtonDS(buttonText: "Log Out", buttonImageName: "Button") {
                    viewModel.logOut()
                    settings.currentUser=nil
                    settings.currentBasket=nil

                }
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
