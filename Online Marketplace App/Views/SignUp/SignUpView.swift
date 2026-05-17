//
//  SignUpView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 3.01.2024.

//
import SwiftUI
struct SignUpView: View {
    @StateObject private var viewModel=SignUpViewModel()
    @EnvironmentObject var settings: Settings

    var body: some View {


        NavigationStack{

            VStack(content: {
                TitleText(text: "Shopping App")
                Spacer()
                TextDS(text: viewModel.errorMessage)
                TextField("Email", text: $viewModel.userName).autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20).textFieldStyle(.roundedBorder).frame(width: 250, height: 60, alignment: .center)

                SecureField("Password", text: $viewModel.password).autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20).textFieldStyle(.roundedBorder).frame(width: 250, height: 60, alignment: .center)

                NavigationLink(destination: SignInView(), isActive: $viewModel.isNextViewActive){

                    ButtonDS(buttonText: "Sign Up", buttonImageName: "Button") {

                        viewModel.signUp()
                      


                    }
                }
                NavigationLink("Have an Account? Click Here", destination: SignInView())

                Spacer()
            })
        }

    }
}

#Preview {
    SignInView()
}
