//
//  JournalEntry.swift
//  AU20_Journal
//
//  Created by David Svensson on 2021-01-22.
//

import Foundation

struct JournalEntry : Identifiable, Equatable {
    var id = UUID()
    
    var content : String
    var date : Date = Date()
    
//    static func ==(lhs: JournalEntry, rhs: JournalEntry) -> Bool {
//        return lhs.id == rhs.id
//    }
}
