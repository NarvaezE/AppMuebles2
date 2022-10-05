//
//  Profile.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 19/08/22.
//

import SwiftUI

struct Profile: View {
    @State var email = "enarvaez_19@alu.uabcs.mx"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading){
                    HStack {
                        Image(systemName: "person.fill").resizable().frame(width: 40, height: 40).padding(.leading)
                        VStack(alignment: .leading){
                            Text("Usuario Registrado").font(.title)
                            NavigationLink(destination: (Text("Edit Account"))) {
                                Text("Edit Account").accentColor(Color("main_color"))
                            }
                            
                        }
                        Spacer()
                    }
                }.frame(width: .infinity, height: 80).background(Color("gris")).cornerRadius(50).padding(.top,20).padding(.horizontal,20).padding(.bottom,40)
                
                List{
                    ForEach(OpCuenta.opciones){opciones in
                        CardViewOpciones(opciones: opciones)
                    }
                }.listStyle(.plain)
                Button(action:{
                    apiCall().logout(e: email)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.backward").font(.system(size: 20))
                            
                        Text("Log out").font(.system(size: 20))
                            .fontWeight(.regular)
                    }.foregroundColor(Color("main_color"))
                        .padding(8)
                        .background(Color("color_button")
                            .cornerRadius(40))
                })
                NavigationLink(
                    destination: SignInView(),
                    label: {
                        HStack{
                            Image(systemName: "chevron.backward").font(.system(size: 20))
                                
                            Text("Log out").font(.system(size: 20))
                                .fontWeight(.regular)
                        }.foregroundColor(Color("main_color"))
                            .padding(8)
                            .background(Color("color_button")
                                .cornerRadius(40))
                        
                    }
                )
                   
                
                Spacer()
            }.navigationBarTitle("Account").navigationBarTitleDisplayMode(.inline).toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    }label:{
                        Label("salir",systemImage: "arrow.left")
                            .labelStyle(.iconOnly)
                    }
                }
                
            })
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
