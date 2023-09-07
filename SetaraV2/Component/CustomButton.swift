//
//  CustomButton.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/09/23.
//

import SwiftUI

struct CustomButton: View {
    var textButton: String
    var widthButton: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Text("\(textButton)")
                .foregroundColor(.white)
        }
        .fontWeight(.semibold)
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(width: widthButton, height: 40, alignment: .center)
        .background(Color.accentColor)
        .cornerRadius(12)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(textButton: "Add Participant", widthButton: 110)
    }
}
