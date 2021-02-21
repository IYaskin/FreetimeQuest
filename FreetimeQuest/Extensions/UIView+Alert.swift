//
//  UIView+Alert.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 21.02.2021.
//

import UIKit

extension UIView {
    
    func showAlert(title: String,
                       message: String?,
                       okButtonTitle: String,
                       okAction: ((UIAlertAction) -> Void)?,
                       cancelButtonTitle: String,
                       cancelAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: okButtonTitle,
                                     style: .default,
                                     handler: okAction)
        alert.addAction(okAction)

        let cancelAction = UIAlertAction(title: cancelButtonTitle,
                                         style: .default,
                                         handler: cancelAction)
        alert.addAction(cancelAction)
        UIApplication.topViewController()?.present(alert,
                                                   animated: true,
                                                   completion: nil)
    }

}
