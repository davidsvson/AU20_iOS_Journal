//
//  JournalEntry.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-22.
//

import Foundation

struct JournalEntry : Identifiable {
    var id = UUID()
    
    var content : String
    var date : Date = Date()
    
    
    
}
