//
//  SignUpView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/07/22.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var lastname: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                VStack{
                    Text("Create a new Account!").font(.system(size: 25)).padding(.bottom,10)
                    Text("Please sign in to your \naccount").font(.system(size: 27)).fontWeight(.semibold)
                    
                    TextField("Name",
                              text:$name
                    ).padding().background(Color("gris")).cornerRadius(20)
                    
                    TextField("Lastname",
                              text:$lastname
                    ).padding().background(Color("gris")).cornerRadius(20)
                    
                    TextField("Email",
                              text:$email
                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
                    
                    TextField("Phone Number",
                              text:$phone
                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true).foregroundColor(Color.black)
                    
                    SecureField("Password",
                              text:$password
                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
                        .foregroundColor(Color.black)
                    Text("\n\n")
                }
                Button(action:{
                    apiCall().register(n:name,l:lastname,e:email,p:phone,pw:password)
                }, label: {
                    Text("Sign Up").font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(22)
                        .padding(.horizontal,122)
                        .background(Color("main_color")
                            .cornerRadius(40))
                })
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image("gicon").padding(.leading)
                        Text("Sign In With Google").font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding(25)
                            .padding(.horizontal,20)
                            
                    }.background(Color("google_color")
                        .cornerRadius(40))
                })
                HStack(alignment: .center){
                    Text("You have an Account?").padding(.leading,50)
                    
                    NavigationLink(
                        destination: SignInView(),
                        label: {
                            Text("Sign In").foregroundColor(Color("main_color"))
                            
                        }
                    ).navigationBarHidden(true)
                    
                    
                }
                Spacer()
                
            }.padding(.horizontal,30)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .previewDevice("iPhone 11")
    }
}
