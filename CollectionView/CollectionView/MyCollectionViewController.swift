//
//  MyCollectionViewController.swift
//  CollectionView
//
//  Created by Alan Vargas Hernandez D3 on 3/23/19.
//  Copyright © 2019 Alan iOS LAB. All rights reserved.
//

import UIKit

private let reuseIdentifier = "myCell"

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var imagesNames = [String]()
    var imagesArray = [UIImage]()
    var indexPathOfSelectedCell:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.darkGray
        loadImages()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func loadImages() {
        imagesNames = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10", "img11", "img12", "img13", "img14", "img15", "img16"]
        
        for fileName in imagesNames {
            if let image = UIImage(named: fileName) {
                imagesArray.append(image)
            }
        }
        
        
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imagesNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        cell.myImage.image = imagesArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let image = imagesArray[indexPath.row]
        return CGSize(width: 100.0, height: 100.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let myIndexPath = indexPathOfSelectedCell {
            let cell:UICollectionViewCell = collectionView.cellForItem(at: myIndexPath)!
            cell.layer.zPosition = 0
            cell.bounds = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
        }
        
        let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        cell.layer.zPosition = 1000
        cell.bounds = CGRect(x: 0, y: 0, width: 300.0, height: 300.0)
        
        indexPathOfSelectedCell = indexPath
        
        collectionView.sizeToFit()
        
        /*myLayout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(myLayout, animated: true)*/
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = MySuplementaryView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MyHeader", for: indexPath) as? MySuplementaryView)!
        }
        
        header.headerLabel.text = "Galeria"
        header.headerLabel.textColor = UIColor.white
        
        return header
    }

}
