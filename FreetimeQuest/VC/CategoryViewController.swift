//
//  CategoryViewController.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 14.03.2021.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func greyAreaTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
