//
//  Cart.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 19/08/22.
//

import SwiftUI

struct Cart: View {
    @EnvironmentObject var sharedData: SharedHomeDataModel
    
    @State var showDeleteOptions: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    HStack{
                        Spacer()
                        Text("Cart")
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
                    HStack{
                        Text("25").font(.system(size: 35)).padding(.leading)
                        Text("% OFF").font(.system(size: 20))
                        Text("|").font(.system(size: 45))
                        Text("use code Wooden \nat Checkout").font(.system(size: 20)).padding(.trailing)
                    }.frame(width: .infinity, height: 100).background(Color("salmon")).cornerRadius(20)
                    
                    if sharedData.cartProducts.isEmpty{
                        Text("No Products Added")
                    }else{
                        
                        HStack {
                            VStack (spacing:15){
                                
                                ForEach(sharedData.cartProducts){ product in
                                    
                                    HStack (spacing:0){
                                        
                                        if showDeleteOptions{
                                            Button{
                                                deleteCartProducts(product:product)
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
                                VStack{
                                    Spacer()
                                    NavigationLink(
                                        destination: MainView().navigationBarHidden(true),
                                        label: {
                                            Text("Checkout").font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color.white)
                                                .padding(22)
                                                .padding(.horizontal,122)
                                                .background(Color("main_color")
                                                    .cornerRadius(40))
                                        }
                                    )
                                    
                                    HStack {
                                        Text("Total")
                                        Spacer()
                                        Text(sharedData.getTotalPrice())
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
//
                    
                    
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
    func deleteCartProducts(product:Productos){
        if let index = sharedData.cartProducts.firstIndex(where:{
            currentProduct in
            return product.id == currentProduct.id
        }){
            let _ = withAnimation {
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
            .environmentObject(SharedHomeDataModel())
    }
}
