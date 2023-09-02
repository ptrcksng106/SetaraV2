//
//  RoundedRectangleView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/09/23.
//

import SwiftUI

struct RoundedRectangleView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 330, height: 4, alignment: .center)
                .foregroundColor(CustomColor.roundedBlackColor.opacity(0.32))
            
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 113.05264, height: 4, alignment: .center)
                .foregroundColor(CustomColor.roundedGrayColor)
        }
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
    }
}
