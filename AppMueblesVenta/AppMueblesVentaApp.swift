//
//  AppMueblesVentaApp.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/07/22.
//

import SwiftUI

@main
struct AppMueblesVentaApp: App {
    
    
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup{
            if authentication.isValidated{
                MainView()
                    .environmentObject(authentication)
            }else{
                MainView()
                    
            }
        }
    }
}
