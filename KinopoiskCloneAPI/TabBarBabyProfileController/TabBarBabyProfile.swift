//
//  TabBarBabyProfile.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit

class TabBarBabyProfile: UITabBarController {
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           
           let vc1 = UINavigationController(rootViewController: HomeBabyController())
           let vc2 = UINavigationController(rootViewController: MyMoviesBabyController())
           let vc3 = UINavigationController(rootViewController: MySearchBabyController())
           let vc4 = UINavigationController(rootViewController: Profile12BabyController())
        
           
           vc1.tabBarItem.image = UIImage(systemName: "house")
           vc2.tabBarItem.image = UIImage(systemName: "bookmark")
           vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
           vc4.tabBarItem.image = UIImage(systemName: "figure.child.circle")
           
           vc1.title = "Главное"
           vc2.title = "Моё"
           vc3.title = "Поиск"
           vc4.title = "Профиль 12+"
           
           tabBar.unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           tabBar.tintColor = #colorLiteral(red: 0.7374973893, green: 0.3040031195, blue: 0, alpha: 1)
           setViewControllers([vc1, vc2, vc3, vc4], animated: true)
               }
          

       // MARK: animations tap element tabBar_1
       override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
           self.SimpleAnimationWhereSelectItem(item)
           
       }
       // MARK: animations tap element tabBar_2
       func SimpleAnimationWhereSelectItem(_ item: UIBarItem) {
           guard let barItemView = item.value(forKey: "view") as? UIView else {return}
           
           let timeInterval: TimeInterval = 0.4
           let propertyAnimation = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.4) {
               barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.3, y: 1.3)
           }
           propertyAnimation.addAnimations({barItemView.transform = .identity}, delayFactor: CGFloat(timeInterval))
           propertyAnimation.startAnimation()
       }
}
