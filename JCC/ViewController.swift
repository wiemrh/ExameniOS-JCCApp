//
//  ViewController.swift
//  RevisionExam
//
//  Created by ESPRIT on 4/17/19.
//  Copyright © 2019 ESPRIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    
    let images = ["1","2","3","4"]
    
    private func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let contentView = cell.viewWithTag(0)
        let img = contentView?.viewWithTag(1) as! UIImageView
          img.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "toDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let destination = segue.destination as! DetailView
            let indice = sender as! IndexPath
            destination.nomImage = images[indice.row]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

