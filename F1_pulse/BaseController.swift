//
//  BaseController.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 21/11/2023.
//

import UIKit

class BaseController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
}

@objc extension BaseController{
    func addViews() {}
    func layuotViews() {}
    
    func configure(){
        view.backgroundColor = Resourses.Colors.background
    }
}

