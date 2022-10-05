//
//  PruebaDataModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 03/10/22.
//

import SwiftUI


struct PruebaDataModel: View {
    @State var userViewModel = UserViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                await userViewModel.loginTest(e: "enarvaez_19@alu.uabcs.mx", p: "14a@u8EQk#!dtU")
            }
    }
}

struct PruebaDataModel_Previews: PreviewProvider {
    static var previews: some View {
        PruebaDataModel()
    }
}
