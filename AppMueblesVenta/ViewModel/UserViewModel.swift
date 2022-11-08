//
//  UserViewModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 03/10/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class UserViewModel: ObservableObject{
    @Published var userModel: UserModel = .empty
    @Published var userModelMapper: UserModelMapper = UserModelMapper()
    
    func loginTest(e:String,p:String){
        var semaphore = DispatchSemaphore (value: 0)
        let parameters = [
          [
            "key": "email",
            "value": e,//enarvaez_19@alu.uabcs.mx
            "type": "text"
          ],
          [
            "key": "password",
            "value": p, //14a@u8EQk#!dtU
            "type": "text"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
              body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
              let fileData = try! NSData(contentsOfFile:paramSrc, options:[]) as Data
              let fileContent = String(data: fileData, encoding: .utf8)!
              body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/login")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            
            do {
                //print(String(data: data, encoding: .utf8)!)
                let dataModel = try JSONDecoder().decode(DataModelUser.self, from: data)
                print("Token del usuario: \(dataModel.data.token)")
            
                return
                DispatchQueue.main.async{
                    self.userModel = self.userModelMapper.mapDataModelToModel(dataModel: dataModel)
                    
                }
            } catch {
                print(error)
            }
            
            
            
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
                    //let dataModel = try JSONDecoder().decode(UserDataModel.self, from: json)
                  

    }
}
