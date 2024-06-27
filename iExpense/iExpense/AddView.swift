//
//  AddView.swift
//  iExpense
//
//  Created by Leo Mogiano on 26/6/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dissmiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "BOB"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newExpense)
                    dissmiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
