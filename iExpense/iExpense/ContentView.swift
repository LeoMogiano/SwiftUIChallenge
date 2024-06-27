//
//  ContentView.swift
//  iExpense
//
//  Created by Leo Mogiano on 30/4/24.
//

import SwiftUI

struct AmountStyle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundStyle(color)
    }
}

extension View {
    func amountStyle(amount: Double) -> some View {
        let color: Color
        if amount < 25 {
            color = .green
        } else if amount <= 70 {
            color = .blue
        } else {
            color = .red
        }
        return modifier(AmountStyle(color: color))
    }
}



struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded,forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
    }
    
}



struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Divider()
                Section(header: Text("Personal").font(.headline)) {
                    ExpenseList(expenses: expenses, type: "Personal")
                }
                Section(header: Text("Business").font(.headline)) {
                    ExpenseList(expenses: expenses, type: "Business")
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        
        
    }
    
    
    
    struct ExpenseList: View {
        var expenses: Expenses
        let type: String
        
        var body: some View {
            if expenses.items.filter({ $0.type == type }).isEmpty {
                Text("No expenses found")
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(expenses.items.filter { $0.type == type }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "BOB"))
                                .amountStyle(amount: item.amount)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
        private func removeItems (at offsets: IndexSet) {
            expenses.items.remove(atOffsets: offsets)
        }
    }
    
}

#Preview {
    ContentView()
}
