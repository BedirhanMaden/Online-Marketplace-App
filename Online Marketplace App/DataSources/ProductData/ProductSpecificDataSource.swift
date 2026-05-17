//
//  ProductSpecificDataSource.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import Foundation

struct ProductSpecificDataSource{

    private let baseURL="https://dummyjson.com"
    var delegate: ProductSpecificDataSourceDelegate?

    func loadPostData(productId: Int){

        let session=URLSession.shared
        if let url=URL(string: "\(baseURL)/products/\(productId)"){
            print("found the url")
            var request = URLRequest(url: url)
            request.httpMethod="GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            print("just before data task")
            let dataTask = session.dataTask(with: request) { data, response, error in

                print("cam enter this area")
                guard let data else {print("error in data"); return}
                let decoder = JSONDecoder()
                do{
                    print("Ready to decode")
                    let product = try decoder.decode(Product.self, from: data)
                    DispatchQueue.main.async {

                        delegate?.productLoaded(product: product)
                    }

                }catch {
                    print(error)
                }

            }
            dataTask.resume()
        }
    }
}


