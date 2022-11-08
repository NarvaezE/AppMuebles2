//
//  CategoryViewModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 10/10/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif



final class CategoryViewModel: ObservableObject{
    
//    @Published var userModel: UserModel = .empty
//    @Published var userModelMapper: UserModelMapper = UserModelMapper()
    func getCategories(){
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/categories")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer 2995|fkgoqRMGnBqlNbRekQCPUJb1ysvJ6LgFJjWVyGSS", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return
    }
}
