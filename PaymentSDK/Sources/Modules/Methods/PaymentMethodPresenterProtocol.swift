//
//  PaymentMethodPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/4/20.
//

import PaymentGateway

protocol PaymentMethodPresenterProtocol: class {
    var method: PaymentMethod { get }
    var transaction: Transaction { get }
    var observer: PaymentObserver { get }
    
    func observeTransaction(transactionCode: String, completion: @escaping (PaymentResult) -> ())
}

extension PaymentMethodPresenterProtocol {
    
    func observeTransaction(transactionCode: String, completion: @escaping (PaymentResult) -> ()) {
        observer.observe(transactionCode: transactionCode) { result in completion(result) }
    }
    
}
