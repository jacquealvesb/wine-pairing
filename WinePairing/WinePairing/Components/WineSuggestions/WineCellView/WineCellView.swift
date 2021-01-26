//
//  WineCell.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit
import Kingfisher

final class WineCellView: UITableViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "WineCellView"
    private let kWinePlaceholderImage = "winePlaceholder"
    
    // MARK: - Variables
    
    private var viewModel: WineCellViewModel? {
        didSet {
            setup()
        }
    }
    
    // MARK: - Views
    
    lazy var wineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 0
        return view
    }()
    
    lazy var averageRatingSectionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption1)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .secondaryLabel
        view.numberOfLines = 0
        view.text = "Average rating"
        return view
    }()
    
    lazy var averageRatingLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .largeTitle)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = Colors.wineCategory
        return view
    }()
    
    lazy var starsStackView: StarsView = {
        let view = StarsView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillProportionally
        return view
    }()
    
    lazy var ratingCountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption2)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .secondaryLabel
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
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
        wineImageView.kf.setImage(with: viewModel.imageURL,
                                  placeholder: UIImage(named: kWinePlaceholderImage))
        
        setupAccessibility()
    }
    
    private func setupAccessibility() {
        accessibilityLabel = viewModel?.accessibilityLabel ?? ""
        accessibilityUserInputLabels = [viewModel?.title ?? ""]
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
        wineImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wineImageView.widthAnchor.constraint(equalTo: wineImageView.heightAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: wineImageView.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        averageRatingSectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        averageRatingSectionLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        averageRatingSectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        averageRatingLabel.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: 4).isActive = true
        averageRatingLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: 16).isActive = true
        averageRatingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        
        starsStackView.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: 4).isActive = true
        starsStackView.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: 8).isActive = true
        starsStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8).isActive = true
        
        ratingCountLabel.topAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        ratingCountLabel.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: 8).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
