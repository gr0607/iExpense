//
//  ContentView.swift
//  iExpense
//
//  Created by admin on 10.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: nil, content: {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                        })
                        Spacer()
                        Text("$\(item.amount)")
                            .background(item.amount > 100 ? Color.green : Color.red)
                    }
                }
                .onDelete(perform: remomeItems)
                
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing:
                    Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
            )
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: self.expenses)
            }
        }
     }
    
    func remomeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
