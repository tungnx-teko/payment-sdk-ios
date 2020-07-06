//
//  SposPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/5/20.
//

import PaymentGateway

class SposPresenter: SposPresenterProtocol, PaymentMethodPresenterProtocol {
    
    weak var view: SposViewProtocol?
    var router: SposRouterProtocol?
    let method: PaymentMethod = .spos
    let transaction: Transaction
    lazy var observer: PaymentObserver = .init()
    
    init(view: SposViewProtocol, router: SposRouterProtocol?, transaction: Transaction) {
        self.view = view
        self.router = router
        self.transaction = transaction
    }
    
}
