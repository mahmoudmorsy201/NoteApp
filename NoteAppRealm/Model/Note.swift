//
//  Note.swift
//  NoteAppRealm
//
//  Created by Mahmoud Morsy on 10/31/20.
//

import Foundation
import RealmSwift

class Note: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var noteContet: String = ""
    @objc dynamic var date: Date?
}



