//
//  NetworkConstant.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 17/04/24.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        
    }
    
    public var apiKey: String {
        get {
            return "6e6b46c7de1f33fc642a0105911f4bb5"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
