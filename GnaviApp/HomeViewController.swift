//
//  ViewController.swift
//  GnaviApp
//
//  Created by 入江真礼 on 2020/04/12.
//  Copyright © 2020 入江真礼. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var homeCollectionView: UICollectionView!

    private let datasource = HomeListProvider()
    private let homeAPI = HomeAPI()
    private let getAPIService = GetAPIService()
    private var restList = [RestInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        homeCollectionView.delegate = self
        getAPIService.delegate = self

        startActivityIndicator()
        setCells()
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        getAPIService.getHomeInfo()
    }

    private func setUpView(){
        homeCollectionView.dataSource = datasource
    }

    private func setCells(){
        homeCollectionView.register(UINib(nibName: HomeCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HomeCollectionViewCell.className)
        homeCollectionView.register(UINib(nibName: HomeEmptyCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HomeEmptyCollectionViewCell.className)
    }

}

extension HomeViewController: GetAPIServiceDelegate {

    func error(status: WebAPIReturnCode) {
        self.stopActivityIndicator()
        self.showWarning(message: status.rawValue)
    }

    func unauthorized() {
        self.stopActivityIndicator()
        self.showWarning(message: "不正な権限")
    }

    func finishReloadHomeInfo(data: HomeResponse){
        restList = data.rest
        datasource.set(restInfo: restList)
        homeCollectionView.reloadData()
        stopActivityIndicator()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        if restList.isEmpty {
            size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        } else {
            let width = collectionView.frame.size.width
            let height = width * 1.1
            size = CGSize(width: width, height: height)
        }
        return size
    }
}
