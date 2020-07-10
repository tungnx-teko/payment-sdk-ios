//
//  PaymentViewController.swift
//  Pods
//
//  Created by Tung Nguyen on 6/29/20.
//

import UIKit
import PaymentGateway

public class PaymentViewController: UIViewController, PaymentViewProtocol {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = PaymentSDK.Theme.primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(PaymentSDK.Theme.backButtonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = .zero
        button.addTarget(self, action: #selector(backButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle(PaymentSDK.Strings.cancelButtonTitle, for: .normal)
        button.titleLabel?.textAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelWasTapped), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = PaymentSDK.Strings.paymentMethodsTitle
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var childNav: PaymentNavigationController!
    
    var presenter: PaymentPresenterProtocol?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        setupStatusBar()
        addSubviews()
        addChildNavigation()
        reloadBackButton()
    }
    
    func setupStatusBar() {
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = PaymentSDK.Theme.primaryColor
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    @objc
    func cancelWasTapped() {
        presenter?.handleCancel()
    }
    
    @objc
    func backButtonWasTapped() {
        if childNav?.canGoBack ?? false {
            _ = childNav?.popViewController(animated: true)
        }
    }
    
    func reloadBackButton() {
        backButton.isHidden = !childNav.canGoBack
    }
    
    func addChildNavigation() {
        guard let request = presenter?.request else { return }
        let methodsVC = PaymentMethodsRouter.createModule(request: request)
        let nav = PaymentNavigationController(rootViewController: methodsVC)
        nav.navDelegate = self
        addChild(nav)
        nav.view.frame = containerView.bounds
        containerView.addSubview(nav.view)
        self.childNav = nav
    }
    
    func addSubviews() {
        addNavigationView()
        addContainerView()
    }
    
    private func addNavigationView() {
        view.addSubview(navigationView)
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                navigationView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0)
            ])
        } else {
            NSLayoutConstraint.activate([
                navigationView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)
            ])
        }
        NSLayoutConstraint.activate([
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: PaymentSDK.Theme.navigationViewHeight)
        ])
        
        addBackButton()
        addCancelButton()
        addTitleLabel()
    }
    
    private func addContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func addBackButton() {
        navigationView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor)
        ])
    }
    
    func addCancelButton() {
        navigationView.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            cancelButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -16),
            cancelButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addTitleLabel() {
        navigationView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
        ])
    }
    
}

extension PaymentViewController: PaymentNavigationDelegate {
    
    func didShowViewController(_ vc: UIViewController) {
        titleLabel.text = vc.title
        reloadBackButton()
    }
    
    func didPop() {
        if childNav?.canGoBack ?? false {
            titleLabel.text = childNav?.viewControllers.last?.title
        } else {
            titleLabel.text = PaymentSDK.Strings.paymentMethodsTitle
        }
        reloadBackButton()
    }
    
}

extension PaymentViewController: PaymentMethodDelegate {
    
    func onResult(_ result: PaymentResult) {
        presenter?.onResult(result)
    }
    
}
