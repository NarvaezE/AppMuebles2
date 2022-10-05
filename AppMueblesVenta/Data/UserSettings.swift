//
//  UserSettings.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 14/09/22.
//

import Foundation

class UserSettings: ObservableObject{
    
    @Published var isLoggedIn : Bool{
        didSet{
            UserDefaults.standard
                .set(isLoggedIn,forKey: "login")
        }
    }
    init(){
        self.isLoggedIn = false
    }
}
