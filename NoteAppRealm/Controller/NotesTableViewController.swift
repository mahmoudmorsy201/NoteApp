//
//  ViewController.swift
//  NoteAppRealm
//
//  Created by Mahmoud Morsy on 10/31/20.
//

import UIKit
import RealmSwift


class NotesTableViewController: UIViewController {
    
    let realm = try! Realm()
    
    var notes: Results<Note>?
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        notesTableView.delegate = self
        notesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadNotes()
    }
    
    //MARK: - Add New Note action
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    
    //MARK: - Data Manuiplation Methods
    
    func saveNote(note: Note) {
        do {
            try realm.write {
                realm.add(note)
            }
        }catch {
            print("Error saving note, \(error)")
        }
        DispatchQueue.main.async {
            self.notesTableView.reloadData()
        }
    }
    
    func loadNotes() {
        notes = realm.objects(Note.self)
        DispatchQueue.main.async {
            self.notesTableView.reloadData()
        }
    }
}

//MARK: - Table View Delegate Methods
extension NotesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NoteDisplayViewController
        
        if segue.identifier == "cellToNote" {
            if let indexPath = notesTableView.indexPathForSelectedRow {
                vc.selectedNote = notes?[indexPath.row]
            }
            vc.update = true
        }
    }
}

// MARK: - Table View Data Source Methods
extension NotesTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell",for: indexPath)
        cell.textLabel?.text = notes?[indexPath.row].title ?? "No Notes Added"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 1
    }
}








