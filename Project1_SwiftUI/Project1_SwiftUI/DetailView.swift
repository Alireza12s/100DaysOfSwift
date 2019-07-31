//
//  DetailView.swift
//  Project1_SwiftUI
//
//  Created by ali on 7/30/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var imageName: String
    @State var shown: Bool =  false
    
    var body: some View {
        VStack{
        Image(uiImage: UIImage(named: imageName)!)
        .scaledToFill()
        }   .tapAction {
                    self.shown.toggle()
             }
        .navigationBarTitle(Text("Picture \((Data.pictures.firstIndex(of: imageName)!) + 1) of \(Data.pictures.count)"), displayMode: .inline)
    }
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageName: .constant("nssl0049.jpg"))
    }
}
#endif
