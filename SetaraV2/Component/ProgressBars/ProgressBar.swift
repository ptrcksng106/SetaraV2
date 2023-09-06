//
//  ProgressBar.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 02/09/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var step: Int

    var body: some View {
        VStack{
            HStack {
                Text("Step \(step) of 3")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.vertical, 16)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(width: geometry.size.width, height: geometry.size.height)

                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width * progress, height: geometry.size.height)
                }
                .cornerRadius(geometry.size.height / 2)
            }.frame(width: 340, height: 5)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.5, step: 2)
            .preferredColorScheme(.dark)
    }
}
