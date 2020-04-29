//
//  UIViewController+ActivityIndicator.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/29.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

extension UIViewController {

    func startActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.color = .gray
    }

    func stopActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
}
