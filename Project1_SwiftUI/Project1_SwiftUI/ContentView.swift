//
//  ContentView.swift
//  Project1_SwiftUI
//
//  Created by ali on 7/30/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var data: Data
    @State var count = Data.pictures.count
    @State var search: String

    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    var items = [String]()
    
    
    
    var body: some View {
        
        return
            NavigationView{
                VStack{
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .padding(.leading, 10.0)
//                    TextField(self.$search, placeholder: Text("Search"))
//                        .padding(.vertical, 4.0)
//                        .padding(.trailing, 10.0)
//                        .tapAction {
//                            UIApplication.shared.becomeFirstResponder()
//
//                    }
//                }
//                    .border(Color.secondary, width: 1, cornerRadius: 5)
//                    .padding()
                List{
                    Section(header: SearchBar(text: self.$search)) {
//                    ForEach(Array(0...self.count-1))
//                        .filter {
//                                        self._search.value.isEmpty ?
//                                            true :
//                                            "\($0)".contains(Character(self._search.value)
//                                    })
                        ForEach(0...self.count-1){ item in
                        NavigationLink(destination: DetailView(imageName: .constant(Data.pictures[item]))) {
                            Cell(title: .constant(Data.pictures[item]))
                        }
                    }.onDelete(perform: delete)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .edgesIgnoringSafeArea(.bottom)
                    }}
                }
                    
                    .navigationBarTitle("Storm Viewer", displayMode: .large)
                
        }
        
    }
    func delete(at offsets: IndexSet) {
         if let first = offsets.first {
             Data.pictures.remove(at: first)
            self.count -= 1
         }
     }
}
 

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(search: "")
            .environmentObject(Data())
    }
}
#endif
