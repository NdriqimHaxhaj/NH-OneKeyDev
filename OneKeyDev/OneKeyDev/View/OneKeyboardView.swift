//
//  OneKeyboardView.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//


import UIKit

protocol OneKeyboardViewDelegate: class {
    // TODO: Update height at Keyboard extension somehow
}

class OneKeyboardView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var buttonButton: KeyboardButton!
    @IBOutlet weak var backButton: KeyboardButton!
    @IBOutlet weak var jokeImageView: UIImageView!
    @IBOutlet weak var jokeTextView: UITextView!
    @IBOutlet weak var keyboardButton: KeyboardButton!
    
    // MARK: - Constraints
    @IBOutlet weak var firstViewLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    weak var delegate:OneKeyboardViewDelegate?
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - IBActions
    @IBAction func nextViewButtonPressed(_ sender: KeyboardButton) {
        // TODO: Scroll to 1
    }
    
    @IBAction func backButtonPressed(_ sender: KeyboardButton) {
        // TODO: Scroll to 0
    }
    @IBAction func getNewJokeButtonPressed(_ sender: KeyboardButton) {
        // TODO: Get new joke
    }
    
    // MARK: - Initial functions
    func setup(){
        // TODO: setup things
    }
    
    // MARK: - Functions
    func setNextKeyboardVisible(_ visible: Bool) {
      keyboardButton.isHidden = !visible
    }
}
