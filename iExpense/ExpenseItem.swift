//
//  ExpenseItem.swift
//  iExpense
//
//  Created by admin on 10.04.2021.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
