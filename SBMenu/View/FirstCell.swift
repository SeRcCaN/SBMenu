
//  Created by Sercan Burak AĞIR on 8.07.2017.
//  Copyright © 2017 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class FirstCell: BaseCell {
    
    let FirstViewController: FirstVC = {
        let vc = FirstVC()
        return vc
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(FirstViewController.view)
        addConstraintsWithFormat(format: "H:|[v0]|", views: FirstViewController.view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: FirstViewController.view)
    }  
}
