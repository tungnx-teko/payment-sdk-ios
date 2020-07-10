//
//  PaymentMethodsProtocols.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

protocol PaymentMethodDelegate: class {
    func onResult(_ result: PaymentResult)
}

protocol PaymentMethodsViewProtocol: class {
    var presenter: PaymentMethodsPresenterProtocol? { get }
    func showAmount(_ amount: Double)
    func showLoading()
    func hideLoading()
}

protocol PaymentMethodsPresenterProtocol: class {
    func viewDidLoad()
    func didSelectPaymentMethod(method: PaymentMethod)
}

protocol PaymentMethodsRouterProtocol: class {
    func goToQRPayment(transaction: Transaction, request: PaymentRequest)
    func goToCTTPayment(transaction: Transaction, request: PaymentRequest)
    func goToSposPayment(transaction: Transaction, request: PaymentRequest)
    func goToCashPayment(transaction: Transaction, request: PaymentRequest)
}
