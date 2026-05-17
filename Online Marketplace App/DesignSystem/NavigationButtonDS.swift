//
//  NavigationButtonDS.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import SwiftUI

struct NavigationButtonDS: View {
    private var buttonImageName: String
    private var buttonText: String
   
    init(buttonImageName: String, buttonText: String) {
        self.buttonImageName = buttonImageName
        self.buttonText = buttonText
    }

    var body: some View {
        Image(systemName: buttonImageName).resizable().frame(width: 100,height: 50).scaledToFit().overlay {
            Text(buttonText).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
        }.padding(Spacing.spacing_2)
    }
}

#Preview {
    NavigationButtonDS(buttonImageName: "String", buttonText: "String")
}
