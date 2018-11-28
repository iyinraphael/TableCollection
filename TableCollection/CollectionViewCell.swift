//
//  CollectionViewCell.swift
//  TableCollection
//
//  Created by Iyin Raphael on 11/28/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "cell"
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var swatchView: UIView!
    
}
