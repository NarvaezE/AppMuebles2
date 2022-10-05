//
//  ApiResponseDataModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 03/10/22.
//

import Foundation

struct DataModelUser:Decodable{
    let message:String
    let code:Int
    let data:UserDataModel
    let error:String?
    
    enum CodingKeys:String, CodingKey {
        case message
        case code
        case data
        case error
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
        self.data = try container.decode(UserDataModel.self, forKey: .data)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        
    }
}

struct UserDataModel:Decodable{
    let id:Int
    let name:String
    let lastname:String
    let avatar:String
    let email:String
    let phone_number:String?
    let created_by:String
    let role:String
    let created_at:String
    let updated_at:String
    let token:String
    
    enum CodingKeys:String, CodingKey {
        case id
        case name
        case lastname
        case avatar
        case email
        case phone_number
        case created_by
        case role
        case created_at
        case updated_at
        case token
    }
    
    init (from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone_number = try container.decodeIfPresent(String.self, forKey: .phone_number)
        self.created_by = try container.decode(String.self, forKey: .created_by)
        self.role = try container.decode(String.self, forKey: .role)
        self.created_at = try container.decode(String.self, forKey: .created_at)
        self.updated_at = try container.decode(String.self, forKey: .updated_at)
        self.token = try container.decode(String.self, forKey: .token)
    }
}


//        {
//            "id": 1,
//            "name": "Jonathan",
//            "lastname": "Soto",
//            "avatar": "https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg",
//            "email": "jsoto@uabcs.mx",
//            "phone_number": "6123480678",
//            "created_by": "Jonathan Soto",
//            "role": "Administrador",
//            "created_at": "2022-09-24T17:25:25.000000Z",
//            "updated_at": "2022-09-24T17:25:25.000000Z"
//        }

//name
//lastname
//email
//phone_number
//role
//password
//profile_photo_file
      
