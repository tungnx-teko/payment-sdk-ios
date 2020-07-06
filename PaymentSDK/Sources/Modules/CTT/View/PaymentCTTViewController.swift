//
//  PaymentCTTViewController.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import UIKit

class PaymentCTTViewController: UIViewController, PaymentCTTViewProtocol {
    
    let searchField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.groupTableViewBackground
        return textField
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 20, height: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let searchContainerView: UIView = {
        let searchContainerView = UIView()
        searchContainerView.translatesAutoresizingMaskIntoConstraints = false
        return searchContainerView
    }()
    
    var presenter: PaymentCTTPresenterProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = PaymentSDK.Theme.paymentCTTMethod
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }
    
}

// MARK: - Add subviews
extension PaymentCTTViewController {
    
    private func addSubviews() {
        addSearchContainerView()
        addSearchField()
        addCollectionView()
    }
    
    private func addSearchContainerView() {
        view.addSubview(searchContainerView)
        
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchContainerView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func addSearchField() {
        searchContainerView.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            searchField.centerYAnchor.constraint(equalTo: searchContainerView.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
