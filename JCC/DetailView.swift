//
//  DetailView.swift
//  RevisionExam
//
//  Created by ESPRIT on 4/17/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit

import CoreData

class DetailView: UIViewController {
       var nomImage:String?
    var nbT:String=""
    @IBOutlet weak var imgeUI: UIImageView!
    
    //stepper nb lié maa label
    @IBOutlet weak var nbticket: UILabel!
    @IBAction func Stepper(_ sender: UIStepper) {
        nbticket.text = String(lroundf(Float(sender.value)))
        nbT = nbticket.text!
        if( lroundf(Float(sender.value)) == 10 ){
            print("exist")
            let alerte = UIAlertController(title: "alerte", message: "tu as depassé le 10 tickets ", preferredStyle: .alert)
            let alerteaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerte.addAction(alerteaction)
            self.present(alerte, animated: true, completion: nil)
             // nbticket.text = "0"
            
        } else{
                  //print(String(lroundf(Float(sender.value))))
            
        }
        print("nbT action:"+nbT)
        
        
    }
    
    //lella yosra hedha butt back
    @IBAction func backButt(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imgeUI.image = UIImage(named: nomImage!)
        print("nbT:"+nbT)
        print(" img:"+nomImage!)
        //houni nal9a les param li 3adithom mel controller le5er
        // nzidou bouton plus fel interface hedhi yzidha lel favoris fel coredata
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func bookMark(_ sender: Any) {
        print("nbT book:"+nbT)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appdelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Film")
        fetchRequest.predicate = NSPredicate(format: "imageName == %@",nomImage!)
   
        
       
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            
            print( result.count)
            if(result.count == 0){
                let entityseason = NSEntityDescription.entity(forEntityName: "Film", in: managedContext)
                let season = NSManagedObject(entity: entityseason!, insertInto: managedContext)
                season.setValue(nomImage!, forKey: "imageName")
                season.setValue(nbT, forKey: "nbTicket")
                
                do {
                    try managedContext.save()
                    print("film  saved")
                    
                } catch  {
                    let nserror = error as! NSError
                    print(nserror.userInfo)
                }
                
                
                
            } else{
                print("exist")
                let alerte = UIAlertController(title: "alerte", message: "alredy exist", preferredStyle: .alert)
                let alerteaction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alerte.addAction(alerteaction)
                self.present(alerte, animated: true, completion: nil)
            }
            
        }catch  {
            let nserror = error as! NSError
            print(nserror.userInfo)
        }
        
        
      
        
    
    
    
    
    
    
    
    
    
    
    }}
