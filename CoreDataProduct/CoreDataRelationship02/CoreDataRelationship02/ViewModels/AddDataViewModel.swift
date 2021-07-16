//
//  AddDataViewModel.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 15/7/2564 BE.
//

import SwiftUI

enum MenuName: String {
    case  Brand, Supplier
}

class AddDataViewModel: ObservableObject {
    
    @Published var isAddData: Bool = false
    @Published var selectedTabView: Int = 1
    @Published var name: String = ""
    
    let viewContext = PersistentController.shared.viewContext
    
    func menuName() -> String{
        switch selectedTabView {
        case 1:
            return MenuName.Brand.rawValue
        case 2:
            return MenuName.Supplier.rawValue
        default:
            return ""
        }
    }
    
    func addBrand() {
        withAnimation {
            let brand = Brand(context: viewContext)
            brand.name = name
            PersistentController.shared.save(message: "Save brand complete.")
            name = ""
            isAddData = false
        }
    }
    
    func deleteBrand(indexSet: IndexSet, brands: FetchedResults<Brand>) {
        withAnimation {
            indexSet.map({brands[$0]}).forEach(viewContext.delete)
            PersistentController.shared.save(message: "Delete brand complete.")
        }
    }
    
    func addSubplier() {
        withAnimation {
            let supplier = Supplier(context: viewContext)
            supplier.name = name
            PersistentController.shared.save(message: "Add supplier complete.")
            name = ""
            isAddData = false
        }
    }
    
    func deleteSupplier(indexSet: IndexSet, suppliers: FetchedResults<Supplier>) {
        withAnimation {
            indexSet.map({suppliers[$0]}).forEach(viewContext.delete)
            PersistentController.shared.save(message: "Delete suppler completer.")
        }
    }
    
}

