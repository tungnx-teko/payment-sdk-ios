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
    let request: PaymentRequest
    lazy var observer: PaymentObserver = .init()
    
    init(view: SposViewProtocol, router: SposRouterProtocol?, transaction: Transaction, request: PaymentRequest) {
        self.view = view
        self.router = router
        self.transaction = transaction
        self.request = request
    }
    
    func viewDidLoad() {
        view?.showAmount(request.amount)
        view?.showTransactionCode(transaction.code)
        observeTransaction(transactionCode: transaction.code) { [weak self] result in
            self?.router?.goToResult(result)
        }
    }
    
}
