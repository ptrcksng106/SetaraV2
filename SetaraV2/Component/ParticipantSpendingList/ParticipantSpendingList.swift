//
//  ParticipantSpendingList.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 02/09/23.
//

import SwiftUI

struct ParticipantSpendingList: View {
    var name: String
    var status: String

    var body: some View{
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.white)
                Text(status)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("Detail")
                .foregroundColor(.gray)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ParticipantSpendingList_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantSpendingList(name: "Yari", status: "No Spending")
    }
}
