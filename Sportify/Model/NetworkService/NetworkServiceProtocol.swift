//
//  NetworkServiceProtocol.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

import Foundation

protocol NetworkServiceProtocol{
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
}
