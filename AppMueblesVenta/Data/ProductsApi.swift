//
//  ProductsApi.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/09/22.
//

import SwiftUI

struct ProductsApi:Identifiable,Hashable{
    var id:Int
    var type:String
    var name:String
    var slug:String
    var description:String
    var features:String
    var cover:String
    var brandId:Int
    var brand:Brand
    var tags:[Tags]
    var categorires:[String]
    var presentation:[String] = []
}

struct Brand:Identifiable,Hashable{
    var id:Int
    var name:String
    var description:String
    var slug:String
}

struct Tags:Identifiable,Hashable{
    var id:Int
    var name:String
    var description:String
    var slug:String
    var pivot:Pivot
}

struct Pivot:Identifiable,Hashable{
    var id: ObjectIdentifier
    var product_id:Int
    var tag_id:Int
    
}

enum ProductCat: String,CaseIterable{
    
    case HogarMuebles = "Hogar Muebles"
    case LineaBlanca = "Linea Blanca"
    case CocinaElectrodomesticos = "Cocina y Electrodomesticos"
    case Electronica = "Electronica"
    case Celulares = "Celulares"
    case ConsolasVideojuegos = "Consolas y Videojuegos"
    case Zapatos = "Zapatos"
    case Bebes = "Bebes"
    case NAdolescentes = "Niños y Adolescentes"
    case Hombres = "Hombres"
    case Mujeres = "Mujeres"
    case Bolsos = "Maletas, Bolsas y Mochilas"
    case Accesorios = "Relojes, lentes y joyeria"
    case Belleza = "Belleza, Cuidado personal y Salud"
    case Movilidad = "Motos y Movilidad"
    case Automotriz = "Automotriz y Refacciones"
    case Deportes = "Deportes"
    case Juguetes = "Juguetes"
    case Mascotas = "Mascotas"
    case Ferreteria = "Ferreteria y Mejoras del Hogar"
    case Instrumentos = "Instrumentos Musicales"
    case Libros = "Libros, Revistas y Comics"
}
