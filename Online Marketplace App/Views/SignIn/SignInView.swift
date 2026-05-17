//
//  SignInScreen.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import SwiftUI
import Firebase
struct SignInView: View {
    @StateObject var viewModel=SignInViewModel()
    @EnvironmentObject var settings: Settings


    var body: some View {

        if(viewModel.isNextViewActive){
            MainView().environmentObject(settings)
            //TODO here

        }else{
            if viewModel.isListLoaded != true{
                LoadingView().onAppear{
                    viewModel.loadList()
                }
            }else{
                NavigationStack{

                    VStack(content: {
                        TitleText(text: "Shopping App")
                        Spacer()
                        TextDS(text: viewModel.errorMessage)
                        TextField("Email", text: $viewModel.userName)
                        .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.top, 20).textFieldStyle(.roundedBorder).frame(width: 250, height: 60, alignment: .center)

                        SecureField("Password", text: $viewModel.password).autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.top, 20).textFieldStyle(.roundedBorder).frame(width: 250, height: 60, alignment: .center)


                        ButtonDS(buttonText: "Sign In", buttonImageName: "Button") {
                            viewModel.signIn()
                            
                        }


                        NavigationLink("Don't Have an Account? Click Here", destination: SignUpView())

                        Spacer()

                    }).onTapGesture {

                        self.endTextEditing()
                  }.onAppear(perform: {

                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil{
                                var currentUser = User(email: user?.email)

                                viewModel.basketDataSource.getUserBasket(uid: user?.uid ?? "nouser")
                                var currentBasket = viewModel.basketDataSource.userBasket

                                if(currentBasket == nil){
                                    print("Basket not found")
                                    currentBasket = Basket(uid: user?.uid ?? "bb", products: [])
                                    viewModel.basketDataSource.addBasket(basket: currentBasket!, uid: currentBasket!.uid )
                                }
                                settings.currentUser=currentUser
                                settings.currentBasket=currentBasket
                                viewModel.isNextViewActive.toggle()


                            }
                        }
                    })
                }

            }
        }
    }
}
extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}

#Preview {
    SignInView()
}
