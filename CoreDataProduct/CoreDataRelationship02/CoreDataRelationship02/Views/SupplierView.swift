//
//  SupplierView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct SupplierView: View {
    
    @ObservedObject var addDataVM: AddDataViewModel
    
    @FetchRequest(entity: Supplier.entity(), sortDescriptors: [])
    var suppliers: FetchedResults<Supplier>
    
    var body: some View {
        
        List {
            ForEach(suppliers) { supplier in
                Text(supplier.name ?? "")
            }
            .onDelete(perform: { indexSet in
                addDataVM.deleteSupplier(indexSet: indexSet, suppliers: suppliers)
            })
        }
        
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle")
            }))
    }
}

struct SupplierView_Previews: PreviewProvider {
    static var previews: some View {
        SupplierView(addDataVM: AddDataViewModel())
    }
}
