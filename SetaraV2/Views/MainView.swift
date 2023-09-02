//
//  MainView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
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
                        
                    } label: {
                        CustomButton(textButton: "Add Participant")
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
