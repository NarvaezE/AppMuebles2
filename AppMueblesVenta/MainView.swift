//
//  MainView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 01/08/22.
//

import SwiftUI

struct MainView: View {
    
    //Current tab
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedHomeDataModel = SharedHomeDataModel()
    
    
    @Namespace var animation
    init(){
        UITabBar.appearance().isHidden = true
        
    }
    var body: some View {
        //if settings.isLoggedIn{
            VStack(spacing:0){
                TabView(selection: $currentTab){
                    Home(animation:animation)
                        .environmentObject(sharedData)
                        .tag(Tab.Home)
                    Liked()
                        .environmentObject(sharedData)
                        .tag(Tab.Liked)
                    
                    Explore(animation: animation)
                        .environmentObject(sharedData)
                        .tag(Tab.Explore)
                    Cart()
                        .environmentObject(sharedData)
                        .tag(Tab.Cart)
                    Profile()
                        .tag(Tab.Profile)
                }
                
                HStack(spacing:0){
                    ForEach(Tab.allCases,id: \.self){ tab in
                        Button{
                            currentTab = tab
                        }label: {
                            Image(tab.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                                .background(
                                    Color("main_color")
                                        .opacity(0.1)
                                        .cornerRadius(5)
                                    //blurring
                                        .blur(radius: 5)
                                    //haciendolo mas pequeño
                                        .padding(-7)
                                        .opacity(currentTab == tab ? 1 : 0)
                                    
                                )
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ?
                                                 Color("main_color"):
                                                    Color.black.opacity(0.3))
                        }
                    }
                }.padding([.horizontal,.top])
                    .padding(.bottom,10)
            }.overlay(
                
                ZStack{
                    //Pagina detalle
                    if let product =
                        sharedData.detailHomeProduct,sharedData
                        .showDetailHomeProducts{
                        
                        HomeProductDetailView(product: product,
                                              animation:animation)
                        .environmentObject(sharedData)
                    }
                }
            )

//        }else{
//            NavigationView {
//                VStack(alignment: .leading){
//                    Text("Welcome Back!").font(.system(size: 25)).padding(.bottom,10)
//                    Text("Please sign in to your \naccount").font(.system(size: 27)).fontWeight(.semibold)
//
//                    TextField("Email or phone number",
//                              text:$email
//                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
//                        .foregroundColor(Color.black)
//
//                    SecureField("Password",
//                              text:$password
//                    ).padding().background(Color("gris")).cornerRadius(20).disableAutocorrection(true)
//                        .foregroundColor(Color.black)
//
//                    NavigationLink(
//                        destination: ForgotPassView().navigationBarHidden(true),
//                        label: {
//                            Text("Forget password?").padding(.trailing,15).padding(.bottom,40).foregroundColor(Color.black)
//
//                        }
//                    ).navigationBarHidden(true)
//
//                    Button{
//                        settings.isLoggedIn = true
//                    }label:{
//                        Text("Sign In").font(.system(size: 20))
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color.white)
//                            .padding(22)
//                            .padding(.horizontal,122)
//                            .background(Color("main_color")
//                                .cornerRadius(40))
//                    }
//
//                    Button(action: {
//
//                    }, label: {
//                        HStack{
//                            Image("gicon").padding(.leading)
//                            Text("Sign In With Google").font(.system(size: 20))
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.white)
//                                .padding(25)
//                                .padding(.horizontal,25)
//
//                        }.background(Color("google_color")
//                            .cornerRadius(40))
//                    })
//                    HStack(alignment: .center){
//                        Text("Don´t have an Account?")
//
//                        NavigationLink(
//                            destination: SignUpView().navigationBarHidden(true),
//                            label: {
//                                Text("Sign Up").foregroundColor(Color("main_color"))
//
//                            }
//                        ).navigationBarHidden(true)
//                    }.padding(.leading,45)
//
//                    Spacer()
//
//                }.padding(.horizontal,30)
//            }
//        }
//
   }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 11")
    }
}

enum Tab:String,CaseIterable{
    case Home = "Home"
    case Liked = "Liked"
    case Explore = "Explore"
    case Cart = "Cart"
    case Profile = "Profile"
}
