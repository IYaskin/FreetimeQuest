//
//  WebViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 16.04.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var navBarTitle: String? {
        didSet {
            self.title = navBarTitle
        }
    }
    
    let host = "https://yandex.ru/search/?text="

    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        if let urlString = urlString,
           let encodedURL = (host + urlString).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encodedURL) {
            print("valid url = \(url)")
            webView.load(URLRequest(url: url))

        } else {
           print("invalid url")
        }
    }
}
