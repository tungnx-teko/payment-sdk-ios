//
//  ResultPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/4/20.
//

import PaymentGateway

typealias PaymentResult = Result<PaymentTransactionResult, PaymentError>

class ResultPresenter: ResultPresenterProtocol {
    
    weak var view: ResultViewProtocol?
    var router: ResultRouter?
    weak var delegate: PaymentMethodDelegate?
    let result: PaymentResult
    
    init(view: ResultViewProtocol, router: ResultRouter?, result: PaymentResult, delegate: PaymentMethodDelegate?) {
        self.view = view
        self.router = router
        self.result = result
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        view?.showResult(result)
    }
    
    func handleClose() {
        switch result {
        case .success(let transaction):
            delegate?.didSuccess(transaction)
        case .failure(let error):
            delegate?.didFailure(error)
        }
    }
    
}
