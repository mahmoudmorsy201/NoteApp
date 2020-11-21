//
//  NoteDisplayViewController.swift
//  NoteAppRealm
//
//  Created by Mahmoud Morsy on 10/31/20.
//

import UIKit
import RealmSwift

class NoteDisplayViewController: UIViewController {
    
    let realm = try! Realm()
    
    var newNote = Note()
    var selectedNote: Note?
    var update = false
    
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var noteContent: UITextView!
    @IBOutlet weak var noteTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            noteTitle.text = selectedNote!.title
            noteContent.text = selectedNote!.noteContet
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if update == false {
//            self.deleteButton.isEnabled = false
//            self.deleteButton.title = ""
//        }
    }
//    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
//        do {
//            try realm.write {
//                if let currentNote = selectedNote {
//                    realm.delete(currentNote)
//                }
//            }
//        } catch {
//            print("Error Deleting current note, \(error)")
//        }
//        
//        self.navigationController?.popViewController(animated: true)
//    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {

        if update == true {
            updateNote()
            self.navigationController?.popViewController(animated: true)
        } else if noteTitle.text != "" && noteContent.text != "" {
            newNote.title = noteTitle.text!
            newNote.noteContet = noteContent.text!
            newNote.date = Date()
            do {
                try realm.write {
                    realm.add(newNote)
                }
            }catch {
                print("Error saving note, \(error)")
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: - Updating current cell in the table view
    
    func updateNote() {
        if let currentNote = self.selectedNote {
            do {
                try realm.write {
                    currentNote.title = noteTitle.text!
                    currentNote.noteContet = noteContent.text
                }
            } catch {
                print("Error updating note, \(error)")
            }
        }
    }
}
