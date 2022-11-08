//
//  PruebaDataModel.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 03/10/22.
//

import SwiftUI



@MainActor struct PruebaDataModel: View  {
    @State var userViewModel = UserViewModel()
    @StateObject var productos = ProductViewModel()
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Text("Producto: \(productos.prodPrueba)")
                    .task {
                        await productos.getProducts(token: "2755|N0a2n5NYMr3BWgcOJj2p39tFbzPDszFI2vH4AhW1")
                        //await productos.getProducts()
                        //userViewModel.loginTest(e: "enarvaez_19@alu.uabcs.mx", p: "14a@u8EQk#!dtU")
                    }
                var prodList = productos.productModel
//                prodList.forEach { prods in
//                    VStack{
//                        Text("\(prods.id ?? 10134)")
//                        Text(prods.name ?? "No name")
//                        //Image(URL(String:prods.cover ?? "No cover") )
//                    }
//                }
                ScrollView(.vertical){
                    VStack {
                        ForEach(prodList) { i in
                            HStack(alignment: .center) {
                                AsyncImage(
                                                url: URL(string: i.cover ?? "https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg"),
                                                content: { image in
                                                    image.resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100)
                                                        .padding(.all, 20)
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                                
                                        VStack(alignment: .leading) {
                                            Text( i.name ?? "no name")
                                                .font(.system(size: 26, weight: .bold, design: .default))
                                                .foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                                            Text(i.dataDescription ?? "no name")
                                                .font(.system(size: 16, weight: .bold, design: .default))
                                                .foregroundColor(.gray)
//                                            HStack {
//                                                Text("$" + String.init(format: "%0.2f", i.presentations.price))
//                                                    .font(.system(size: 16, weight: .bold, design: .default))
//                                                    .foregroundColor(.white)
//                                                    .padding(.top, 8)
//                                            }
                                        }.padding(.trailing, 20)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                                    .modifier(CardModifier())
                                    .padding(.all, 10)
                        }
                    }
                }
//                List(prodList){ prods in
//                    HStack(alignment: .center) {
//                        AsyncImage(
//                                        url: URL(string: prods.cover ?? "https://crud.jonathansoto.mx/storage/users/avatars/avantar.jpg"),
//                                        content: { image in
//                                            image.resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .frame(width: 100)
//                                                .padding(.all, 20)
//                                        },
//                                        placeholder: {
//                                            ProgressView()
//                                        }
//                                    )
//
//                                VStack(alignment: .leading) {
//                                    Text(prods.name ?? "no name")
//                                        .font(.system(size: 26, weight: .bold, design: .default))
//                                        .foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
//                                    Text("\(prods.id ?? 131313)" )
//                                        .font(.system(size: 16, weight: .bold, design: .default))
//                                        .foregroundColor(.gray)
////                                    HStack {
////                                        Text("$" + String.init(format: "%0.2f", price))
////                                            .font(.system(size: 16, weight: .bold, design: .default))
////                                            .foregroundColor(.white)
////                                            .padding(.top, 8)
////                                    }
//                                }.padding(.trailing, 20)
//                                Spacer()
//                            }
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .background(Color(red: 32/255, green: 36/255, blue: 38/255))
//                            .modifier(CardModifier())
//                            .padding(.all, 10)
//
//                }
                
                
                
            }
        }
        
        
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

struct PruebaDataModel_Previews: PreviewProvider {
    static var previews: some View {
        PruebaDataModel()
    }
}

