//
//  ChatWithSupportVC.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 16.10.2023.
//

import UIKit
import WebKit


class ChatWithSupportVC: UIViewController {
    
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
        navigationItem.title = "Чат с поддержкой"
        
        let url = NSURL(string: "https://wink.ru/offer")
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
    }
    
}
