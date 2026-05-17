//
//  CartRowView.swift
//  TestProject
//
//  Created by Bedirhan Maden on 10.01.2024.
//

import SwiftUI

struct CartRowView: View {
    private var product:Product


    init(product: Product) {
        self.product = product

    }

    var body: some View {



            HStack{

                AsyncImage(url: URL(string: product.thumbnail ?? " " )){ image in

                    image.resizable() .scaledToFill()

                } placeholder: {
                        LoadingView()

                }.frame(width: 150,height: 150, alignment: .leading).clipShape(RoundedRectangle(cornerRadius: Radius.radius_5)).shadow(radius: 5).padding(Spacing.spacing_2)
                Spacer()
                VStack{
                    TitleText3(text: product.title ?? " " )

                    if(product.discountPercentage!>0){
                        HStack{
                            Text(("$" + String(product.price ?? 1))).font(.caption).strikethrough().foregroundColor(.black)
                            let newPrice = product.price! - (Int(Double(product.price!) * product.discountPercentage! / 100))

                            Text(("$" + String(newPrice))).foregroundColor(.teal).font(.title3)                       }
                    }else{
                        Text(("$" + String(product.price!))).foregroundColor(.teal).font(.title3)

                    }

                }.padding(Spacing.spacing_2)

            }
    }
}

#Preview {
    CartRowView(product: Product())
}
