//
//  UsersDataService.swift
//  MVVM
//
//  Created by Михаил Щербаков on 23.03.2022.
//
// https://jsonplaceholder.typicode.com/users

import Foundation
import Combine

class UsersDataService {
    
    let users = CurrentValueSubject<[User], Never>([])
    let lastError = PassthroughSubject<Error, Never>() // Обработчик ошибок с сервера
    
    private let networkManager: NetworkManager
    private var fetchUserCancellable: Cancellable?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    //MARK: Public section
    
    func fetchUsers() {
        
        print("fetching")
        
        fetchUserCancellable?.cancel()
        
        fetchUserCancellable = networkManager.request(method: .get,
                                                      path: "/users",
                                                      body: Optional<Int>.none,
                                                      headers: nil,
                                                      queryItems: nil)
            .sink(receiveCompletion: { _ in
                // тут передается обработчик ошибок с сервера
            }, receiveValue: { [weak self] (users: [User]) in
                self?.setUserData(users: users)
            })
    }
    
    //MARK: Private section
    
    private func setUserData(users: [User]) {
        self.users.send(users)
    }
    
}
