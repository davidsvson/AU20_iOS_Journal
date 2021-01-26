//
//  JournalEntryView.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-26.
//

import SwiftUI


struct JournalEntryView : View {
    
    var entry : JournalEntry
    
    var body: some View {
        
        Text(entry.content)
        
    }

}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(entry: JournalEntry(content: "Bra dag"))
    }
}

