//
//  HomeCollectionViewCell.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/29.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restAddress: UILabel!
    @IBOutlet weak var restTel: UILabel!
    @IBOutlet weak var restStation: UILabel!
    @IBOutlet weak var restBudget: UILabel!
    @IBOutlet weak var restImage: UIImageView!

    var restInfo: RestInfo? {

        didSet {
            guard let restInfo = restInfo else {
                return
            }

            if let shopImage = restInfo.imageUrl.shopImage1 {
                UIImage.cacheImage(from: shopImage){ (shopImage) in
                    DispatchQueue.main.async {
                        self.restImage.image = shopImage
                    }
                }
            } else {
                //画像がない場合の処理
            }

            if let restNameData = restInfo.name {
                restName.text = restNameData
            } else {
                //レストラン名がない場合の処理
            }

            if let restTelData = restInfo.tel {
                restTel.text = restTelData
            } else {
                //電話番号がない場合の処理
            }

            if let restStationData = restInfo.access.station {
                restTel.text = restStationData
            } else {
                //最寄駅がない場合の処理

            }

            if let restBudgetData = restInfo.budget {
                restBudget.text = String(restBudgetData)
            } else {
                //予算がない場合の処理
            }
        }

    }

}
