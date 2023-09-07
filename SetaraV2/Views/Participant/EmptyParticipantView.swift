//
//  EmptyParticipantView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 07/09/23.
//

import SwiftUI

struct EmptyParticipantView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var participantsItem: FetchedResults<Participant>
    
    var body: some View {
        VStack {
            Image("imageParticipants")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 205, height: 205)
                .clipped()

            Text("No Participants yet")
                .font(Font.custom("SF Pro", size: 17))
                .foregroundColor(.white.opacity(0.8))
                .padding(.bottom, 20)
            
            Button {
                addParticipant()
            } label: {
                CustomButton(textButton: "Add Participant", widthButton: 180)
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
}

struct EmptyParticipantView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyParticipantView()
    }
}
