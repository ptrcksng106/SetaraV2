//
//  ContentView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 28/08/23.
//

import SwiftUI

struct SpendingListView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Add spending items for each participant")
                        .padding(.horizontal)

                    Form {
                        ForEach(spendingList, id: \.self) { item in
                            Section {
                                Button {
                                    router.path.append(.detailSpendingView)
                                } label: {
                                    ParticipantSpendingList(name: item.name, status: item.status)
                                }
                            }
                        }
                    }
                }

                PrimaryButton(text: "Next", isButtonactive: false) {
                    router.path.append(.resultSpendingView)
                }

                ProgressBar(progress: 0.6, step: 2)
                    .padding(.bottom, 15)
            }
            .scrollIndicators(.never)
            .navigationTitle("Spending")
            .navigationDestination(for: Destination.self) { destination in
                ViewFactory.viewForDestination(destination)
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


