//
//  ButtonDS.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import SwiftUI

struct ButtonDS: View {
    private let buttonText: String
    private let buttonImageName: String
    private let action: () -> Void

    init(buttonText: String, buttonImageName: String, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.buttonImageName = buttonImageName
        self.action = action
    }


    var body: some View {
        Button {
            action()
        } label: {
            Image(buttonImageName).resizable().frame(width: 100,height: 60).scaledToFit().overlay {
                Text(buttonText).font(.title2).bold().foregroundColor(.white)
            }
        }.padding(Spacing.spacing_2)

    }
}

#Preview {
    ButtonDS(buttonText: "test", buttonImageName: "test", action: {})
}
