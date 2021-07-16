//
//  ProductView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var addDataVM: AddDataViewModel
    
    @State private var currentDate = Date()
    
    var body: some View {
        
        VStack {
            DatePicker(selection: $currentDate, displayedComponents: .date) {
                Text("Select a date ")
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .labelsHidden()
            
            Divider()
            
            List{
                ForEach(0..<15) { item in
                    Text("item: \(item)")
                }
            }
        }
        
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
