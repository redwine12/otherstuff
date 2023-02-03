//
//  SearchViewModel.swift
//  GithubUserProfile
//
//  Created by 이재영 on 2023/02/03.
//

import Foundation
import Combine

final class SearchViewModel {
    
    let network = NetworkService
    
    init(network: NetworkService, selectedUser: UserProfile?) {
        self.network = network
        self.selectedUser = CurrentValueSubject(selectedUser)
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    // Data -> Output
//    @Published private(set) var user: UserProfile?
    let selectedUser = CurrentValueSubject<UserProfile?, Never>
    
    // User Action -> Input
    func search(keyword: String) {
        
        let resource = Resource<UserProfile>(base: "https://api.github.com/", path: "users/\(keyword)", params: [:], header: ["Content-Type": "application/json"])
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.user = nil
                    print("error: \(error)")
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)
    }
}
