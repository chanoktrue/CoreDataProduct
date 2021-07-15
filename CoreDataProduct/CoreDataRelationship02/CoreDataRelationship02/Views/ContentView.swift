//
//  ContentView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var addDataVM = AddDataViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {

                MenuView(addDataVM: addDataVM)                    
               
                MasterView(addDataVM: addDataVM)
            }
            
            Color.black
                .opacity(addDataVM.isAddData ? 0.5 : 0)
                .ignoresSafeArea(.all)
            
            if addDataVM.isAddData {
                AddDataView(addDataVM: addDataVM)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
