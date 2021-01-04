//
//  WineCell.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCellView: UITableViewCell {
    // MARK: - Constants
    
    static let reuseIdentifier = "WineCellView"
    
    // MARK: - Variables
    
    var viewModel: WineCellViewModel? {
        didSet {
            setup()
        }
    }
    
    // MARK: - Views
    
    lazy var wineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.numberOfLines = 0
        return view
    }()
    
    lazy var averageRatingSectionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption1)
        view.textColor = .secondaryLabel
        view.text = "Average rating"
        return view
    }()
    
    lazy var averageRatingLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .largeTitle)
        view.textColor = Colors.wineCategory
        return view
    }()
    
    lazy var starsStackView: StarsView = {
        let view = StarsView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .leading
        return view
    }()
    
    lazy var ratingCountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption2)
        view.textColor = .secondaryLabel
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupAccessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setup(with viewModel: WineCellViewModel) {
        self.viewModel = viewModel
    }
    
    private func setup() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        averageRatingLabel.text = viewModel.averageRating
        starsStackView.setup(with: viewModel.stars)
        ratingCountLabel.text = viewModel.ratingCount
    }
    
    private func setupAccessibility() {
        accessibilityElements = [titleLabel, starsStackView, ratingCountLabel]
    }
}

// MARK: - View Code

extension WineCellView: ViewCode {
    func buildViewHierarchy() {
        addSubview(wineImageView)
        addSubview(titleLabel)
        addSubview(averageRatingSectionLabel)
        addSubview(averageRatingLabel)
        addSubview(starsStackView)
        addSubview(ratingCountLabel)
    }
    
    func setupConstraints() {
        wineImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        wineImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        wineImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        wineImageView.widthAnchor.constraint(equalTo: wineImageView.heightAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: wineImageView.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        averageRatingSectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        averageRatingSectionLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        averageRatingSectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        averageRatingLabel.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: 4).isActive = true
        averageRatingLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        averageRatingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        
        starsStackView.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: 4).isActive = true
        starsStackView.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: 8).isActive = true
        
        ratingCountLabel.topAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        ratingCountLabel.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: 8).isActive = true
    }
}
