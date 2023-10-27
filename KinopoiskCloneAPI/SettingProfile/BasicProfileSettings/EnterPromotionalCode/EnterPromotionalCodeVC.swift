//
//  EnterPromotionalCodeVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit
import WebKit

class EnterPromotionalCodeVC: UIViewController {
    
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
        navigationItem.title = "Яндекс ПЛЮС: управление подпиской"
        
        let url = NSURL(string: "https://plus.yandex.ru/gift")
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
    }
    
    
}
