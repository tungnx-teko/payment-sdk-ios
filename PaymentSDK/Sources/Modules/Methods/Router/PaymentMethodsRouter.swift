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
    
    static func createModule(request: PaymentRequest) -> UIViewController {
        let view = PaymentMethodsViewController()
        let router = PaymentMethodsRouter()
        let presenter = PaymentMethodsPresenter(view: view, router: router, request: request)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToQRPayment(transaction: Transaction, request: PaymentRequest) {
        let paymentQR = PaymentQRRouter.createModule(transaction: transaction, request: request)
        viewController?.navigationController?.show(paymentQR, sender: nil)
    }
    
    func goToCTTPayment(transaction: Transaction, request: PaymentRequest) {
        let paymentCTT = PaymentCTTRouter.createModule(transaction: transaction, request: request)
        viewController?.navigationController?.show(paymentCTT, sender: nil)
    }
    
    func goToSposPayment(transaction: Transaction, request: PaymentRequest) {
        let paymentSpos = SposRouter.createModule(transaction: transaction, request: request)
        viewController?.navigationController?.show(paymentSpos, sender: nil)
    }
    
    func goToCashPayment(transaction: Transaction, request: PaymentRequest) {
        let paymentCash = PaymentCTTRouter.createModule(transaction: transaction, request: request)
        viewController?.navigationController?.show(paymentCash, sender: nil)
    }
    
}
