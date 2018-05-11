//
//  ProductCell.swift
//  ModalAnimation
//
//  Created by Jason Fan on 2018/5/11.
//  Copyright © 2018 zyFan. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    static let className: String = "ProductCell"
    var productImageView: UIImageView!
    let screenW: CGFloat = UIScreen.main.bounds.size.width
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        productImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenW - 40, height: 90))
        productImageView.image = UIImage(named: "shoes")
        productImageView.contentMode = .scaleAspectFit
        addSubview(productImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            var newRect = frame
            newRect.origin.y += 10
            newRect.size.height -= 10
            newRect.origin.x += 20
            newRect.size.width -= 40
            super.frame = newRect
        }
    }

}
