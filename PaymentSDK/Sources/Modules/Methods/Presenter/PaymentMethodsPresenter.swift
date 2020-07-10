//
//  PaymentMethodsPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

class PaymentMethodsPresenter: PaymentMethodsPresenterProtocol {
    
    weak var view: PaymentMethodsViewProtocol?
    var router: PaymentMethodsRouterProtocol?
    let request: PaymentRequest
    
    lazy var gateway = PaymentGateway.shared
    
    init(view: PaymentMethodsViewProtocol, router: PaymentMethodsRouterProtocol?, request: PaymentRequest) {
        self.view = view
        self.router = router
        self.request = request
    }
    
    func didSelectPaymentMethod(method: PaymentMethod) {
        view?.showLoading()
        do {
            try gateway.pay(method: method, request: request, completion: { [weak self] result in
                self?.view?.hideLoading()
                guard let self = self else { return }
                switch result {
                case .success(let transaction):
                    switch method {
                    case .card:
                        self.router?.goToCTTPayment(transaction: transaction, request: self.request)
                    case .cash:
                        self.router?.goToCashPayment(transaction: transaction, request: self.request)
                    case .qr:
                        self.router?.goToQRPayment(transaction: transaction, request: self.request)
                    case .spos:
                        self.router?.goToSposPayment(transaction: transaction, request: self.request)
                    }
                case .failure:
                    print("PAYMENT-- FAIL CMNR")
                }
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func viewDidLoad() {
        view?.showAmount(request.amount)
    }
    
}
