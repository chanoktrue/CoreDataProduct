//
//  BrandDetailView.swift
//  CoreDataRelationship02
//
//  Created by Thongchai Subsaidee on 16/7/2564 BE.
//

import SwiftUI

struct BrandDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var brandDetailVM = BrandDetailViewModel()
    
    var brand: FetchedResults<Brand>.Element?
    

    var body: some View {
        
        VStack {
            if brandDetailVM.brandDetails.count > 0 {
                ShowBrandDetailView(brandDetailVM: brandDetailVM)
            }else {
                AddBrandDetailView(brandDetailVM: brandDetailVM)
            }
        }
        .onAppear{
            brandDetailVM.getBrandDetail(brand: brand)
        }

        .navigationBarTitle(Text("Band Detail: \(brand?.name ?? "")"))
            
        .navigationBarItems(trailing: Button(action: {
            if brandDetailVM.brandDetails.count ==  0 {
                brandDetailVM.addBrandDetail(brand: brand) {
                    if $0  {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }else {
                brandDetailVM.deleteBrandDetail(brand: brand) {
                    if $0 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }, label: {
            Text(brandDetailVM.brandDetails.count > 0 ?"Delete" : "Save")
        }))

    }
}

struct BrandDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BrandDetailView(brand: Brand())
    }
}


struct AddBrandDetailView: View {
    
    @ObservedObject var brandDetailVM: BrandDetailViewModel
    

    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.clear, lineWidth: 1)
            .overlay(
                GeometryReader { geo in
                    
                    VStack(alignment: .leading) {
                      
                        Text("Company name")
                        TextField("enter compnay name", text: $brandDetailVM.companyName)
                        Color.gray.opacity(0.5)
                            .frame(width: geo.size.width, height: 1)
                        
                        Text("Address")
                        TextEditor(text: $brandDetailVM.address)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color.gray.opacity(0.5))
                                
                            )
                        
                        Text("Email")
                        TextField("enter email", text: $brandDetailVM.email)
                        Color.gray.opacity(0.5)
                            .frame(width: geo.size.width, height: 1)
                    }
                    
                }
            )
            .padding(20)
    }
}



struct ShowBrandDetailView: View {
    
    @ObservedObject var brandDetailVM: BrandDetailViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(Color.clear, lineWidth: 1)
            .overlay(
                GeometryReader { geo in
                    
                    VStack(alignment: .leading) {
                      
                        Text("Company name")
                        TextField("enter compnay name", text: Binding(
                            get: {brandDetailVM.brandDetails.first?.companyName ?? ""},
                            set: {brandDetailVM.companyName = $0}
                        ))
                        Color.gray.opacity(0.5)
                            .frame(width: geo.size.width, height: 1)
                        
                        Text("Address")
                        TextEditor(text: Binding(
                                    get: {brandDetailVM.brandDetails.first?.address ?? ""},
                                    set: {brandDetailVM.address = $0
                                    }))
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color.gray.opacity(0.5))
                                
                            )
                        
                        Text("Email")
                        TextField("enter email", text: Binding(
                            get: {brandDetailVM.brandDetails.first?.email ?? ""},
                            set: {brandDetailVM.email = $0}
                        ))
                        Color.gray.opacity(0.5)
                            .frame(width: geo.size.width, height: 1)
                    }
                    
                }
            )
            .padding(20)
    }
}
