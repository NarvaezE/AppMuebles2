//
//  SignInView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/07/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var settings: UserSettings
    @StateObject var user = UserViewModel()
    @StateObject var authentication = Authentication()
    
    var body: some View {
//        if settings.isLoggedIn{
//
//        }else{
            NavigationView {
                VStack(alignment: .leading){
                    Text(user.userModel.token)
                    Text("Welcome Back!").font(.system(size: 25)).padding(.bottom,10)
                    Text("Please sign in to your \naccount").font(.system(size: 27)).fontWeight(.semibold)
                    
                    TextField("Email or phone number",
                              text:$email
                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
                        .foregroundColor(Color.black)
                    
                    SecureField("Password",
                              text:$password
                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
                        .foregroundColor(Color.black)
                    
                    NavigationLink(
                        destination: ForgotPassView().navigationBarHidden(true),
                        label: {
                            Text("Forget password?").padding(.trailing,15).padding(.bottom,40).foregroundColor(Color.black)
                            
                        }
                    ).navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    
                    
                    NavigationLink(destination:
                          user.userModel.token != "156|Q30eaB28Z4FCQhaN8FtNwUkks9pXotTSbXWjpXhs" ? AnyView(MainView())
                        : user.userModel.token == "156|Q30eaB28Z4FCQhaN8FtNwUkks9pXotTSbXWjpXhs" ? AnyView(SignInView())
                           : AnyView(EmptyView())
                        ){
                            Text("Sign In").font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .padding(22)
                                    .padding(.horizontal,122)
                                    .background(Color("main_color")
                                        .cornerRadius(40))
                        }.simultaneousGesture(TapGesture().onEnded{
                            user.loginTest(e:email,p:password)
                        }).navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                    
                    
                    Button(action:{
                        
                    }, label: {
                        Text("Sign In").font(.system(size: 20))
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
                                .padding(.horizontal,25)
                                
                        }.background(Color("google_color")
                            .cornerRadius(40))
                    })
                    
                    HStack(alignment: .center){
                        Text("Don´t have an Account?")
                        
                        NavigationLink(
                            destination: SignUpView().navigationBarHidden(true),
                            label: {
                                Text("Sign Up").foregroundColor(Color("main_color"))
                                
                            }
                        ).navigationBarHidden(true)
                    }.padding(.leading,45)
                    
                    
                }.padding(.horizontal,30)
            }.navigationBarBackButtonHidden(true).navigationBarTitle("").navigationBarHidden(true)
        }
    
}

class Authenticate: ObservableObject{
    @Published var isValidated = false
    
    func updateValidation(success:Bool){
        withAnimation{
            isValidated = success
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone 11")
    }
}
