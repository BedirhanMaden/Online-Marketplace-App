//
//  TitleText3.swift
//  TestProject
//
//  Created by Bedirhan Maden on 9.01.2024.
//


import SwiftUI

struct TitleText3: View {
    private let text: String

    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text(text).font(.title2).bold().padding(.vertical,Spacing.spacing_2).shadow(radius: Radius.radius_3).foregroundColor(.titleText3)
    }
}
#Preview {
    TitleText3(text: "String")
}
