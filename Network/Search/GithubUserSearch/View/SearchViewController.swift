//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // searchController
    // collectionView 구성
    // bind() 검색된 사용자를 collectionView 업데이트 하는것
    // // 데이터를 view로 뿌려주는것
    // // 사용자 인터렉션 대응 = searchControl에서 텍스트 - 네트워크 요청
    
}
