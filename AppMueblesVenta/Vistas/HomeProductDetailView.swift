//
//  HomeProductDetailView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 22/08/22.
//

import SwiftUI

struct HomeProductDetailView: View {
    @EnvironmentObject var sharedData: SharedHomeDataModel
    var product: Productos
    //let colors: [Color] = [.blue,.brown,.orange,.red,.black]
    @EnvironmentObject var sharedHomeData: SharedHomeDataModel
    @EnvironmentObject var homeData: HomeViewModel
    @State var seleccionado: Int = 0
    private let colors: [String] = ["navy","gold","verde","red","morado"]
    var animation: Namespace.ID
//    init(){
//        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
//            UIPageControl.appearance().pageIndicatorTintColor = .gray
//    }
    
    var body: some View {
        
        ZStack {
            Color("fondo").edgesIgnoringSafeArea(.all)
                
            VStack{
                HStack{
                    Button{
                        withAnimation(.easeInOut){
                            sharedData.showDetailHomeProducts = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Spacer()
                    
                    Text("Product")
                    Spacer()
                    Button{
                        
                    } label: {
                        Image(systemName: "plus.viewfinder")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Button{
                        
                    } label: {
                        Image(systemName: "bag")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }.padding(.horizontal)
                TabView{
                    TabView{
                        Image(product.productImg[seleccionado]).resizable().scaledToFit()
                            .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                    }.tabViewStyle(PageTabViewStyle()).background(Color("gris")).accentColor(Color("main_color"))
                }.frame(width: UIScreen.main.bounds.width - 20, height: 250, alignment: .center)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Array(product.productImg.enumerated()), id: \.offset) { index, element in
                            Button{
                                seleccionado=index
                            }label:{
                                if (index==seleccionado){
                                    Image(product.productImg[index]).resizable().frame(width: 80, height: 80).cornerRadius(8).background(Color("gris")).overlay{
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color("main_color"))
                                    }
                                }else{
                                    Image(product.productImg[index]).resizable().frame(width: 80, height: 80).background(Color("gris")).cornerRadius(15)
                                }
                                
                            }
                                
                        }
    
                    }
                }.padding(.horizontal)
                VStack (alignment: .leading){
                    HStack {
                        Text("GAMMALBYN").font(.system(size: 20)).fontWeight(.semibold)
                        Spacer()
                        Button {
                            addToLiked()
                        }label:{
                            Image(systemName: "heart.fill").foregroundColor(isLiked() ? .red: Color.black.opacity(0.75)).frame(width: 30, height: 30).cornerRadius(100).background(Color("gris"))
                        }
                    }.padding(.horizontal)
                    VStack(alignment: .leading, spacing: 8){
                        HStack (spacing:8){
                            Text(product.title+","+product.color).foregroundColor(.gray).padding(.horizontal)
                                .padding(.top, 1)
                            HStack(alignment: .lastTextBaseline, spacing:-1){
                                Spacer()
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill").foregroundColor(.gray)
                                Text("(24 Review)").font(.system(size: 15))
                                
                            }.font(.system(size: 10)).padding(.horizontal).padding(.top,8)
                        }
                        Text(product.price).font(.system(size: 22)).fontWeight(.bold).foregroundColor(Color("main_color")).padding(.horizontal).padding(.top,5)
                        HStack{
                            VStack {
                                Text("Color").padding(.horizontal).font(.system(size: 18))
                                HStack {
                                    ForEach(colors, id:\.self){ color in
                                        Circle()
                                            .foregroundColor(Color(color))
                                            .frame(width: 20, height: 20)
                                            
                                            
                                    }
                                }.padding(.horizontal)
                            }
                            
                            Spacer()
                            HStack{
                                Spacer()
                                Text("\(product.quantity)")
                                Spacer()
                                VStack(spacing:4){
                                    Button{
                                        //product.quantity += 1
                                    }label:{
                                        Image(systemName: "arrowtriangle.up.fill").font(.subheadline).foregroundColor(Color("main_color"))
                                    }
                                    
                                    Button{
                                        //product.quantity = (product.quantity > 0 ? (product.quantity -1):0)
                                    }label:{
                                        Image(systemName: "arrowtriangle.down.fill").font(.subheadline).foregroundColor(Color("main_color"))
                                    }
                                }.padding(8)
                            }.frame(width: 80, height: 33, alignment: .trailing).background(
                                Color("gris")
                            ).overlay{
                                RoundedRectangle(cornerRadius:  5)
                                    .stroke(Color("main_color"))
                                
                            }.padding(.horizontal)
                            
                        }
                            
                        
                    }

                }.padding(.top)
                VStack {
                    HStack{
                        Text("Materials")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding(.horizontal)
                    Divider()
                    HStack{
                        Text("Dimensions")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding(.horizontal)
                }.padding(.top)
                
                Spacer()
                HStack{
                    Button{
                        addToCart()
                    }label: {
                        Text("\(isAddedToCart() ? "Added ": "Add ")to cart").font(.system(size: 15))
                                .fontWeight(.semibold).frame(width: .infinity, height: 45).padding(.horizontal,30)
                                .foregroundColor(Color("main_color"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color("main_color"),lineWidth: 2)
                                )
                        }
                    
                    Button{
                        
                    }label: {
                        Text("Buy Now").font(.system(size: 15))
                            .fontWeight(.semibold)
                            .frame(width: .infinity, height: 45)
                            .padding(.horizontal,30)
                            .foregroundColor(Color.white)
                            .background(Color("main_color")
                            .cornerRadius(40))
                    }
                    
                }
            }
            
        }
    }
    func isLiked()->Bool{
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    func isAddedToCart()->Bool{
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    func addToLiked(){
        if let index = sharedData.likedProducts.firstIndex(where: {product in
            return self.product.id == product.id
        }){
            sharedData.likedProducts.remove(at: index)
        }else{
            sharedData.likedProducts.append(product)
        }
    }
    func addToCart(){
        if let index = sharedData.cartProducts.firstIndex(where: {product in
            return self.product.id == product.id
        })
        {
            sharedData.cartProducts.remove(at: index)
        }else{
            sharedData.cartProducts.append(product)
        }
    }
}

struct HomeProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
