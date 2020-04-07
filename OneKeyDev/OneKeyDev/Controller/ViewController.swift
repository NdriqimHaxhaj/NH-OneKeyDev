//
//  ViewController.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

