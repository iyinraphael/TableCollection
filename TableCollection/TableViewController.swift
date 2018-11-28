//
//  TableViewController.swift
//  TableCollection
//
//  Created by Iyin Raphael on 11/28/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return ColorHelper.shared.sectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return ColorHelper.shared.rowCountFor(section: section)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else { fatalError("unable to deque proper cell")}
        cell.nameLable.text = ColorHelper.shared.colorNameFor(indexPath: indexPath)
        cell.swatchView.backgroundColor = ColorHelper.shared.colorFor(indexPath: indexPath)


        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //classes are refernces types
        //a class uses an indirecr storage
        //So even though this is a let constannt you can
        //change its properties because label is a class instance
        
        //label is a pointer, so it has the address of memory
        //that stores all the information for a UILabel instance
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .black
        label.textColor = .white
        label.text = ColorHelper.shared.sectionNameFor(indexPath: IndexPath(row: 0, section: section))
     return label
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ColorHelper.shared.sectionTitles()
    }

    

}
