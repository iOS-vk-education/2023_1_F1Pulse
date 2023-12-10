//
//  RaceCollectionViewCell.swift
//  F1_pulse
//
//  Created by Dmitrii Tenshov on 28.11.2023.
//

import UIKit

final class RaceCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: RaceCollectionViewCell.self)
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 21, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private func setupCellAppearance() {
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.3
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellAppearance()
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.attributedText = nil
    }

    public func configure(with title: String, isSelected: Bool = false) {
        titleLabel.text = title
        backgroundColor = isSelected ? .lightText : .white
    }
}
