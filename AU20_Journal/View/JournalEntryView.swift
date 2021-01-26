//
//  JournalEntryView.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-26.
//

import SwiftUI


struct JournalEntryView : View {
    
    var entry : JournalEntry? = nil
    @State private var content : String = ""
    
    
    var date : String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        var date = ""
        
        if let entry = entry {
            date = formatter.string(from: entry.date)
        } else {
            date = formatter.string(from: Date())
        }
        return date
    }
    
    var body: some View {
        
        VStack {
            Text(date)
            TextEditor(text: $content )
        }.navigationBarItems(trailing: Button("Save") {
            saveEntry()
        } )
        
    }

    private func saveEntry() {
        print("Saving: \(content)")
        
        
    }
}






struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(entry: JournalEntry(content: "Bra dag"))
    }
}

