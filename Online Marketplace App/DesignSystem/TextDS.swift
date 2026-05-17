//
//  TextDS.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import SwiftUI

struct TextDS: View {
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text(text).bold().padding(.vertical,Spacing.spacing_2).shadow(radius: Radius.radius_3).foregroundColor(.black
        ).font(.callout).padding(.horizontal,Spacing.spacing_1)
    }
}

#Preview {
    TextDS(text: "")
}
