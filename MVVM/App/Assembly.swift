//
//  Assembly.swift
//  MVVM
//
//  Created by Михаил Щербаков on 23.03.2022.
//

import Foundation


class Assembly {
    
    static let shared = Assembly()
    
    private init() {  }
    
    //MARK: Services
    
    private(set) lazy var networkManager: NetworkManager = NetworkManager()
    private(set) lazy var usersDataService: UsersDataService = UsersDataService(networkManager: networkManager)
    
    
    //MARK: ViewModels
    
    var usersViewModel: UsersViewModel {
        return UsersViewModel(usersDataService: usersDataService)
    }
    
    
}
