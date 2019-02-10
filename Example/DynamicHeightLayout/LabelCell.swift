//
//  LabelCell.swift
//  DynamicHeightLayout_Example
//
//  Created by Huang Tung on 2019/2/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    let label: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
