//
//  RaceTableViewCell.swift
//  F1_pulse
//
//  Created by Dmitrii Tenshov on 28.11.2023.
//

import UIKit

class RaceTableViewCell: UITableViewCell {
    static let identifier = String(describing: RaceTableViewCell.self)
    
    let positionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let driverLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let pointsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(positionLabel)
        contentView.addSubview(driverLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(pointsLabel)
        
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        driverLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            positionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            positionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            positionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            positionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            driverLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            driverLabel.leadingAnchor.constraint(equalTo: positionLabel.trailingAnchor),
            driverLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            driverLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: driverLabel.trailingAnchor),
            timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            pointsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            pointsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        positionLabel.attributedText = nil
        driverLabel.attributedText = nil
        timeLabel.attributedText = nil
        pointsLabel.attributedText = nil
    }
    
    public func configure(with position: String, with driver: String, with time: String, with points: String) {
        positionLabel.text = position
        driverLabel.text = driver
        timeLabel.text = time
        pointsLabel.text = points
    }
    
}

