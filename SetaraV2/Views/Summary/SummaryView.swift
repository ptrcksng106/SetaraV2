//
//  SummaryView.swift
//  SetaraV2
//
//  Created by Irvan P. Saragi on 05/09/23.
//

import SwiftUI

struct SummaryView: View {
    private var totalAmount = "99.000"
    private var isButtonactive = true
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Text("IDR : \(totalAmount)")
                            .font(.system(size: 36, weight: .semibold))
                    }
                    ScrollView{
                        ForEach(0..<5) { person in
                            summaryPerPerson()
                        }
                        .padding(.top, 14)
                    }
                    Button {
                       
                    } label: {
                        Text("Finish")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .frame(width: 101, height: 40)
                            .background(isButtonactive ? Color.orange : .gray)
                            .cornerRadius(12)
                            .padding(.top, 20)
                    }
                    VStack{
                        Text("3 of 3")
                            .font(
                                Font.custom("SF Pro", size: 17)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.white.opacity(0.8))
                        RoundedRectangleView()
                    }
                    
                    
                }
                .padding()
                .navigationTitle("Summary")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack(alignment: .leading) {
                            Text("Total Amount")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.top, 150)
                        }
                    }
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .environment(\.colorScheme, .dark)
    }
}

struct summaryPerPerson: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.gray)
            .overlay {
                HStack{
                    Text("Irvan")
                    Spacer()
                    Text("20.000")
                }
                .padding()
            }
            .frame(height: 232)
    }
}
