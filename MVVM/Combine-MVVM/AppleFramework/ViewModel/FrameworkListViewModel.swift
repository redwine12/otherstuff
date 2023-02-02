//
//  FrameworkListViewModel.swift
//  AppleFramework
//
//  Created by 이재영 on 2023/02/02.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    // Data => Output
    var items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    // User Action => Input
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    
    func didSelect(at indexPath: IndexPath) {
        selectedItem.send(item)
    }
}
