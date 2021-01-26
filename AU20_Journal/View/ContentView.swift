//
//  ContentView.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var journal = Journal()
    
    
    var body: some View {
        
        NavigationView {
            List() {
                ForEach(journal.entries) { entry in
                    NavigationLink(
                        destination: JournalEntryView(entry: entry)) {
                            RowView(entry: entry)
                        }
                }
                .onDelete(perform: { indexSet in
                 journal.entries.remove(atOffsets: indexSet)
                })
            }
            .navigationBarItems(trailing: NavigationLink(
                                    destination: JournalEntryView(),
                                    label: {
                                        Image(systemName: "plus.circle")
                                    }))
        }
        
    }
}


struct RowView : View {
    
    var entry : JournalEntry
    
    var date : String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let date = formatter.string(from: entry.date)
        return date
    }
    
    var body: some View {
        HStack {
            Text(date)
            Spacer()
            Text(entry.content)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
