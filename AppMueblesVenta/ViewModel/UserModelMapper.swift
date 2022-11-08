//
//  UserModelMapper.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 06/10/22.
//

import Foundation

struct UserModelMapper {
    func mapDataModelToModel(dataModel:DataModelUser) -> UserModel{
        guard let user = dataModel.data.token.first else{
            return .empty
        }
        let name = dataModel.data.name
        
        return UserModel(name: dataModel.data.name, lastname: dataModel.data.lastname, avatar: URL(string: dataModel.data.avatar), email: dataModel.data.email, role: dataModel.data.role, token: dataModel.data.token)
    }
}
