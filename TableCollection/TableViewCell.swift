//
//  TableViewCell.swift
//  TableCollection
//
//  Created by Iyin Raphael on 11/28/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "tableCell"
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var swatchView: UIView!
    
    //static properties mean you can access themm through the class without having
    //to create an instance of the class

}
