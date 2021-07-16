//
//  MasterView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct MasterView: View {
    

    @ObservedObject var addDataVM: AddDataViewModel
    
    var body: some View {

        TabView(selection: $addDataVM.selectedTabView) {
            BrandView(addDataVM: addDataVM)
                    .tabItem {
                        Image(systemName: "circle.grid.cross.fill")
                    }
                    .tag(1)
                
            SupplierView(addDataVM: addDataVM)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                    }
                    .tag(2)
            }
        
        .navigationBarTitle(Text(addDataVM.menuName()))
        
        .navigationBarItems(trailing: Button(action: {
            addDataVM.isAddData = true
        }, label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 20))
        }))
        
    }
    
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(addDataVM: AddDataViewModel())
    }
}
