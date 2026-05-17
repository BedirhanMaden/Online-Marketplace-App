//
//  CategoryDataSource.swift
//  TestProject
//
//  Created by Bedirhan Maden on 16.12.2023.
//

import Foundation

struct CategoryDataSource{

    var delegate: CategoryDataSourceDelegate?


    func loadCategoryData() {
        let url = URL(string: "https://dummyjson.com/products/categories")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                do {
                    // Assuming the response is an array of strings
                    let categories = try JSONSerialization.jsonObject(with: data, options: []) as? [String]
                    delegate?.categoriesLoaded(categories: categories ?? [])
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
    }


    }


