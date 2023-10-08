//
//  TabBarViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadViewController())
        
        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "play")
        vc3.tabBarItem.image = UIImage(named: "search")
        vc4.tabBarItem.image = UIImage(named: "download")
        
        vc1.title = "Home"
        vc2.title = "Upcoming"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
       // tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }

  
    
    
    // MARK: animations tap element tabBar_1
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.SimpleAnimationWhereSelectItem(item)
        
    }
    // MARK: animations tap element tabBar_2
    func SimpleAnimationWhereSelectItem(_ item: UIBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else {return}
        
        let timeInterval: TimeInterval = 0.5
        let propertyAnimation = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        propertyAnimation.addAnimations({barItemView.transform = .identity}, delayFactor: CGFloat(timeInterval))
        propertyAnimation.startAnimation()
    }
    
}


