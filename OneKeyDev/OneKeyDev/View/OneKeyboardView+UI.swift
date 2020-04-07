//
//  OneKeyboardView+UI.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//

import UIKit

extension OneKeyboardView {
    
    func setColorScheme(for view:UIView, _ colorScheme: KeyboardColorScheme) {
        let colorKeyboard = KeyboardColors(colorScheme: colorScheme)
        
        for v in view.subviews {
            if v is KeyboardButton {
                let v = v as! KeyboardButton
                v.setTitleColor(colorKeyboard.buttonTextColor, for: [])
                v.tintColor = colorKeyboard.buttonTextColor
                v.defaultBackgroundColor = colorKeyboard.buttonBackgroundColor
                v.highlightBackgroundColor = colorKeyboard.buttonHighlightColor
            } else {
                setColorScheme(for: v, colorScheme)
            }
        }
    }
    
    func scroll(to page: KeyboardPage){
        
        self.firstViewLeadingConstraint.constant = page == .firstPage ? 0 : -self.bounds.width
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        }) { (_) in
            self.selectedPage = page
            self.delegate?.updateHeight()
        }
    }
}
