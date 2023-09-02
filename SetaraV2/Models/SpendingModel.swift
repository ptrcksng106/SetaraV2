//
//  SpendingModel.swift
//  SetaraV2
//
//  Created by bernardus kanayari on 02/09/23.
//

import Foundation

struct SpendingModel: Hashable{
    var name: String
    var status: String
}

// Dummy Data
var spendingList :[SpendingModel] = [
    SpendingModel(name: "Fajar", status: "No Spending"),
    SpendingModel(name: "Lukito", status: "Spending"),
    SpendingModel(name: "Bisma", status: "No Spending")
]
