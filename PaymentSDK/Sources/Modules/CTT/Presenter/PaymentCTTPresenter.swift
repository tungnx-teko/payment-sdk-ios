//
//  PaymentCTTPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

class PaymentCTTPresenter: PaymentCTTPresenterProtocol, PaymentMethodPresenterProtocol {
    
    weak var view: PaymentCTTViewProtocol?
    var router: PaymentCTTRouterProtocol?
    let method: PaymentMethod = .card
    let transaction: Transaction
    let observer: PaymentObserver
    
    init(view: PaymentCTTViewProtocol, router: PaymentCTTRouterProtocol?, transaction: Transaction) {
        self.view = view
        self.router = router
        self.transaction = transaction
        self.observer = PaymentObserver()
    }
    
    func observeTransaction(transactionCode: String) {
        
    }
    
}
