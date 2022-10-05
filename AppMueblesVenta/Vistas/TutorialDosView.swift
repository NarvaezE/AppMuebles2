//
//  TutorialDosView.swift
//  AppMueblesVenta
//
//  Created by Edgar Narvaez on 29/07/22.
//

import SwiftUI

struct TutorialDosView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .trailing){
                    
      
                    Image("img2").resizable().aspectRatio(contentMode: .fit).padding(.horizontal,40)
                    
                }
                Text("Look at the Furniture on Each Side").font(.system(size: 30)).padding(.bottom,10)
                Text("Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry.").font(.title3).fontWeight(.light)
                    .padding(.bottom,30)
                
                Spacer() 
                Spacer()
            }
        }
    }
}

struct TutorialDosView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDosView()
            .previewDevice("iPhone 11")
    }
}
