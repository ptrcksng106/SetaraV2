//
//  ContentView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 28/08/23.
//

import SwiftUI
import CoreData

struct SpendingListView: View {
    @StateObject private var router = Router()
    @State private var showingAddItemSheet = false
    //@State private var manager: DataManager = DataManager()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Add spending bills to calculate")
                        .padding(.horizontal)
                        .padding(.bottom)

                    ScrollView(.vertical) {
                        LazyVStack {
                            ForEach(0..<3) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("secondColor"))
                                        .frame(width: 360, height: 90)
                                    VStack(spacing: 5) {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("Mie Tarempa  x2")
                                                Text("IDR 66.000")
                                                    .opacity(0.6)
                                            }
                                            Spacer()
                                            Button {
                                                showingAddItemSheet.toggle()
                                            } label: {
                                                Text("Edit")
                                                Image(systemName: "chevron.right")
                                            }
                                            .foregroundColor(Color.white)
                                            .opacity(0.6)
                                        }
                                        .padding(.horizontal, 30)
                                        Rectangle()
                                            .frame(width: 360, height: 0.5)
                                            .opacity(1)
                                            .padding(0)
                                        HStack {
                                            Text("Participant: Wira")
                                                .opacity(0.6)
                                            Spacer()
                                            NavigationLink(destination: ParticipantView()
                                    ) {
                                                Image(systemName: "plus.circle")
                                                    .foregroundColor(Color.gray)
                                            }
//                                            Button {
//                                                NavigationLink(destination: ParticipantView())
//                                            } label: {
//                                                Image(systemName: "plus.circle")
//                                                    .foregroundColor(Color.gray)
//                                            }
                                        }
                                        .padding(.horizontal, 30)
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                }
                PrimaryButton(title: "Done", isButtonactive: true) {
                    // router.path.append()
                }
                .padding()
            }
            .navigationTitle("Add Bills")
            .navigationDestination(for: Destination.self) { destination in
                ViewFactory.viewForDestination(destination)
            }
            .toolbar {
                ToolbarItem {
                    Button("Add Bill") {
                        showingAddItemSheet.toggle()
                    }
                    .sheet(isPresented: $showingAddItemSheet) {
                        AddItemView()
                            .preferredColorScheme(.dark)
                            .presentationDetents([.height(560)])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }
        .environmentObject(router)
        .accentColor(.orange)
        
    }
}

struct SpendingListView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingListView()
            .preferredColorScheme(.dark)
    }
}


