//
//  BleachViewController.swift
//  Bleach
//
//  Created by Jason Franklin on 03/10/2016.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import UIKit

class BleachViewController: UIViewController {
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton {
            if let imageViewController = segue.destination.contentViewController() as? ImageViewController {
                imageViewController.imageURL = BleachURLS.mapURL(identifier: button.currentTitle!)
                imageViewController.navigationItem.title = button.currentTitle
            }
        }
    }
}

extension UIViewController {
    func contentViewController() -> UIViewController {
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController ?? self
        } else {
            return self
        }
    }
}
