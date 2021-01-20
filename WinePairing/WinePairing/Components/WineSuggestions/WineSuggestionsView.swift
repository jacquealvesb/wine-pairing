//
//  WineSuggestionsView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineSuggestionsView: UIView {
    
    // MARK: - Variables
    
    private(set) var viewModel: WineSuggestionsViewModel? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Viewa
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.allowsSelection = false
        view.separatorStyle = .none
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WineCellView.self,
                           forCellReuseIdentifier: WineCellView.reuseIdentifier)
    }
    
    func setup(with viewModel: WineSuggestionsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Table View
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
            self.swipeHintAnimation()
        }
    }
    
    func shareItem(at indexPath: IndexPath) {
        viewModel?.shareWine(at: indexPath)
    }
}

// MARK: - View Code

extension WineSuggestionsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
