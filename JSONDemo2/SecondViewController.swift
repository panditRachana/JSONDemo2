//
//  SecondViewController.swift
//  JSONDemo2
//
//  Created by Rachana Pandit on 21/11/22.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var lblFirstName:UILabel!
    @IBOutlet weak var lblLastName:UILabel!
    @IBOutlet weak var imgAvatar:UIImageView!
    
   // var tag = Int()
    var id = Int()
    var email = String()
    var firstName = String()
    var lastName = String()
    var imgUrl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblId.text = String(id)
        lblEmail.text = email
        lblFirstName.text = firstName
        lblLastName.text = lastName
        
        let urlFetched = NSURL(string: imgUrl)
        imgAvatar.sd_setImage(with: urlFetched as URL?)
        
    }
    
}


