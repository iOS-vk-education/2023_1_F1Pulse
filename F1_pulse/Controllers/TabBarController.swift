//
//  TabBarController.swift
//  F1_pulse
//
//  Created by Egor Diachkov on 21/11/2023.
//

import UIKit

enum Tabs: Int{
    case news
    case races
    case ranks
    case history
}

final class TabBarController: UITabBarController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        tabBar.tintColor = Resourses.Colors.active
//        tabBar.barTintColor = Resourses.Colors.inactive
//        tabBar.backgroundColor = .systemBackground
        tabBar.layer.borderColor = Resourses.Colors.separator.cgColor
        
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        
        let newsControler = NewsController()
        let racesControler = RacesController()
        let ranksControler = RanksController()
        let historyControler = HistoryController()
        
        let newsNavigation = NavBarController(rootViewController: newsControler)
        let racesNavigation = NavBarController(rootViewController: racesControler)
        let ranksNavigation = NavBarController(rootViewController: ranksControler)
        let historyNavigation = NavBarController(rootViewController: historyControler)
        
        newsControler.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.news, image: Resourses.Images.news, tag: Tabs.news.rawValue)
        
        racesControler.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.races, image: Resourses.Images.races, tag: Tabs.races.rawValue)
        
        ranksControler.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.ranks, image: Resourses.Images.ranks, tag: Tabs.ranks.rawValue)
        
        historyControler.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.history, image: Resourses.Images.history, tag: Tabs.history.rawValue)
        
        
        
        setViewControllers([
            newsNavigation,
            racesNavigation,
            ranksNavigation,
            historyNavigation
                           ],
                           animated: false)
    }
}
