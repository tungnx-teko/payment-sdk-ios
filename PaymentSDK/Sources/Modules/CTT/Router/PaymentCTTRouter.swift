//
//  PaymentCTTRouter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/3/20.
//

import UIKit
import PaymentGateway

class PaymentCTTRouter: PaymentCTTRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(transaction: Transaction) -> UIViewController {
        let view = PaymentCTTViewController()
        let router = PaymentCTTRouter()
        let presenter = PaymentCTTPresenter(view: view, router: router, transaction: transaction)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func dismiss() {
        viewController?.parent?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
}
