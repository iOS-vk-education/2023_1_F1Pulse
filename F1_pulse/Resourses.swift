//
//  Resourses.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 21/11/2023.
//

import UIKit



enum Resourses{
    
    enum Colors{
        static var active = UIColor(hexString: "#FE1F01")
        static var inactive = UIColor(hexString: "#7D839C")
        
        static var darkGray = UIColor(hexString: "#7D839C")
        static var separator = UIColor(hexString: "#E8ECEF")
        
        static var background = UIColor(hexString: "#E8ECEF")
        
    }
    
    enum Strings{
        enum TabBar{
            static var news = "News"
            static var history = "History"
            static var ranks = "Ranks"
            static var races = "Races"
        }
    }
    
    
    

    
    enum Images{
        static var news = UIImage(systemName: "newspaper")
        static var history = UIImage(systemName: "book.pages")
        static var ranks = UIImage(systemName: "person.2")
        static var races = UIImage(systemName: "road.lanes.curved.right")
    }
    
    
    
    enum Fonts{
        static func helveticaRegular(with size: CGFloat) -> UIFont{
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

