//
//  PaymentPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

public protocol PaymentDelegate: class {
    func didSuccess(transaction: PaymentTransactionResult)
    func didFailure(error: PaymentError)
    func didCancel()
}

class PaymentPresenter: PaymentPresenterProtocol {
    
    lazy var gateway = PaymentGateway.shared
    
    weak var view: PaymentViewProtocol?
    var router: PaymentRouterProtocol?
    weak var delegate: PaymentDelegate?
    let request: BasePaymentRequest
    
    init(view: PaymentViewProtocol, router: PaymentRouterProtocol?, request: BasePaymentRequest, delegate: PaymentDelegate?) {
        self.view = view
        self.router = router
        self.delegate = delegate
        self.request = request
    }
    
}
