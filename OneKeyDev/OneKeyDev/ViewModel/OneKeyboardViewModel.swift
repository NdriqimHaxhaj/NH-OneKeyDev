//
//  OneKeyboardViewModel.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/8/20.
//

import UIKit

protocol OneKeyboardViewModelDelegate: class {
    func tellJoke(_ joke:String, _ image:UIImage)
}

class OneKeyboardViewModel: NSObject {
    
    // MARK: - Properties
    weak var delegate:OneKeyboardViewModelDelegate?
    
    // MARK: - Initializers
    
    // MARK: - Functions
    
    func formatJoke(_ joke:Joke){
        guard let jokeString = joke.value else {return}
        guard let iconURLString = joke.iconURL else {return}
        guard let iconURL = URL(string: iconURLString) else {return}
        loadImage(from: iconURL) { (image) in
            guard let image = image else {return}
            self.delegate?.tellJoke(jokeString, image)
        }
    }
    
    func loadImage(from url: URL, completion: @escaping (_ image:UIImage?)->Void) {
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    completion(image)
                }else {
                    completion(nil)
                }
            }
        }
    }
}

