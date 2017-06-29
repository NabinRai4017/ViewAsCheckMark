//
//  SamipCostumTableViewCell.swift
//  LearningDemo
//
//  Created by nabinrai on 2/3/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import UIKit


class
TableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewInTableViewCell: UIView!
    
    @IBOutlet weak var labelInTableViewCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.viewInTableViewCell.layer.borderColor = UIColor.blue.cgColor
        
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




@IBDesignable class CornerRadiusView: UIView{
    
    @IBInspectable public var cornorRadius:CGFloat = 3.0 {
        didSet {
            setUpCornerRadius(radius: cornorRadius)
        }
    }
    
    @IBInspectable public var isBorder:Bool = false {
        didSet {
            setUpCornerRadius(radius: cornorRadius)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCornerRadius(radius: cornorRadius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCornerRadius(radius: cornorRadius)
    }
    
    func setUpCornerRadius(radius: CGFloat){
        
        //self.set(cornerRadiusOf: radius)
        layer.cornerRadius = radius
        layer.masksToBounds = true
        if isBorder{
            layer.borderColor = UIColor.gray.cgColor
            layer.borderWidth = 1.0
        }
    }
}
