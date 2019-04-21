//
//  BookmarkView.swift
//  RevisionExam
//
//  Created by ESPRIT on 4/17/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class BookmarkView: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
      var films : [NSManagedObject] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        let contentView = cell?.viewWithTag(0)
        let img = contentView?.viewWithTag(1) as! UIImageView
        let titre = contentView?.viewWithTag(2) as! UILabel
  
        img.image = UIImage(named: films[indexPath.row].value(forKey: "imageName") as! String)
        titre.text = films[indexPath.row].value(forKey: "nbTicket") as! String
     
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenceContainer = appDelegate.persistentContainer
        let managedContext = persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Film")
        do {
            try films = managedContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch  {
            let nsError = error as! NSError
            print(nsError.userInfo)
        }
        
        
        
    }
    

 
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            
            let appDeleagate = UIApplication.shared.delegate as! AppDelegate
            let persContainer  = appDeleagate.persistentContainer
            let managetCont = persContainer.viewContext
            managetCont.delete(films[indexPath.row])
            do
            {
                try managetCont.save()
                films.remove(at: indexPath.row)
                tableView.reloadData()
            }catch {
                let nserror = error as NSError
                print(nserror.userInfo)
                
            }
            
        }

}
}
