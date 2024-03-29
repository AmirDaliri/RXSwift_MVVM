//
//  PhotosController.swift
//  RXSwift_MVVM
//
//  Created by Amir Daliri on 6.07.2019.
//  Copyright © 2019 AmirDaliri. All rights reserved.
//

import UIKit
import RxSwift

final class PhotosController: UIViewController {
    
    // MARK: Init and deinit
    init(_ viewModel: PhotosControllerViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    deinit {
        print("\(self) dealloc")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    private let viewModel: PhotosControllerViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: UI
    private let tableView = UITableView()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindToViewModel()
    }
    
    // MARK: Functions
    private func bindToViewModel() {
        viewModel.viewModelsDriver
            .drive(tableView.rx.items) { tableView, row, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
                cell.fillWith(item)
                return cell
            }.disposed(by: disposeBag)
    }
    
    private func setupUI() {
        navigationItem.title = "Photos controller"
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        tableView.register(PhotoCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.allowsSelection = false
    }
    
}

