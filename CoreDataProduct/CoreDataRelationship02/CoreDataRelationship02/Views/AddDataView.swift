//
//  AddDataView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

struct AddDataView: View {
    
    @ObservedObject var addDataVM: AddDataViewModel
    
    var body: some View {
    
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.gray, lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3)
            .overlay(
                VStack() {
                    HStack {
                        Text("Enter \(addDataVM.menuName())")
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    
                    TextField("Enter \(addDataVM.menuName())", text: $addDataVM.name)
                    Divider()

                    HStack {
                        
                        Spacer()
                        
                        Button("Cancel") {
                            withAnimation {
                                addDataVM.isAddData.toggle()
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.blue)
                                .frame(width: 100, height: 30)
                        )
                        
                        Spacer()
                        
                        Button("Done") {
                            if addDataVM.selectedTabView == 1 {
                                addDataVM.addBrand()
                            }else {
                                addDataVM.addSubplier()
                            }

                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.blue)
                                .frame(width: 100, height: 30)
                        )

                        Spacer()
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 20)
            )
            .background(Color.white)
            .cornerRadius(25.0)
            .transition(AnyTransition.move(edge: .top))
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView(addDataVM: AddDataViewModel())
    }
}
