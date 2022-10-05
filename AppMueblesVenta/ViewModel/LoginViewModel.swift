//
//  LoginViewModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 30/09/22.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var showProgressView = false
    
    func login(completion: @escaping (Bool)->Void){
        showProgressView = true
    }
}
