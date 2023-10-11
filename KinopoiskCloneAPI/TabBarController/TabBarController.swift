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
        let vc2 = UINavigationController(rootViewController: MediaViewController())
        let vc3 = UINavigationController(rootViewController: MyMoviesViewController())
        let vc4 = UINavigationController(rootViewController: SearchViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
       
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "doc.plaintext")
        vc3.tabBarItem.image = UIImage(systemName: "bookmark")
        vc4.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc5.tabBarItem.image = UIImage(systemName: "person.crop.circle")
//        
//        vc1.tabBarItem.image = UIImage(named: "home")
//        vc2.tabBarItem.image = UIImage(named: "media")
//        vc3.tabBarItem.image = UIImage(named: "moye")
//        vc4.tabBarItem.image = UIImage(named: "search")
//        vc5.tabBarItem.image = UIImage(named: "profile")
        
        vc1.title = "Главное"
        vc2.title = "Медиа"
        vc3.title = "Моё"
        vc4.title = "Поиск"
        vc5.title = "Профиль"
        
     
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.8280770183, blue: 0, alpha: 1)

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
            
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


