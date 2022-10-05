//
//  Liked.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 19/08/22.
//

import SwiftUI

struct Liked: View {
    @EnvironmentObject var sharedData: SharedHomeDataModel
    @State var showDeleteOptions: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    HStack{
                        Spacer()
                        Text("Favorites")
                        Spacer()
                        Button{
                            withAnimation {
                                showDeleteOptions.toggle()
                            }
                        }label:{
                            Image(systemName: "delete.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    }.padding(.horizontal)
                    
                    
                    if sharedData.likedProducts.isEmpty{
                        Text("No Liked Products")
                    }else{
                        
                        HStack {
                            VStack (spacing:15){
                                
                                ForEach(sharedData.likedProducts){ product in
                                    
                                    HStack (spacing:0){
                                        
                                        if showDeleteOptions{
                                            Button{
                                                deleteLikedProducts(product:product)
                                            }label:{
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }.padding(.trailing)
                                        }
                                        HStack{
                                            
                                            Image(product.productImg[0]).resizable().aspectRatio(contentMode: .fit)
                                            VStack(alignment: .leading, spacing: 8){
                                                Text(product.title)
                                                Text(product.price)
                                            }.padding()
                                        }.frame(width: .infinity, height: 100).background(Color("gris")).cornerRadius(20)
                                    }
                                }
                            }
                        }.padding(.horizontal)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.leading)
                            .background(
                                Color.white.cornerRadius(10)
                            )
                    }
//                    HStack{
//                        Image("sillon").resizable().aspectRatio(contentMode: .fit)
//                        VStack(alignment: .leading, spacing: 8){
//                            Text("Saloon Chair")
//                            Text("$150.00")
//                        }
//                        Text("1").frame(width: 50, height: 30).background(Color.white).cornerRadius(10).padding(.trailing).padding(.leading)
//                    }.frame(width: .infinity, height: 100).background(Color("gris")).cornerRadius(20)
//
//                    HStack {
//                        Text("Total:").font(.system(size: 20))
//                        Text("$200.00").font(.system(size: 25)).fontWeight(.semibold)
//                        Spacer()
//                    }.padding(.horizontal,40)
                    Spacer()
                    
                }.navigationBarTitle("Cart").navigationBarTitleDisplayMode(.inline).toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button {
                            
                        }label:{
                            Label("salir",systemImage: "arrow.left")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
            })
            }.navigationBarHidden(true).frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.white
                        .ignoresSafeArea()
                )
        }
    }
    func deleteLikedProducts(product:Productos){
        if let index = sharedData.likedProducts.firstIndex(where:{
            currentProduct in
            return product.id == currentProduct.id
        }){
            let _ = withAnimation {
                sharedData.likedProducts.remove(at: index)
            }
        }
    }
}

struct Liked_Previews: PreviewProvider {
    static var previews: some View {
        Liked()
            .environmentObject(SharedHomeDataModel())
    }
}
