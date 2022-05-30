//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by Владислав Гайденко on 29.05.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePostersUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePostersUIImageView)
        contentView.addSubview(titleLabel)
        applyConstraint()
    }
    
    private func applyConstraint() {
        let titlePostersUIImageViewConstraints = [
            titlePostersUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePostersUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlePostersUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePostersUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePostersUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor.self),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 5)
        ]
        
        NSLayoutConstraint.activate(titlePostersUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: model.posterURL) else { return }
        titlePostersUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
