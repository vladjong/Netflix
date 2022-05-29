//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by Владислав Гайденко on 29.05.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let playTitlesButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePostersUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePostersUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitlesButton)
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
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor.self)
        ]
        
        let playTitlesButtonConstraints = [
            playTitlesButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            playTitlesButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePostersUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitlesButtonConstraints)
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
