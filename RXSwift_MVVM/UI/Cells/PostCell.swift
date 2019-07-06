//
//  PostCell.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let labelsStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard contentView.subviews.isEmpty else {
            return
        }
        setupLabels()
        layoutUI()
    }
    
    private func layoutUI() {
        [titleLabel, bodyLabel].forEach {
            labelsStackView.addArrangedSubview($0)
        }
        contentView.addSubview(labelsStackView)
        labelsStackView.spacing = 8
        labelsStackView.alignment = .fill
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillProportionally
        labelsStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    private func setupLabels() {
        [titleLabel, bodyLabel].forEach {
            $0.numberOfLines = 0
        }
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        bodyLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    func configureWith(_ viewModel: PostCellViewModelType) {
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
        layoutIfNeeded()
    }
}
