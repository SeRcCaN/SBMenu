
//  Created by Sercan Burak AĞIR on 8.07.2017.
//  Copyright © 2017 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class SecondCel: FirstCell {
    
    let SecondViewController: SecondVC = {
        let vc = SecondVC()
        return vc
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(SecondViewController.view)
        addConstraintsWithFormat(format: "H:|[v0]|", views: SecondViewController.view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: SecondViewController.view)
        
    }
}
