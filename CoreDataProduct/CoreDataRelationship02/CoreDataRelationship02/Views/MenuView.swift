//
//  MenuView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct MenuView: View {
    
    let menus = ["☀️Master", "🍎Product", "⚙️Setting"]
    
    @ObservedObject var addDataVM: AddDataViewModel

    var body: some View {
        List {
            ForEach(menus.indices, id:\.self) { index in
                
                if index == 0 {
                    NavigationLink(
                     destination: MasterView(addDataVM: addDataVM) ,
                     label: {
                         Text("\(menus[index])")
                     })
                }else if index == 1 {
                    NavigationLink(
                        destination: ProductView(addDataVM: addDataVM) ,
                     label: {
                         Text("\(menus[index])")
                     })
                }else {
                    NavigationLink(
                        destination: Text("\(menus[index])") ,
                     label: {
                         Text("\(menus[index])")
                     })
                }
                
            }
        }
        .navigationBarTitle(Text("Menu"))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(addDataVM: AddDataViewModel())
    }
}
