//
//  PrimaryButton.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 02/09/23.
//

import SwiftUI

struct PrimaryButton: View {
    @State var text: String
    var isButtonactive: Bool
    var onClicked: () -> Void

    var body: some View {
        Button {
            onClicked()
        } label: {
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .frame(width: 101, height: 40)
                .background(isButtonactive ? Color.orange : .gray)
                .cornerRadius(12)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next", isButtonactive: false) {}
    }
}
