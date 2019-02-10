//
//  DynamicHeightLayout.swift
//  DynamicHeightLayout
//
//  Created by Huang Tung on 2019/2/10.
//

import UIKit

public protocol DynamicHeightLayoutDelegate: class {
    
    func numberOfColumnsForSection(at section: Int) -> Int
    
    func lineSpacingForSection(at section: Int) -> CGFloat
    
    func interitemSpacingForSection(at section: Int) -> CGFloat
    
    func insetForSection(at section: Int) -> UIEdgeInsets
    
    func heightForItem(at indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
    
}

public class DynamicHeightLayout: UICollectionViewLayout {
    
    private weak var delegate: DynamicHeightLayoutDelegate!
    
    fileprivate var cache = [IndexPath: UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        
        let inset = collectionView.contentInset
        return collectionView.bounds.width - inset.left - inset.right
    }
    
    fileprivate var contentHeight: CGFloat = 0
    
    public init(delegate: DynamicHeightLayoutDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        contentHeight = 0
        var cache = [IndexPath: UICollectionViewLayoutAttributes]()
        var offset: CGFloat = 0
        for section in 0 ..< collectionView.numberOfSections {
            let numberOfColumns = delegate.numberOfColumnsForSection(at: section)
            let lineSpacing = delegate.lineSpacingForSection(at: section)
            let interitemSpacing = delegate.interitemSpacingForSection(at: section)
            let inset = delegate.insetForSection(at: section)
            var column = 0
            var sectionOffsets = [CGFloat](repeating: offset + inset.top, count: numberOfColumns)
            for item in 0 ..< collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                let availableWidth: CGFloat = (contentWidth - inset.left - inset.right - CGFloat(numberOfColumns - 1) * interitemSpacing)
                let cellWidth = availableWidth / numberOfColumns.cgFloat
                let cellHeight = delegate.heightForItem(at: indexPath, itemWidth: cellWidth)
                let cellSize = CGSize(width: cellWidth, height: cellHeight)
                let x = inset.left + column.cgFloat * (cellWidth + interitemSpacing)
                let y = sectionOffsets[column]
                let origin = CGPoint(x: x, y: y)
                let frame = CGRect(origin: origin, size: cellSize)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache[indexPath] = attributes
                sectionOffsets[column] = frame.maxY
                offset = sectionOffsets.max()!
                sectionOffsets[column] += lineSpacing
                column = sectionOffsets.index(of: sectionOffsets.min()!)!
            }
            offset += inset.bottom
            contentHeight = max(offset, contentHeight)
        }
        self.cache = cache
    }
    
    override public var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache.values.filter { rect.intersects($0.frame) }
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath]
    }
    
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView?.contentOffset ?? CGPoint.zero
    }
}


extension Int {
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
}

