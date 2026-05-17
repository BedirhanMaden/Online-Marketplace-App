//
//  CategoryViewModel.swift
//  TestProject
//
//  Created by Bedirhan Maden on 16.12.2023.
//

import Foundation

@MainActor
class CategoryViewModel:ObservableObject{

    @Published var categoryList : [String] = []
    @Published var areCategoriesLoaded: Bool = false
    var categoryDataSource = CategoryDataSource()

    init() {
        categoryDataSource.delegate=self
    }

    func loadCategories(){
        categoryDataSource.loadCategoryData()
    }

}

extension CategoryViewModel:CategoryDataSourceDelegate{
    func categoriesLoaded(categories: [String]) {
        self.areCategoriesLoaded=true
        self.categoryList=categories

    }

}

