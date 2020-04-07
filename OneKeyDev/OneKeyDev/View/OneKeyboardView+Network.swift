//
//  OneKeyboardView+Network.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/8/20.
//

import UIKit

extension OneKeyboardView {
    func getJoke(){
        // TODO: start loader
        ServiceLayer.request(router: .getJoke) { (result: Result<Joke, Error>) in
            // TODO: stop loader
            switch result {
            case .success:
                do {
                    let joke = try result.get()
                    // TODO: update view model
                } catch {
                    print(error.localizedDescription)
                }
            case .failure:
                print(result)
            }
        }
    }
}

