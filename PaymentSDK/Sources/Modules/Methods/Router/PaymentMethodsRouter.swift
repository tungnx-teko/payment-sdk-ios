//
//  PaymentMethodsRouter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

class PaymentMethodsRouter: PaymentMethodsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(request: BasePaymentRequest) -> UIViewController {
        let view = PaymentMethodsViewController()
        let router = PaymentMethodsRouter()
        let presenter = PaymentMethodsPresenter(view: view, router: router, request: request)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToQRPayment(transaction: Transaction) {
        let paymentQR = PaymentQRRouter.createModule(transaction: transaction)
        viewController?.navigationController?.show(paymentQR, sender: nil)
    }
    
    func goToCTTPayment(transaction: Transaction) {
        let paymentCTT = PaymentCTTRouter.createModule(transaction: transaction)
        viewController?.navigationController?.show(paymentCTT, sender: nil)
    }
    
    func goToSposPayment(transaction: Transaction) {
        let paymentSpos = PaymentQRRouter.createModule(transaction: transaction)
        viewController?.navigationController?.show(paymentSpos, sender: nil)
    }
    
    func goToCashPayment(transaction: Transaction) {
        let paymentCash = PaymentCTTRouter.createModule(transaction: transaction)
        viewController?.navigationController?.show(paymentCash, sender: nil)
    }
    
}
