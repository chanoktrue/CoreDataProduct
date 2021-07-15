//
//  ProductView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var addDataVM: AddDataViewModel
    
    var body: some View {
        Text("Product")
            .navigationBarTitle(Text("Product"))
            .navigationBarItems(trailing: Button(action: {
                addDataVM.isAddData = true
            }, label: {
                Image(systemName: "plus.circle")
            }))
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(addDataVM: AddDataViewModel())
    }
}
