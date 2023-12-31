//
//  MainView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/08/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(sortDescriptors: []) private var participantsItem: FetchedResults<Participant>
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    if participantsItem.isEmpty {
                        EmptyParticipantMainView()
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(participantsItem) { item in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .leading)
                                            .foregroundColor(CustomColor.cardBlackColor)
                                            
                                        Text(item.name ?? "Anonymous")
                                            .font(Font.custom("SF Pro", size: 17))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                            .padding(.leading, 16)
                                        }
                                    
                                    }
                                .onDelete(perform: deleteParticipant)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.top, 30)
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    addParticipant()
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            CustomButton(textButton: "Next", widthButton: 101)
                                .padding(.bottom, 18)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Step 1 of 3")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .foregroundColor(.white.opacity(0.8))
                    
                    RoundedRectangleView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack(alignment: .leading) {
                            Text("Participants")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Add minimum of 2 participants")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
            }
        }
    }
    
    private func addParticipant() {
        alertAddParticipant(title: "Add Participant", message: "Enter participant name", hintText: "Name", primaryTitle: "Cancel", secondaryTitle: "OK") { text in
            
            if text.isEmpty {
                print("Name still empty")
            } else {
                let newTask = Participant(context: viewContext)
                newTask.name = text
                try? viewContext.save()
                print(text)
            }
        }
    secondaryAction: {
        print("Cancelled")
              }
    }
    
    func deleteParticipant(at offsets: IndexSet) {
        for offset in offsets {
            let participant = participantsItem[offset]
            viewContext.delete(participant)
        }
        try? viewContext.save()
    }
}

//struct Delete: ViewModifier {
//    let action: () -> Void
//
//}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
