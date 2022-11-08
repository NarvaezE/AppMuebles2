//
//  ViewModelProducto.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 12/10/22.
//

//import Foundation
//
//struct DataModelProduct:Decodable, Equatable{
//    let message:String
//    let code:Int
//    let data:[String]
//    let error:String?
//    
//    static func == (lhs: DataModelProduct, rhs: DataModelProduct) -> Bool {
//        return lhs.message == rhs.message &&
//        lhs.code == rhs.code &&
//        lhs.data == rhs.data &&
//        lhs.error == rhs.error
//    }
//}
//
//final class ViewModelProducto{
//    func executeRequest(){
//        let productUrl = URL(string: "https://crud.jonathansoto.mx/api/products")!
//        
//        URLSession.shared.dataTask(with: productUrl){ data, response, error in
//            let productModel = try! JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: data)
//        }
//    }
//}
