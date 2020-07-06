//
//  PaymentQRRouter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import UIKit
import PaymentGateway

class PaymentQRRouter: PaymentQRRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(transaction: Transaction) -> UIViewController {
        let view = PaymentQRViewController()
        let router = PaymentQRRouter()
        let presenter = PaymentQRPresenter(view: view, router: router, transaction: transaction)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToResult(_ result: PaymentResult) {
        let delegate = viewController?.navigationController?.parent as? PaymentViewController
        let resultModule = ResultRouter.createModule(result: result, delegate: delegate)
        viewController?.navigationController?.show(resultModule, sender: nil)
    }
    
    func dismiss() {
        viewController?.parent?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
}
