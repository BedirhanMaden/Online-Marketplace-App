//
//  TitleText2.swift
//  TestProject
//
//  Created by Bedirhan Maden on 9.01.2024.
//

import SwiftUI

struct TitleText2: View {
    private let text: String

    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text( text).font(.title).bold().padding(.vertical,Spacing.spacing_2).shadow(radius: Radius.radius_3).foregroundColor(.titleText2)
    }
}
#Preview {
    TitleText2(text: "String")
}
