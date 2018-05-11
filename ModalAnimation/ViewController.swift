//
//  ViewController.swift
//  ModalAnimation
//
//  Created by Jason Fan on 2018/5/11.
//  Copyright © 2018 zyFan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var productTableView: UITableView!
    var selectedFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        productTableView = UITableView(frame: self.view.bounds)
        productTableView.showsVerticalScrollIndicator = false
        productTableView.tableFooterView = UIView()
        productTableView.backgroundColor = UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorStyle = .none
        productTableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.className)
        self.view.addSubview(productTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.className) as! ProductCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        selectedFrame = tableView.convert((cell?.frame)!, to: tableView.superview)
        let detailVC = ProductDetailController()
        detailVC.transitioningDelegate = self
        self.navigationController?.present(detailVC, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = self.selectedFrame else { return nil }
        let dateDetailVC = presented as! ProductDetailController
        guard let headView = dateDetailVC.productImageView else { return nil }
        let animator = CustomAnimator(isPresenting: true, duration: TimeInterval(UINavigationControllerHideShowBarDuration), originFrame: originFrame, transView: headView)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = self.selectedFrame else { return nil }
        let dateDetailVC = dismissed as! ProductDetailController
        guard let headView = dateDetailVC.productImageView else { return nil }
        let animator = CustomAnimator(isPresenting: false, duration: TimeInterval(UINavigationControllerHideShowBarDuration), originFrame: originFrame, transView: headView)
        return animator
    }
}

