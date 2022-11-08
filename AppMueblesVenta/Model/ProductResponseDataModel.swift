//
//  ProductResponseDataModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 10/10/22.
//

import Foundation

struct ProductDataModel: Decodable {
    let message: String
    let code: Int
    let data: [DataClass]
    
    enum CodingKeys: String, CodingKey {
        case message
        case code
        case data
        
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
        self.data = try container.decode([DataClass].self,forKey: .data)
        
    }
}

// MARK: - DataClass
struct DataClass: Decodable ,Identifiable{
    let id: Int?
    let name, slug, dataDescription, features: String?
    let cover: String?
    let brandID: Int?
    let brand: Brands?
    let tags: [Tag]?
    let categories: [Category]?
    let providers: [String]?
    let presentations: [Presentations]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case dataDescription = "description"
        case features
        case cover
        case brandID = "brand_id"
        case brand
        case tags
        case categories
        case providers
        case presentations
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.slug = try container.decodeIfPresent(String.self,forKey: .slug)
        self.dataDescription = try container.decodeIfPresent(String.self,forKey: .dataDescription)
        self.features = try container.decodeIfPresent(String.self,forKey: .features)
        self.cover = try container.decodeIfPresent(String.self,forKey: .cover)
        self.brandID = try container.decodeIfPresent(Int.self, forKey: .brandID)
        self.brand = try container.decodeIfPresent(Brands.self,forKey: .brand)
        self.tags = try container.decodeIfPresent([Tag].self, forKey: .tags)
        self.categories = try container.decodeIfPresent([Category].self, forKey: .categories)
        self.providers = try container.decodeIfPresent([String].self, forKey: .providers)
        self.presentations = try container.decodeIfPresent([Presentations].self, forKey: .presentations)
    }
}

// MARK: - Brand
struct Brands: Decodable {
    let id: Int
    let name: String
    let brandDescription: String
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case brandDescription = "description"
        case slug
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.brandDescription = try container.decode(String.self,forKey: .brandDescription)
        self.slug = try container.decode(String.self, forKey: .slug)
    }
}


struct Tag: Decodable {
    let id: Int
    let name: String
    let tagDescription: String
    let slug: String
    let pivot:TagPivot

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagDescription = "description"
        case slug
        case pivot
    }
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.tagDescription = try container.decode(String.self,forKey: .tagDescription)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.pivot = try container.decode(TagPivot.self, forKey: .pivot)
    }
}

// MARK: - BrandPivot
struct BrandPivot: Decodable {
    let productID, brandID: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case brandID = "tag_id"
    }
}

// MARK: - TagPivot
struct TagPivot: Decodable {
    let productID, tagID: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case tagID = "tag_id"
    }
}


// MARK: - Category
struct Category: Decodable {
    let id: Int
    let name, categoryDescription, slug: String
    let categoryID: Int?
    let pivot: CategoryPivot

    enum CodingKeys: String, CodingKey {
        case id, name
        case categoryDescription = "description"
        case slug
        case categoryID = "category_id"
        case pivot
    }
}

// MARK: - CategoryPivot
struct CategoryPivot: Decodable {
    let productID, categoryID: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case categoryID = "category_id"
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productID = try container.decode(Int.self, forKey: .productID)
        self.categoryID = try container.decode(Int.self, forKey: .categoryID)
    }
}

// MARK: - Presentation
struct Presentations: Decodable {
    let id: Int
    let presentationDescription, code: String
    let weightInGrams: Int
    let status: String
    let cover: String?
    let stock, stockMin, stockMax, productID: Int
    let price: [Price]

    enum CodingKeys: String, CodingKey {
        case id
        case presentationDescription = "description"
        case code
        case weightInGrams = "weight_in_grams"
        case status, cover, stock
        case stockMin = "stock_min"
        case stockMax = "stock_max"
        case productID = "product_id"
        case price
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.presentationDescription = try container.decode(String.self, forKey: .presentationDescription)
        self.code = try container.decode(String.self, forKey: .code)
        self.weightInGrams = try container.decode(Int.self, forKey: .weightInGrams)
        self.status = try container.decode(String.self, forKey: .status)
        self.cover = try container.decodeIfPresent(String.self, forKey: .cover)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.stockMin = try container.decode(Int.self, forKey: .stockMin)
        self.stockMax = try container.decode(Int.self, forKey: .stockMax)
        self.productID = try container.decode(Int.self, forKey: .productID)
        self.price = try container.decode([Price].self, forKey: .price)
    }
}
    
    // MARK: - Price
struct Price: Decodable {
    let id: Int
    let amount: Double
    let is_current_price: Int
    let presentation_id: Int
        

    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case is_current_price
        case presentation_id
           
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.is_current_price = try container.decode(Int.self, forKey: .is_current_price)
        self.presentation_id = try container.decode(Int.self, forKey: .presentation_id)
        
    }
}
