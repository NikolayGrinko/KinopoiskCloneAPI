//
//  HomeBabyController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.10.2023.
//

import UIKit
import WebKit

class HomeBabyController: UIViewController {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = .systemBackground
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        
        webView.frame = view.frame
        view.addSubview(webView)
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Тариф - 'Плюс Детям'"
        
        let url = NSURL(string: "https://plus.yandex.ru/skazbuka?widgetServiceName=skazbuka_perf&utm_source=direct_network&utm_medium=paid_performance&utm_campaign=93775142|MSCAMP-538_[CH-P]_{WS:N}_RU-225_goal-CH_Acquisition_Kids-Landing-Acq/MK_Skazbuka-Kreo_Skazbuka-General&utm_term=дети&utm_content=INTid|010000004654227874846542278748|cid|93775142|gid|5265577332|aid|15231146198|pos|premium1|src|searchnone|dvc|desktop|retid|0&yclid=8124916784692985855")
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
    }
    
}
