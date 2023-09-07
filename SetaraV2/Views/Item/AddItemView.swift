//
//  AddItemView.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 05/09/23.
//

import SwiftUI

struct AddItemView: View {
    @State private var itemName: String = ""
    @State private var basePrice: String = ""
    @State private var selectedQuantity = "2"
    @State private var selectedDiscount = "10%"
    let discount: [String] = ["1%", "2%", "3%", "4%", "10%"]
    let quantity: [String] = ["1", "2", "3", "4"]
    
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Item")
                            .padding(.trailing, 50)
                        TextField("Item Name", text: $itemName)
                    }
                }
                Section {
                    HStack {
                        Text("Base Price")
                            .padding(.trailing, 5)
                        TextField("base price", text: $basePrice)
                            .keyboardType(.numberPad)
                    }
                }
                Section {
                    Picker("Quantity", selection: $selectedQuantity) {
                        ForEach(quantity, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Section {
                    Picker("Tax", selection: $selectedDiscount) {
                        ForEach(discount, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Section {
                    Picker("Fee", selection: $selectedDiscount) {
                        ForEach(discount, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Section {
                    Picker("Discount", selection: $selectedDiscount) {
                        ForEach(discount, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
            }
            NavigationLink(destination: SpendingListView()) {
//                PrimaryButton(title: "Save", isButtonactive: true) {
//                    // code here
//                }
                Text("Save")
            }
            
        }
        .navigationTitle("Add Item")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .preferredColorScheme(.dark)
    }
}
