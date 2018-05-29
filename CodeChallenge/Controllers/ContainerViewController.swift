//
//  ContainerViewController.swift
//  CodeChallenge
//
//  Created by Manikanta Varma on 5/29/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially close menu programmatically
        DispatchQueue.main.async() {
            self.closeMenu(animated: false)
        }
        
        // Tab bar controller's Hamburger-Menu toggles the menu
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerViewController.toggleMenu), name: NSNotification.Name(rawValue: toggleMenuKey), object: nil)
        
        // Close menu when the device rotates
        NotificationCenter.default.addObserver(self, selector: #selector(ContainerViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Remove notifications when ViewController is removed form Memory
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func toggleMenu() {
        scrollView.contentOffset.x == 0  ? closeMenu() : openMenu()
    }
    
    func closeMenu(animated: Bool = true) {
        // Set proper scrollview content offset-x to hide Menu
        scrollView.setContentOffset(CGPoint(x: toggleMenuWidth, y: 0), animated: animated)
    }
    
    func openMenu() {
        // Set proper scrollview content offset-x to Show Menu
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            DispatchQueue.main.async() {
                self.closeMenu()
            }
        }
    }
    
}
