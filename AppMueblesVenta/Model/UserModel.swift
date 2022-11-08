//
//  UserModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 06/10/22.
//

import Foundation

struct UserModel {
    let name:String
    let lastname:String
    let avatar:URL?
    let email:String
    let role:String
    let token:String
    
    static let empty: UserModel = .init(name: "Edgar Daniel",
                                        lastname: "Narvaez Mariche",
                                        avatar: URL(string: "https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg"),
                                        email: "enarvaez_19@alu.uabcs.mx",
                                        role: "Administrador",
                                        token:"No to")
}
