//
//  LicenzeAboutVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 24.10.2023.
//

import UIKit
import WebKit


class LicenzeAboutVC: UIViewController {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = .systemBackground
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.frame
        view.addSubview(webView)
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Лицензионное соглашение"
        
        let url = NSURL(string: "https://yandex.ru/legal/kinopoisk_mobile_agreement/index.html")
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
    }
    
}

