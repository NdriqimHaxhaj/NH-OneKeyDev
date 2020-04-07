//
//  Router.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/7/20.
//

import Foundation

enum Router {
    
    // MARK: - Values
    case getJoke
    
    // MARK: - Properties
    var scheme: String {
        switch self {
        case .getJoke:
            return "https"
        }
    }
    
    var token: String {
        switch self {
        case .getJoke:
            return "d6855e4996msh9a9cbba23e437c0p19bbc4jsn521336cfa4dd"
        }
    }
    
    var host: String {
        switch self {
        case .getJoke:
            return "matchilling-chuck-norris-jokes-v1.p.rapidapi.com"
        }
    }
    
    var path: String {
        switch self {
        case .getJoke:
            return "/jokes/random"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getJoke:
            return []
        }
    }
    
    var method: String {
      switch self {
      case .getJoke:
        return "GET"
      }
    }
}
