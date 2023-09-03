//
//  AddNewBillView.swift
//  SetaraV2
//
//  Created by Irvan P. Saragi on 02/09/23.
//

import SwiftUI

struct AddNewBillView: View {
    @State private var isNewBillConfirmation = false
    @State private var isNewBillorHistory = true
    @State private var chooseBill  = "New Bill"
    let choose = ["New Bill", "History"]
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Picker("",selection: $chooseBill) {
                    ForEach(choose, id: \.self) { chooses in
                        Text(chooses)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 246)
                .padding(.top, 50)
                .padding(.bottom, isNewBillorHistory ? 0 : 80)
                .onChange(of: chooseBill) { newValue in
                    isNewBillorHistory = newValue == "New Bill"
                }
                if isNewBillorHistory{
                    Image("NewBill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.top, 100)
                    Text("Add new bill to calculate")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.top, 17)
                    Button {
                        isNewBillConfirmation = true
                    } label: {
                        CustomButton(textButton: "Add New Bill")
                    }
                    .confirmationDialog("", isPresented: $isNewBillConfirmation) {
                        Button("Camera Input") {
                            print("OCR")
                        }
                        Button("Manual Input") {
                            print("Manual Input")
                        }
                    
                    }
                    .padding(.top, 43)
                } else {
                    HistoryView(isNewBillorHistory: $isNewBillorHistory)
                    
                }
                Spacer()
                VStack{
                    Text("1 of 3")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white.opacity(0.8))
                    RoundedRectangleView()
                }
                .opacity(isNewBillorHistory ? 1 : 0)
            }
        }
    }
}

struct AddNewBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewBillView()
    }
}

struct ListViewHistory: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<4) { history in
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("BlackColorRectangleBorder"))
                            .frame(width: 360, height: 60)
                            .overlay {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("13 Agustus 2023")
                                            .foregroundColor(.white)
                                        Text("TotalAmount : IDR 130.000")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15))
                                    }
                                    Spacer()
                                    Button("Detail") {
                                        print("Move to Detail")
                                    }
                                    .foregroundColor(.white.opacity(0.8))
                                }
                                .padding()
                            }
                    }
                    .padding(10)
                }
            }
        }

    }
}

struct HistoryView : View{
    @Binding var isNewBillorHistory :Bool
    @State var isHistrory = true
    var body: some View{
            if isHistrory{
                ListViewHistory()
            } else {
                VStack{
                    Image("HistoryBill" )
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("No bills history yet" )
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.top, 17)
                }
                .padding(.top, 100)
            }
        
    }
}
