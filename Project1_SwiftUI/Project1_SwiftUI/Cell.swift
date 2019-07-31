//
//  Cell.swift
//  Project1_SwiftUI
//
//  Created by ali on 7/30/19.
//  Copyright © 2019 Alireza. All rights reserved.
//

import SwiftUI

struct Cell: View {
    @EnvironmentObject var data: Data
    @Binding var title: String
    var body: some View {
        HStack{
            Text(verbatim: title)
            Spacer()
        }.padding()
    }
}

#if DEBUG
struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(title: .constant("title"))
    }
}
#endif
