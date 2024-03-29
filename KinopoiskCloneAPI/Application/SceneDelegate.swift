//
//  SceneDelegate.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

   static var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        SceneDelegate.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        SceneDelegate.window?.windowScene = windowScene
        //window?.rootViewController = TabBarBabyProfile()
        SceneDelegate.window?.rootViewController = AnimeViewController()
        
        SceneDelegate.window?.makeKeyAndVisible()
        let vc = TabBarController()
        //MARK: color TabBar
        //vc.tabBar.tintColor = #colorLiteral(red: 1, green: 0.8280770183, blue: 0, alpha: 1)
        //MARK: button color when not pressed (не нажатая)
        vc.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //MARK: Pressed button color (нажатая)
        vc.tabBar.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        
//        guard let scene = (scene as? UIWindowScene) else { return }
//        
//        let window = UIWindow(windowScene: scene)
//        window.rootViewController = TabBarController()
//        window.makeKeyAndVisible()
//        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

