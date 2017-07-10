
//  Created by Sercan Burak AĞIR on 7.07.2017.
//  Copyright © 2017 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum SettingName: String {
    
    case Cancel = "Cancel"
    case Settings = "Settings"
    case Terms = "Terms & Privacy"
    case FeedBack = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
    
}

class SettingsLauncher: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let blackView = UIView()
    let cellHeight:CGFloat = 50
    var homeController: HomeController?
    
    let collectionViev: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let settings: [Setting] = {
        
        let sett = Setting(name: .Settings, imageName: "settings")
        let terms = Setting(name: .Terms, imageName: "privacy")
        let feed = Setting(name: .FeedBack, imageName: "feedback")
        let help = Setting(name: .Help, imageName: "help")
        let swtchacc = Setting(name: .SwitchAccount, imageName: "switch_account")
        let cancel = Setting(name: .Cancel, imageName: "cancel")
        
        return [sett, terms, feed, help, swtchacc, cancel]
    }()
    
    func showSettings(){
        //Menu Göster
        
        if let window = UIApplication.shared.keyWindow{
            
            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(collectionViev)
            let height:CGFloat = CGFloat(settings.count) * cellHeight
            let y = window.frame.height - height
            collectionViev.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            self.blackView.frame = window.frame
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissBlackView)))
            self.blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.collectionViev.frame = CGRect(x: 0, y: y, width: self.collectionViev.frame.width, height: self.collectionViev.frame.height)
                self.blackView.alpha = 1
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismissBlackView(setting: Setting){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
                self.collectionViev.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
            
        }) { (completed: Bool) in
            
            if setting.name != .Cancel{
                self.homeController?.showControllerForSetting(setting: setting)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SettingsCell
        
        let setting = settings[indexPath.item]
        cell.setting = setting
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = self.settings[indexPath.item]
        handleDismissBlackView(setting: setting)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        
        collectionViev.delegate = self
        collectionViev.dataSource = self
        
        collectionViev.register(SettingsCell.self, forCellWithReuseIdentifier: "cellId")
        
        
    }
}
