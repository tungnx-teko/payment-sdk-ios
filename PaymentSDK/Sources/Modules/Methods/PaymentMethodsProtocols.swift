//
//  PaymentMethodsProtocols.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

protocol PaymentMethodDelegate: class {
    func didSuccess(_ transaction: PaymentTransactionResult)
    func didFailure(_ error: PaymentError)
}

protocol PaymentMethodsViewProtocol: class {
    var presenter: PaymentMethodsPresenterProtocol? { get }
    
    func showLoading()
    func hideLoading()
}

protocol PaymentMethodsPresenterProtocol: class {
    func didSelectPaymentMethod(method: PaymentMethod)
}

protocol PaymentMethodsRouterProtocol: class {
    func goToQRPayment(transaction: Transaction)
    func goToCTTPayment(transaction: Transaction)
    func goToSposPayment(transaction: Transaction)
    func goToCashPayment(transaction: Transaction)
}
