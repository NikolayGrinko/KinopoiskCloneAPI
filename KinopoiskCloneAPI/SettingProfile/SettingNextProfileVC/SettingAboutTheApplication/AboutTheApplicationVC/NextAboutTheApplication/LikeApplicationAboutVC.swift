//
//  LikeApplicationAboutVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 24.10.2023.
//

import UIKit
import WebKit


class LikeApplicationAboutVC: UIViewController {
    
//    private let webView: WKWebView = {
//        let webView = WKWebView()
//        webView.backgroundColor = .systemBackground
//        return webView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        webView.frame = view.frame
//        view.addSubview(webView)
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Оценить приложение"
        // MARK: пока временная ссылка(не работает AppStore)
        guard let url = URL(string: "https://www.kinopoisk.ru") else {
          return //be safe
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
