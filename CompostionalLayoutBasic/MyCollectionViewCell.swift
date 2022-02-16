//
//  MyCollectionViewCell.swift
//  CompostionalLayoutBasic
//
//  Created by Vicky Kumar on 20/12/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mylbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier:String{
        get{
            return "MyCollectionViewCell"
        }
    }
}
