//
//  ViewController.swift
//  AppleMusicLikeApp
//
//  Created by Joker Hook on 2019/2/17.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var button: UIButton!
    
    var tableView: UITableView!
    var downButton: UIButton!
    
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PictureStoryboard")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initDownButton()
        initButton()
        initLunchView()
    }
    
    func initTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 80))
        tableView.center = view.center
        view.addSubview(tableView)
    }
    
    func initButton() {
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchDown)
        view.addSubview(button)
    }
    
    func initLunchView() {
        /**
         *先初始化我们要的界面
         *将它添加到视图的最底下
         */
        let lunchView = vc.view
        lunchView?.frame = CGRect(x: 0, y: 2 * view.frame.height - 100 , width: view.frame.width, height: view.frame.height - 100)
        lunchView?.layer.cornerRadius = 10.0
        lunchView?.layer.masksToBounds = true
        view.addSubview(lunchView!)
    }
    
    /**
     *展示子视图
     */
    func playAnimation() {
        
        let lunchView = vc.view
        UIView.animate(withDuration: 0.5) {
            self.adjustTableView()
            self.downButton.alpha = 1
            lunchView?.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 80)
            self.tableView.frame = CGRect(x: 10, y: 32, width: self.view.frame.width - 20, height: self.view.frame.height - 32)
            
            /**
             *隐藏tab bar
             *'automaticallyAdjustsScrollViewInsets' was deprecated in iOS 11.0:
             *Use UIScrollView's contentInsetAdjustmentBehavior instead
             */
            self.tabBarController?.tabBar.alpha = 0
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    public func getToOriginalView() {
        let lunchView = vc.view
        UIView.animate(withDuration: 0.5) {
            self.viewGetBack()
            lunchView?.frame = CGRect(x: 0, y: 2 * self.view.frame.height - 100 , width: self.view.frame.width, height: self.view.frame.height - 100)
            self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.downButton.alpha = 0
            // 显示tab bar
            self.tabBarController?.tabBar.alpha = 1
        }
    }
    
    /**
     *缩放父视图
     */
    func adjustTableView() {
        self.view.backgroundColor = .darkGray
        self.tableView.backgroundColor = UIColor.lightText
        self.tableView.layer.cornerRadius = 10.0
        self.tableView.layer.masksToBounds = true
    }
    
    func viewGetBack() {
        self.view.backgroundColor = .white
        self.tableView.backgroundColor = .white
        self.tableView.layer.cornerRadius = 0
        self.tableView.layer.masksToBounds = true
    }
    
    
    
    @objc func buttonTapped(sender: UIButton) {
        playAnimation()
    }
    
    func initDownButton() {
        downButton = UIButton(frame: CGRect(x: (self.view.frame.width - 30) / 2, y: 60, width: 30, height: 20))
        downButton.setImage(UIImage(named: "3"), for: .normal)
        downButton.addTarget(self, action: #selector(downButtonTapped(sender:)), for: .touchDown)
        downButton.alpha = 0
        view.addSubview(downButton)
    }
    
    @objc func downButtonTapped(sender: UIButton) {
        getToOriginalView()
    }
}

