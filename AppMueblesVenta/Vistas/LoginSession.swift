//
//  LoginSession.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 14/09/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class NetworkController{
    
    
    func executeApiLogin(){
//        guard let url = URL(string: "https://crud.jonathansoto.mx/api/login")else {return}
//
//        var request = URLRequest(url:url)
//        request.httpMethod = "POST"
//
//        request.httpBody = postData
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "email",
            "value": "jsoto@uabcs.mx",
            "type": "text"
          ],
          [
            "key": "password",
            "value": "password123",
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
              print("login erroneo")
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
            print("Login correcto")
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}



//var semaphore = DispatchSemaphore (value: 0)
//
//let parameters = [
//  [
//    "key": "email",
//    "value": "jsoto@uabcs.mx",
//    "type": "text"
//  ],
//  [
//    "key": "password",
//    "value": "password123",
//    "type": "text"
//  ]] as [[String : Any]]
//
//let boundary = "Boundary-\(UUID().uuidString)"
//var body = ""
//var error: Error? = nil
//for param in parameters {
//  if param["disabled"] == nil {
//    let paramName = param["key"]!
//    body += "--\(boundary)\r\n"
//    body += "Content-Disposition:form-data; name=\"\(paramName)\""
//    if param["contentType"] != nil {
//      body += "\r\nContent-Type: \(param["contentType"] as! String)"
//    }
//    let paramType = param["type"] as! String
//    if paramType == "text" {
//      let paramValue = param["value"] as! String
//      body += "\r\n\r\n\(paramValue)\r\n"
//    } else {
//      let paramSrc = param["src"] as! String
//      let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//      let fileContent = String(data: fileData, encoding: .utf8)!
//      body += "; filename=\"\(paramSrc)\"\r\n"
//        + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//    }
//  }
//}
//body += "--\(boundary)--\r\n";
//let postData = body.data(using: .utf8)
//
//var request = URLRequest(url: URL(string: "https://crud.jonathansoto.mx/api/login")!,timeoutInterval: Double.infinity)
//request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//request.httpMethod = "POST"
//request.httpBody = postData
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//  guard let data = data else {
//    print(String(describing: error))
//    semaphore.signal()
//    return
//  }
//  print(String(data: data, encoding: .utf8)!)
//  semaphore.signal()
//}
//
//task.resume()
//semaphore.wait()
//
