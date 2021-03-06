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
    
    static let reuseIdentifier: String = "WineCellView"
    private let kMargin: CGFloat = 8
    private let kImageWidthMultiplier: CGFloat = 0.3
    
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
        view.contentMode = .scaleAspectFit
        
        view.applyRoundedCorner()
        view.applyShadow()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
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
        view.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: .systemFont(ofSize: UIFont.buttonFontSize*2, weight: .bold))
        view.adjustsFontForContentSizeCategory = true
        view.textColor = Constants.Colors.averageRate
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
                                  placeholder: UIImage(named: Constants.Images.winePlaceholder))
        
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
        wineImageView.topAnchor.constraint(equalTo: topAnchor, constant: kMargin).isActive = true
        wineImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -kMargin).isActive = true
        wineImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin/2).isActive = true
        wineImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: kImageWidthMultiplier).isActive = true
        wineImageView.heightAnchor.constraint(equalTo: wineImageView.widthAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: kMargin).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: kMargin*2).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin/2).isActive = true
        
        averageRatingSectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: kMargin/2).isActive = true
        averageRatingSectionLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: kMargin*2).isActive = true
        averageRatingSectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin/2).isActive = true
        
        averageRatingLabel.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: kMargin/2).isActive = true
        averageRatingLabel.leadingAnchor.constraint(equalTo: wineImageView.trailingAnchor, constant: kMargin*2).isActive = true
        averageRatingLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        
        starsStackView.topAnchor.constraint(equalTo: averageRatingSectionLabel.bottomAnchor, constant: kMargin/2).isActive = true
        starsStackView.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: kMargin).isActive = true
        starsStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -kMargin).isActive = true
        
        ratingCountLabel.topAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        ratingCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -kMargin*2).isActive = true
        ratingCountLabel.leadingAnchor.constraint(equalTo: averageRatingLabel.trailingAnchor, constant: kMargin).isActive = true
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
