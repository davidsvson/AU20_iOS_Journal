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
        
        VStack {
            List() {
                ForEach(journal.entries) { entry in
                    RowView(entry: entry)
                }
                .onDelete(perform: { indexSet in
                 journal.entries.remove(atOffsets: indexSet)
                })
                
            }
            
            Button(action: {
                journal.entries.append(JournalEntry(content: "Ny dag nya möjligheter"))
            }, label: {
                Text("ADD")
            })
            
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
