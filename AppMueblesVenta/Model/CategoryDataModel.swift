//
//  CategoryDataModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 03/11/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let prodiuctDataModel = try? newJSONDecoder().decode(ProdiuctDataModel.self, from: jsonData)

import Foundation

// MARK: - ProdiuctDataModel
struct Response: Decodable {
    let message: String
    let code: Int
    let data: [Categories]
    enum CodingKeys: String, CodingKey{
        case message
        case code
        case data
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
        self.data = try container.decode([Categories].self,forKey: .data)
        
    }
}

// MARK: - Datum
struct Categories: Decodable {
    let id: Int
    let name, datumDescription, slug: String
    let categoryID: Int?
    let products: [Productoss]

    enum CodingKeys: String, CodingKey {
        case id, name
        case datumDescription = "description"
        case slug
        case categoryID = "category_id"
        case products
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.datumDescription = try container.decode(String.self, forKey: .datumDescription)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.categoryID = try container.decode(Int.self, forKey: .categoryID)
        self.products = try container.decode([Productoss].self, forKey: .products)
    }
}

// MARK: - Product
struct Productoss: Decodable {
    let id: Int
    let name, slug, productDescription, features: String
    let cover: String?
    let brandID: Int?
    let pivot: pivotCat

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case productDescription = "description"
        case features, cover
        case brandID = "brand_id"
        case pivot
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.productDescription = try container.decode(String.self, forKey: .productDescription)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.features = try container.decode(String.self, forKey: .features)
        self.cover = try container.decodeIfPresent(String.self, forKey: .cover)
        self.brandID = try container.decodeIfPresent(Int.self, forKey: .brandID)
        self.pivot = try container.decode(pivotCat.self, forKey: .pivot)
    }
}

// MARK: - Pivot
struct pivotCat: Decodable {
    let categoryID, productID: Int

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case productID = "product_id"
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categoryID = try container.decode(Int.self, forKey: .categoryID)
        self.productID = try container.decode(Int.self, forKey: .productID)
    }
}
