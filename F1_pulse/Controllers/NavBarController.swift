//
//  NavBarController.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 21/11/2023.
//

import UIKit

final class NavBarController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    private func configure(){
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resourses.Colors.darkGray,
            .font: Resourses.Fonts.helveticaRegular(with: 27),
            
        ]
        

    }
}
