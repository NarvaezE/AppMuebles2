//
//  ApiCall.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 15/09/22.
//

import Foundation
import SwiftUI

struct Users: Decodable,Identifiable {
    let message:String
    let created_at: String
    let created_by: String
    let email: String
    let id : Int
    let lastname: String
    let name: String
    let phone_number: String
    let role: String
    let token: String
    let updated_at: String

}

struct Root: Decodable {
   let users : [Users]

   enum CodingKeys : String, CodingKey { case users = "user" }
}

class apiCall: ObservableObject {
    func loginTest(e:String,p:String){
        var semaphore = DispatchSemaphore (value: 0)
        //token: 12|Mk2l93AQZaOt0RjXlXKcGRniFH7GrEHE4yqvKbt8
        let parameters = [
          [
            "key": "email",
            "value": e,//enarvaez_19@alu.uabcs.mx
            "type": "text"
          ],
          [
            "key": "password",
            "value": p,//c
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

//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//
//                semaphore.signal()
//                return
//          }
//            do{
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(String(data: data, encoding: .utf8)!)
//                print("//////////////////////////")
//                print( json)
//            }catch let error {
//                print(error.localizedDescription)
//            }
//
//            do{
//                let user = try JSONDecoder().decode(Root.self, from: data)
//
//
//                print(user)
//            }catch let error {
//                print(error.localizedDescription)
//                return
//            }
//
//
//
//          semaphore.signal()
//            return
//        }
//        task.resume()
//        semaphore.wait()
        
    }
    
    func getUserComments(completion: @escaping ([Users]) -> ()) {
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/users")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer 1|OafP1LnsrVjvkJzJamixf9yUFD4H0iU5pOu7bIZe", forHTTPHeaderField: "Authorization")

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
    }
    
    func recoverPassword(e:String){
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "email",
            "value": e,
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

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/forgot-password")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

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
    }
    
    func logout(e:String){
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "email",
            "value": "jsoto@uabcs.mx",
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

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/logout")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

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

    }
    
    func register(n:String,l:String,e:String,p:String,pw:String){
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "name",
            "value": n,
            "type": "text"
          ],
          [
            "key": "lastname",
            "value": l,
            "type": "text"
          ],
          [
            "key": "email",
            "value": e,
            "type": "text"
          ],
          [
            "key": "phone_number",
            "value": p,
            "type": "text"
          ],
          [
            "key": "created_by",
            "value": "jonathan soto",
            "type": "text"
          ],
          [
            "key": "role",
            "value": "Administrador",
            "type": "text"
          ],
          [
            "key": "password",
            "value": pw,
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

        var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/register")!,timeoutInterval: Double.infinity)
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

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

    }
    
    
}
