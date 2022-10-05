//
//  Explore.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 19/08/22.
//

import SwiftUI

struct Explore: View {
    var animation:Namespace.ID
    @EnvironmentObject var sharedData: SharedHomeDataModel
    
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical) {
                VStack{
                    HStack{
                        Button{
//                            withAnimation(.easeInOut){
//                                sharedData.showDetailHomeProducts = false
//                            }
                        } label: {
                            Image(systemName: "line.2.horizontal.decrease.circle")
                                .font(.title2)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        
                        Spacer()
                        Text("Explore")
                        Spacer()
                        Button{
                            
                        } label: {
                            Image(systemName: "viewfinder")
                                .font(.title2)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        Button{
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                    }.padding(.horizontal)
                    

                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack (spacing:16){
                            ForEach(ProductTypeHome.allCases,id:\.self){type in
                                ProductTypeView(type: type)
                            }
                        }.padding(.horizontal)
                    }
                    //Productos
//                    ScrollView(.horizontal,showsIndicators: false)
//                    {
//                        HStack(spacing:15){
//                            ForEach(homeData.filteredProductsHome){ product in
//                                ProductHomeCardView(product:product)
//                            }
//                        }
//                    }
                    LazyVGrid(columns: [GridItem(.fixed(200)),GridItem(.fixed(200))],content: {
                        
                          ForEach(homeData.filteredProductsHome){ product in
                               ProductHomeCardView(product:product)
                            }
                        })
                    
                    
                }
//                .navigationBarTitle("Home").navigationBarTitleDisplayMode(.inline).toolbar(content: {
//                    ToolbarItem(placement: .navigationBarLeading){
//                        Button {
//
//                        }label:{
//                            Label("salir",systemImage: "line.2.horizontal.decrease.circle")
//                                .labelStyle(.iconOnly)
//                        }
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        Button {
//
//                        }label:{
//                            Label("salir",systemImage: "viewfinder")
//                                .labelStyle(.iconOnly)
//                        }
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        Button {
//
//                        }label:{
//                            Label("salir",systemImage: "magnifyingglass")
//                                .labelStyle(.iconOnly)
//                        }
//                    }
//                })
                .onChange(of: homeData.productType){ newValue in
                    homeData.filterProductsHome()
            }
            }.navigationBarHidden(true)
        }
    }
    @ViewBuilder
    func ProductHomeCardView(product:Productos)->some View{
        VStack(spacing: 10){
            ZStack {
                if sharedData.showDetailHomeProducts{
                    Image(product.productImg[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }else{
                    Image(product.productImg[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id:
                                    "\(product.id)IMAGE", in: animation)
                }
            }
            VStack(alignment: .leading){
                Text("New").font(.subheadline).foregroundColor(Color("main_color"))
                Text(product.title).fontWeight(.medium)
                Text(product.price)
            }.padding()
        }.frame(width: 200,height: 300)
            .background(Color("gris"))
            .cornerRadius(20.0)
            .shadow(color: Color.black.opacity(0.02), radius: 16, x: 16, y: 16)
            .onTapGesture {
                withAnimation(.easeInOut){
                    sharedData.detailHomeProduct = product
                    sharedData.showDetailHomeProducts = true
                }
            }
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductTypeHome)->some View{
        Button{
            withAnimation {
                homeData.productType = type
            }
        }label:{
            Text(type.rawValue).fontWeight(.medium)
                .foregroundColor(homeData.productType == type ?
                                 Color.white : Color.black)
                .padding(10)
                .padding(.horizontal)
                .background(ZStack{
                    homeData.productType == type ?
                    Color("main_color") : Color.white
                })
                .cornerRadius(30).padding(.bottom).padding(.top)
            .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
                
        }
    }
}



var tabs2 = ["Trending Now","Sofa","Table","Chairs"]

struct CategoryBtn2: View {
    var text:String
    @Binding var selected: String
     var body: some View {
         Button(action: {
             selected = text
         }) {
             Text(text).fontWeight(.medium)
                 .foregroundColor(selected == text ? .white: .black)
                 .padding(10)
                 .padding(.horizontal)
                 .background(ZStack{
                     if (selected == text) {Color("main_color")}
                     else{
                         Color("gris")
                     }
                 })
                 .cornerRadius(30)
             .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
         }
    }
}

struct CategoriesView2: View {
    @State var selected_tab = tabs[0]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(tabs, id:\.self) { tab in
                    CategoryBtn(text: tab,selected:$selected_tab)
                }
            }.padding(.vertical)
        }
    }
}

struct HomeProductsView2: View {
    var name: String
    var img:String
    var price:Int
    var body: some View {
        VStack(alignment: .leading){
            ZStack {
                Image(img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            VStack(alignment: .leading){
                Text("New").font(.subheadline).foregroundColor(Color("main_color"))
                Text(name).fontWeight(.medium)
                Text("$\(price)")
            }.padding()
        }.frame(width: 200,height: 300)
            .background(Color("gris"))
            .cornerRadius(20.0)
            .shadow(color: Color.black.opacity(0.02), radius: 16, x: 16, y: 16)
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
