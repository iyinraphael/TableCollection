//
//  CollectionViewController.swift
//  TableCollection
//
//  Created by Iyin Raphael on 11/28/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headernib = UINib(nibName: "CollectionReuseableHeaderView", bundle: nil)
        collectionView.register(headernib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableViewHeaderView.reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else { fatalError("failed to request header")}
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableViewHeaderView.reuseIdentifier, for: indexPath) as? CollectionReusableViewHeaderView else { fatalError("Unable to deque header")}
        header.nameLabel.text = ColorHelper.shared.sectionNameFor(indexPath: indexPath)
        return header 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        let amount: CGFloat = 32
        layout.sectionInset = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return ColorHelper.shared.sectionCount
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return ColorHelper.shared.rowCountFor(section: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("unable to deque proper cell")}
        cell.nameLable.text = ColorHelper.shared.colorNameFor(indexPath: indexPath)
        cell.swatchView.backgroundColor = ColorHelper.shared.colorFor(indexPath: indexPath)
        return cell
    }

    

}
