//
//  ForgotPassView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/07/22.
//

import SwiftUI

struct ForgotPassView: View {
    @State var email: String = ""
    var body: some View {
        VStack {
            
            Image("img_error").resizable().frame(width: 300, height: 300).padding(8)
                .padding(.bottom,60).padding(.top,30)
            VStack(alignment: .leading){
                
                
                Text("Forget password?").font(.system(size: 32)).fontWeight(.semibold).padding(.bottom,15)
                Text("Dont worry! it happens. Please enter the adress associated with your account").padding(.bottom,15)
                
                TextField("Email or Phone Number",
                          text:$email
                )   .padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
                    .foregroundColor(Color.black)
                
                
            }.padding(.horizontal,25)
            
            Button(action:{
                apiCall().recoverPassword(e: email)
            }, label: {
                Text("Submit").font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(22)
                    .padding(.horizontal,122)
                    .background(Color("main_color")
                        .cornerRadius(40))
            })
            
            Spacer()
        }
    }
}

struct ForgotPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassView()
    }
}
