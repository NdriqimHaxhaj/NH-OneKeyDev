//
//  KeyboardViewController.swift
//  OneKeyboardExtension
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    // MARK: - IBOutlets
    @IBOutlet var nextKeyboardButton: UIButton!
    
    // MARK: - Properties
    var oneKeyboardView: OneKeyboardView!
    
    // MARK: - Constraints
    var topConstraint: NSLayoutConstraint!
    var leftConstraint: NSLayoutConstraint!
    var rightConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    var extendedHeightConstraint:NSLayoutConstraint!
    
    // MARK: - Constants
    let additionalHeight:CGFloat = 20
    var keyboardHeight:CGFloat?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNextButton()
        setupOneKeyboardView()
    }
    
    // MARK: - Layout functions
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if (view.frame.size.width == 0 || view.frame.size.height == 0) {
            return
        }
        
        if oneKeyboardView.selectedPage == .secondPage {
            keyboardHeight = oneKeyboardView.bounds.height
            extendedHeightConstraint = NSLayoutConstraint(item: self.view as Any,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 0.0,
                                                          constant: keyboardHeight! + 20)
            view.removeConstraint(heightConstraint)
            view.addConstraint(extendedHeightConstraint)
        } else {
            guard let keyboardHeight = keyboardHeight else {return}
            heightConstraint = NSLayoutConstraint(item: self.view as Any,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 0.0,
                                                  constant: keyboardHeight)
            view.removeConstraint(extendedHeightConstraint)
            view.addConstraint(heightConstraint)
        }
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Functions
    func setupNextButton(){
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func setupOneKeyboardView(){
        let nib = UINib(nibName: "OneKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        oneKeyboardView = objects.first as? OneKeyboardView
        guard let inputView = inputView else { return }
        inputView.addSubview(oneKeyboardView)
        
        // 3
        oneKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = oneKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor)
        leftConstraint = oneKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor)
        rightConstraint = oneKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor)
        bottomConstraint = oneKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
        heightConstraint = oneKeyboardView.heightAnchor.constraint(equalTo: inputView.heightAnchor)
        
        let constraints:[NSLayoutConstraint] = [topConstraint,
                                                leftConstraint,
                                                rightConstraint,
                                                bottomConstraint,
                                                heightConstraint]
        
        view.addConstraints(constraints)
        NSLayoutConstraint.activate(constraints)
        
        oneKeyboardView.setNextKeyboardVisible(!needsInputModeSwitchKey)
        oneKeyboardView.keyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        oneKeyboardView.delegate = self
    }
    
    // MARK: - Keyboard functions
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

// MARK: - OneKeyboardView Delegate
extension KeyboardViewController: OneKeyboardViewDelegate {
    func updateHeight() {
        updateViewConstraints()
    }
}
