//
//  HistoryCollectionViewCell.swift
//  F1_pulse
//
//  Created by Dmitrii Tenshov on 28.11.2023.
//

import UIKit

final class HistoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: HistoryCollectionViewCell.self)
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 21)
        label.textAlignment = .left
        return label
    }()
    
    private func setupCellAppearance() {
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
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

    public func configure(with title: String) {
        titleLabel.text = title
    }
}
