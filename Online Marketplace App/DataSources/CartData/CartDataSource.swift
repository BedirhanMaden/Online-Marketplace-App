//
//  CartDataSource.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import Foundation


struct CartDataSource{
    private let baseURL="https://dummyjson.com"
    var delegate: CartDataSourceDelegate?


    func loadCartData(){

        let session=URLSession.shared
        if let url=URL(string: "\(baseURL)/carts"){
            print("found the url")
            var request = URLRequest(url: url)
            request.httpMethod="GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            print("just before data task")
            let dataTask = session.dataTask(with: request) { data, response, error in

                print("can enter this area")
                guard let data else {print("error in data"); return}
                let decoder = JSONDecoder()
                do{
                    print("Ready to decode")
                    let cartDataReceiver = try decoder.decode(CartDataReceiver.self, from: data)
                    let cartList=cartDataReceiver.carts
                    DispatchQueue.main.async {

                        delegate?.cartsLoaded(carts: cartList ?? [])
                    }

                }catch {
                    print(error)
                }

            }
            dataTask.resume()
        }
    }


}
