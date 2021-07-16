//
//  BrandView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct BrandView: View {
    
    @ObservedObject var addDataVM: AddDataViewModel
    
    @FetchRequest(entity: Brand.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Brand.name, ascending: false)])
    var brands: FetchedResults<Brand>
    
    var body: some View {
        
        List {
            ForEach(brands) { brand in
                Text(brand.name ?? "")
                    .overlay(
                        NavigationLink(
                            destination: BrandDetailView(brand: brand),
                            label: {
                                EmptyView()
                            })
                            .opacity(0)
                    )
                
            }
            .onDelete(perform: { indexSet in
                addDataVM.deleteBrand(indexSet: indexSet, brands: brands)
            })
        }
        
        .navigationBarItems(trailing: Button(action: {
            //
        }, label: {
            Image(systemName: "plus.circle")
        }))
        
        
        
    }
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView(addDataVM: AddDataViewModel())
    }
}
