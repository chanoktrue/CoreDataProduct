//
//  BrandDetailViewModel.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 16/7/2564 BE.
//

import SwiftUI
import CoreData

class BrandDetailViewModel: ObservableObject {
    
    let viewContext = PersistentController.shared.viewContext
    
    @Published var companyName: String = ""
    @Published var address: String = ""
    @Published var email: String = ""
    
    @Published var brandDetails: [BrandDetailList] = []
    
    func getBrandDetail(brand: FetchedResults<Brand>.Element?) {
        let request: NSFetchRequest<BrandDetail> = BrandDetail.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(BrandDetail.toBrand.name), brand?.name ?? "" )
        
        do{
            let result = try viewContext.fetch(request)
            brandDetails = result.map(BrandDetailList.init)
        }catch{
            print("\(#function) error: \(error.localizedDescription)")
        }
    }
    
    func addBrandDetail(brand: FetchedResults<Brand>.Element?, completion: @escaping (Bool) ->()) {
        withAnimation {
            
            if companyName == "" || brand?.name == "" {
                return
            }
            
            let brandDetail = BrandDetail(context: viewContext)
            brandDetail.companyName = companyName
            brandDetail.address = address
            brandDetail.email = email
            brandDetail.toBrand = brand
            PersistentController.shared.save2 {
                completion($0)
            }
        }
    }
    
    func deleteBrandDetail(brand: FetchedResults<Brand>.Element?, completion: @escaping (Bool) -> ()) {
        
        guard let companyName = brand?.name else {
            completion(false)
            return
        }
        
        print(companyName)
        
        let request: NSFetchRequest<BrandDetail> = BrandDetail.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(BrandDetail.companyName), companyName)
    
        do{
            if let item = try viewContext.fetch(request).first {
                viewContext.delete(item)
                PersistentController.shared.save2 {
                    completion($0)
                }
            }else {
                completion(false)
            }
        }catch{
            print("\(#function) error: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
}

struct BrandDetailList {
    let brandDetail: BrandDetail
    
    var companyName: String {
        return brandDetail.companyName ?? ""
    }
    
    var address: String {
        return brandDetail.address ?? ""
    }
    
    var email: String {
        return brandDetail.email ?? ""
    }
}
