//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Oleg Tsarenkoff on 1.07.21.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var object = [
        Emoji(emoji: "❤️", name: "Hearts", description: "Red hearts", isFavorite: false),
        Emoji(emoji: "💙", name: "Hearts", description: "Blue hearts", isFavorite: false),
        Emoji(emoji: "🖤", name: "Hearts", description: "Black hearts", isFavorite: false),
        Emoji(emoji: "💚", name: "Hearts", description: "Green hearts", isFavorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        let object = object[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            object.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = object.remove(at: sourceIndexPath.row)
        object.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}
