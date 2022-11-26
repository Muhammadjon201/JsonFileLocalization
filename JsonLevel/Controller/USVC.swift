//
//  USVC.swift
//  JsonLevel
//
//  Created by ericzero on 11/17/22.
//

import UIKit
import SnapKit

class USVC: UIViewController {

//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 16
//        layout.scrollDirection = .vertical
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .white
//        return cv
//        }()
//    var collectionArr = [Data3]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUp()
//    }
//
//    func setUp() {
//        view.backgroundColor = .systemPink
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(USCVC.self, forCellWithReuseIdentifier: "USCVC")
//
//        view.addSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
//            make.left.equalTo(50)
//            make.right.equalTo(-50)
//            make.bottom.equalTo(-50)
//        }
//
//
//        collectionArr.append(Data3(name: "New York"))
//        collectionArr.append(Data3(name: "Arizona"))
//        collectionArr.append(Data3(name: "Vegas"))
//        collectionArr.append(Data3(name: "Los Angeles"))
//        collectionArr.append(Data3(name: "Chicago"))
//
//    }
//
//}
//
//extension USVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        collectionArr.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "USCVC", for: indexPath) as? USCVC else { return UICollectionViewCell() }
//        cell.updateCell(data: collectionArr[indexPath.row])
//        return cell
//    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        <#code#>
////    }
//
}


