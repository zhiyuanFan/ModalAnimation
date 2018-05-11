//
//  ProductDetailController.swift
//  ModalAnimation
//
//  Created by Jason Fan on 2018/5/11.
//  Copyright © 2018 zyFan. All rights reserved.
//

import UIKit
import SnapKit

class ProductDetailController: UIViewController {

    var productImageView: UIImageView!
    var productDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        productImageView = UIImageView()
        productImageView.image = UIImage(named: "shoes")
        self.view.addSubview(productImageView)
        
        productDesc = UILabel()
        productDesc.numberOfLines = 0
        productDesc.text = """
                            A shoe is an item of footwear intended to protect and comfort the human foot while the wearer is doing various activities. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with appearance originally being tied to function.
                           """
        productDesc.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(productDesc)
        
        let maskView = UIView()
        maskView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.view.addSubview(maskView)
        
        let backBtn = UIButton()
        backBtn.setTitle("返回", for: .normal)
        backBtn.setTitleColor(.white, for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnOnClick), for: .touchUpInside)
        maskView.addSubview(backBtn)
        
        maskView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(200)
        }
        
        backBtn.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        productImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(200)
        }
        
        productDesc.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(productImageView.snp.bottom).offset(10)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backBtnOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
}
