
//  Created by Sercan Burak AĞIR on 8.07.2017.
//  Copyright © 2017 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class ThirthCell: FirstCell {
    
    let ThirthViewController: ThirthVC = {
        let vc = ThirthVC()
        return vc
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(ThirthViewController.view)
        addConstraintsWithFormat(format: "H:|[v0]|", views: ThirthViewController.view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: ThirthViewController.view)
        
    }
}
