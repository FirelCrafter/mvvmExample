//
//  UsersViewModel.swift
//  MVVM
//
//  Created by Михаил Щербаков on 23.03.2022.
//

import Foundation
import Combine


class UsersViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private let usersDataService: UsersDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(usersDataService: UsersDataService) {
        self.usersDataService = usersDataService
    }
    
    func getUsers() {
        usersDataService.fetchUsers()
        usersDataService.users
            .sink { [weak self] recievedUsers in
                self?.users = recievedUsers
            }
            .store(in: &cancellables)
    }
    
    
}
