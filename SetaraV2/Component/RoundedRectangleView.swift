//
//  RoundedRectangleView.swift
//  SetaraV2
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 02/09/23.
//

import SwiftUI

struct RoundedRectangleView: View {
    @State var currentValue : Float = 1
    var body: some View {
       ProgressView(value: currentValue, total: 3)
            .foregroundColor(Color.gray)
            .padding(30)
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
    }
}
