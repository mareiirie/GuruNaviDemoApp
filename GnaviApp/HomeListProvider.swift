//
//  HomeListProvider.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/29.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

final class HomeListProvider: NSObject {

    fileprivate var restInfo = [RestInfo]()

    func set(restInfo: [RestInfo]) {
        self.restInfo = restInfo
    }

//    func salesFloor(index: Int) -> SaleFloorImage {
//        return salesFloorImages[index]
//    }
}

//MARK : - UITableViewDataSource
extension HomeListProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restInfo.isEmpty ? 1 : restInfo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if restInfo.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEmptyCollectionViewCell.className, for: indexPath) as! HomeEmptyCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.className, for: indexPath) as! HomeCollectionViewCell
            cell.restInfo = restInfo[indexPath.row]
            return cell
        }
    }
}
