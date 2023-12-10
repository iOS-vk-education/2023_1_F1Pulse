//
//  HistoryController.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 21/11/2023.
//

import UIKit

class HistoryController: UIViewController {
    var drivers: [Drivers] = []
    
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: HistoryCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "History"
        setUpData()
        setUpCollectionView()
    }
    
    private func setUpData() {
        for i in 0...100 {
            let result = Drivers(name: "Name \(i) Surname \(i)")
            drivers.append(result)
        }
    }
}

extension HistoryController {
    fileprivate func setUpCollectionView() {
        cellWidth = view.frame.width - 10
        cellHeight = 50
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: cellWidth),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
}

extension HistoryController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drivers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HistoryCollectionViewCell.identifier,
            for: indexPath
        ) as! HistoryCollectionViewCell
        
        cell.configure(with: drivers[indexPath.row].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: cellWidth,
            height: cellHeight
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
