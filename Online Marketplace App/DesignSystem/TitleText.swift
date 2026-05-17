//
//  TitleText.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import SwiftUI

struct TitleText: View {
    private let text: String

    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text( text).font(.largeTitle).bold().padding(.vertical,Spacing.spacing_2).shadow(radius: Radius.radius_3).foregroundColor(.titleText)
    }
}
#Preview {
    TitleText(text: "String")
}
