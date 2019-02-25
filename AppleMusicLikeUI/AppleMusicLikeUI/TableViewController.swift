//
//  TableViewController.swift
//  AppleMusicLikeApp
//
//  Created by Joker Hook on 2019/2/19.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var checkFlag = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.rowHeight = 60
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicLists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let music = musicLists[indexPath.row]
        cell.textLabel?.text = music.musicName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let sorryAction = {(action:UIAlertAction!) -> Void in
            let alertView = UIAlertController(title: nil, message: "Sorry, we are working on it", preferredStyle: .alert)
            let CancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertView.addAction(CancelAction)
            self.present(alertView, animated: true, completion: nil)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action,sourceView,compleionHandler) in
            
            musicLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            compleionHandler(true)
        })
        
        deleteAction.backgroundColor = UIColor.red
        deleteAction.image = UIImage(named: "delete")
        
        
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action,sourceView,compleionHandler) in
            
            let alertView = UIAlertController(title: "Attention, Please!", message: "Are you sure you want to share this?", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            let shareAction = UIAlertAction(title: "Yes, I am sure", style: .default, handler: sorryAction)
            
            alertView.addAction(cancelAction)
            alertView.addAction(shareAction)
            compleionHandler(true)
            self.present(alertView, animated: true, completion: nil)
        })
        shareAction.backgroundColor = UIColor.orange
        shareAction.image = UIImage(named: "share")
        
        
        let feedAction = UIContextualAction(style: .normal, title: "Draw", handler: {(action,sourceView,compleionHandler) in
            
            let alertView = UIAlertController(title: "Attention, Please!", message: "Are you sure you want to share this?", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            let feedAction = UIAlertAction(title: "Yes, I am sure", style: .default, handler: sorryAction)
            
            alertView.addAction(cancelAction)
            alertView.addAction(feedAction)
            compleionHandler(true)
            self.present(alertView, animated: true, completion: nil)
        })
        feedAction.backgroundColor = UIColor.purple
        feedAction.image = UIImage(named: "feed")
        
        let swipeConfigurtion = UISwipeActionsConfiguration(actions: [deleteAction,shareAction,feedAction])
        
        return swipeConfigurtion
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt
        indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var checkAction = UIContextualAction(style: .normal, title: "Check", handler: {(action,sourceView,compleionHandler) in
            musicLists[indexPath.row].checkFlag = true
            compleionHandler(true)
        })
        
        checkAction.backgroundColor = UIColor.blue
        checkAction.image = UIImage(named: "tick")
        
        if musicLists[indexPath.row].checkFlag == true {
            checkAction = UIContextualAction(style: .normal, title: "UnDo", handler: {(action,sourceView,compleionHandler) in
                musicLists[indexPath.row].checkFlag = false
                compleionHandler(true)
            })
            
            checkAction.backgroundColor = UIColor.orange
            checkAction.image = UIImage(named: "undo")
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        
        let voiceAction = UIContextualAction(style: .normal, title: "Voice", handler: {(action,sourceView,compleionHandler) in
            
            let alertView = UIAlertController(title: "Attention, Please!", message: "Are you sure you want to share this?", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            let voiceAction = UIAlertAction(title: "Yes, I am sure", style: .default, handler: nil)
            
            alertView.addAction(cancelAction)
            alertView.addAction(voiceAction)
            compleionHandler(true)
            self.present(alertView, animated: true, completion: nil)
        })
        voiceAction.backgroundColor = UIColor.red
        voiceAction.image = UIImage(named: "voice")
        
        
        let swipeConfigurtion = UISwipeActionsConfiguration(actions: [checkAction,voiceAction])
        return swipeConfigurtion
    }
    /*
     override func tableView(_ tableView: UITableView, commit
     editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
     IndexPath) {
     if editingStyle == .delete {
     musicList.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     }
     }
     
     */


}
