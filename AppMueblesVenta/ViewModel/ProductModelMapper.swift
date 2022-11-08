//
//  ProductModelMapper.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 10/10/22.
//

import Foundation

struct ProductModelMapper {
    func mapDataModelToModel(dataModel:ProductDataModel)->[ProductModel]{
        guard let product = dataModel.data.first else{
            return [.empty]
        }
        var arrProducts=[ProductModel]()
        
        for (index, element) in dataModel.data.enumerated(){
            print("Item \(index): \(element)")
            
            let pModel = ProductModel(
                id:element.id ?? nil,
                name: element.name ?? nil,
                slug: element.slug ?? nil,
                description: element.dataDescription ?? nil,
                features: element.features ?? nil,
                cover: element.cover ?? nil,
                brand_id: element.brandID ?? nil,
                brand: element.brand ?? nil,
                tags: element.tags ?? [] ,
                categories: element.categories ?? [],
                providers: element.providers ?? [] ,
                presentation: element.presentations ?? [])
            arrProducts.append(pModel)
        }
        return arrProducts
    }
}
