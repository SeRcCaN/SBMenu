
//  Created by Sercan Burak AĞIR on 9.07.2017.
//  Copyright © 2017 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class FourthCell: FirstCell {
    
    let FourthViewController: FourthVC = {
        let vc = FourthVC()
        return vc
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(FourthViewController.view)
        addConstraintsWithFormat(format: "H:|[v0]|", views: FourthViewController.view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: FourthViewController.view)
        
    }
    
}
