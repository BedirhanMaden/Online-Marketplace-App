//
//  LoadingView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(){
            ProgressView()
            Text("Loading")
        }

    }
}

#Preview {
    LoadingView()
}
