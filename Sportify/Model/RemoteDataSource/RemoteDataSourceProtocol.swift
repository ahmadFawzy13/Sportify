//
//  RemoteDataSourceProtocol.swift
//  Sportify
//
//  Created by Abdullah Raed on 11/05/2025.
//

import Foundation


protocol RemoteDataSource{
    
    func getAllFootballLeagues(completionHandler : @escaping ([League]) -> Void)
}
