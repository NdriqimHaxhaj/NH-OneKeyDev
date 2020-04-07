//
//  OneKeyboardView+Network.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/8/20.
//

import UIKit

extension OneKeyboardView {
    func getJoke(){
        self.showLoader()
        ServiceLayer.request(router: .getJoke) { (result: Result<Joke, Error>) in
            self.stopLoader()
            switch result {
            case .success:
                do {
                    let joke = try result.get()
                    self.viewModel.formatJoke(joke)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure:
                print(result)
            }
        }
    }
}

