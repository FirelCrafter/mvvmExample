//
//  ContentView.swift
//  MVVM
//
//  Created by Михаил Щербаков on 23.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var usersVM: UsersViewModel
    
    var body: some View {
        List(usersVM.users) {
            Text($0.name)
        }
        .onAppear {
            usersVM.getUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Assembly.shared.usersViewModel)
    }
}
