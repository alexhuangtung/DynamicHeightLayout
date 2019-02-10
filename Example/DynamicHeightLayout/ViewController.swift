//
//  ViewController.swift
//  DynamicHeightLayout
//
//  Created by alexhuangVT on 02/10/2019.
//  Copyright (c) 2019 alexhuangVT. All rights reserved.
//

import UIKit
import DynamicHeightLayout

class ViewController: UIViewController {
    
    private let colors: [UIColor] = [
        UIColor(red: 0.8, green: 1.0, blue: 1.0, alpha: 1),
        UIColor(red: 1.0, green: 0.8, blue: 1.0, alpha: 1),
        UIColor(red: 1.0, green: 1.0, blue: 0.8, alpha: 1),
        UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 1),
        UIColor(red: 0.8, green: 1.0, blue: 0.8, alpha: 1),
        UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 1)
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = DynamicHeightLayout(delegate: self)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(LabelCell.self, forCellWithReuseIdentifier: "Cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LabelCell
        cell.label.text = "\(indexPath.item + 1)"
        cell.backgroundColor = colors[indexPath.item % colors.count]
        return cell
    }
    
}

extension ViewController: DynamicHeightLayoutDelegate {
    
    func numberOfColumnsForSection(at section: Int) -> Int {
        return 3
    }
    
    func lineSpacingForSection(at section: Int) -> CGFloat {
        return 0
    }
    
    func interitemSpacingForSection(at section: Int) -> CGFloat {
        return 0
    }
    
    func insetForSection(at section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func heightForItem(at indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(200) + 50)
    }
    
}
