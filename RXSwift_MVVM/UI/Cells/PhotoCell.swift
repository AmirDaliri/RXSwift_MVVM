//
//  PhotoCell.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UITableViewCell {
    
    // MARK: UI
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let contentStackView = UIStackView()
    
    // MARK: Functions
    override func layoutSubviews() {
        super.layoutSubviews()
        guard contentView.subviews.isEmpty else {
            return
        }
        configureThumbnail()
        configureLabel()
        layoutUI()
    }
    
    private func layoutUI() {
        contentView.addSubview(contentStackView)
        [titleLabel, thumbnailImageView].forEach {
            contentStackView.addArrangedSubview($0)
        }
        contentStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
        }
        contentStackView.axis = .horizontal
    }
    
    private func configureLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
    }
    
    private func configureThumbnail() {
        thumbnailImageView.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        thumbnailImageView.contentMode = .scaleAspectFill
    }
    
    func fillWith(_ viewModel: PhotoCellViewModelType) {
        titleLabel.text = viewModel.title
        thumbnailImageView.sd_setImage(with: viewModel.thumbnailUrl) { (_, _, _, _) in
            self.layoutIfNeeded()
        }
        self.layoutIfNeeded()
    }
}
