//
//  JournalEntryView.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-26.
//

import SwiftUI


struct JournalEntryView : View {
    
    @EnvironmentObject var journal : Journal
    @Environment(\.presentationMode) var presentationMode
    
    @State var entry : JournalEntry? = nil
    private let defaultContent = "Today I..."
    
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
            TextEditor(text: $content ).onTapGesture {
                clearText()
            }
        }.onAppear() {
           setContent()
        }.navigationBarItems(trailing: Button("Save") {
            saveEntry()
            presentationMode.wrappedValue.dismiss()
        } )
        
    }

    private func clearText() {
        if(entry == nil) {
            content = ""
        }
        
    }
    
    
    private func setContent() {
        if let content = entry?.content {
            self.content = content
        } else {
            self.content = defaultContent
        }
    }
    
    
    private func saveEntry() {
        // update existing entry in Journal
        if let entry = entry {
            if let index = journal.entries.firstIndex(of: entry) {
                journal.entries[index].content = self.content
                self.entry?.content = self.content
            }
        }
        // add new entry to journal
        else {
            let newEntry = JournalEntry(content: content)
            journal.entries.append(newEntry)
            entry = newEntry
        }
    }
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView(journal: Journal(), entry: JournalEntry(content: "Bra dag"))
//    }
//}

