//
//  OneKeyboardView.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//


import UIKit

protocol OneKeyboardViewDelegate: class {
    func updateHeight()
}

class OneKeyboardView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var buttonButton: KeyboardButton!
    @IBOutlet weak var backButton: KeyboardButton!
    @IBOutlet weak var jokeImageView: UIImageView!
    @IBOutlet weak var jokeTextView: UITextView!
    @IBOutlet weak var nextKeyboardButton: KeyboardButton!
    
    // MARK: - Constraints
    @IBOutlet weak var firstViewLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var viewModel = OneKeyboardViewModel()
    weak var delegate:OneKeyboardViewDelegate?
    var selectedPage:KeyboardPage = .firstPage {
        didSet{
            if selectedPage == .secondPage {
                getJoke()
            }
        }
    }
    
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
        scroll(to: .secondPage)
    }
    
    @IBAction func backButtonPressed(_ sender: KeyboardButton) {
        scroll(to: .firstPage)
    }
    @IBAction func getNewJokeButtonPressed(_ sender: KeyboardButton) {
        getJoke()
    }
    
    // MARK: - Initial functions
    func setup(){
        viewModel.delegate = self
        setNextKeyboardVisible(false)
    }
    
    // MARK: - Functions
    func setNextKeyboardVisible(_ visible: Bool) {
        nextKeyboardButton.isHidden = !visible
    }
}

// MARK: - OneKeyboardViewModel Delegate
extension OneKeyboardView: OneKeyboardViewModelDelegate {
    
    func tellJoke(_ joke:String, _ image:UIImage){
        jokeTextView.text = joke
        jokeImageView.image = image
    }
    
}

