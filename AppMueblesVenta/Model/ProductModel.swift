//
//  ProductModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 10/10/22.
//

import Foundation


struct ProductModel {
    let id:Int?
    let name:String?
    let slug:String?
    let description:String?
    let features:String?
    let cover:String?
    let brand_id:Int?
    let brand:Brands?
    let tags:[Tag]?
    let categories:[Category]?
    let providers:[String]?
    let presentation:[Presentations]?
    
    static let empty: ProductModel = .init(id: 1,name: "No producto",
                                        slug: "No-producto",
                                        description: "Una descripcion",
                                        features: "Una caracteristica",
                                        cover: "https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg",
                                        brand_id: nil,
                                           brand: nil,
                                           tags: [],
                                        categories: [],
                                        providers:[],
                                        presentation: []
                                        )
}
