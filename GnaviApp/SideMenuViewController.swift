//
//  SideMenuViewController.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/12.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.topItem!.title = ""
    }

    class func instance() -> SideMenuViewController {

        guard let viewController = UIStoryboard.viewController(
            storyboardName: SideMenuViewController.className,
            identifier:  SideMenuViewController.className) as? SideMenuViewController else {
                fatalError("SalesFloorDetailViewController not Found.")
        }
        return viewController
    }

}
