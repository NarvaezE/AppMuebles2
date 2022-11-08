//
//  ProductViewModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 10/10/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class ProductViewModel: ObservableObject{
    @Published var productModel: [DataClass] = []
    @Published var prodPrueba: String = "Sin nombre"
    @Published var productModelMapper: ProductModelMapper = ProductModelMapper()
    
    func getProducts(token:String)async{
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/products")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            
            do {
                //print(String(data: data, encoding: .utf8)!)
                let dataModel = try JSONDecoder().decode(ProductDataModel.self, from: data)
                print("Nombre del producto: \(dataModel.data[0].name)")
                self.productModel=dataModel.data
                
//                DispatchQueue.main.async{
//                    dataModel.forEach { prod in
//                        print(prod)
//                        self.productModel = self.productModelMapper.mapDataModelToModel(dataModel: prod)
//                    }
//
//                    return
//                }
            } catch {
                print(error)
            }
            
            
          //print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
