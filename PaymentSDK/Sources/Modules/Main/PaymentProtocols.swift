//
//  PaymentProtocols.swift
//  Alamofire
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

protocol PaymentPresenterProtocol: class {
    var request: BasePaymentRequest { get }
}

protocol PaymentViewProtocol: class {
    var presenter: PaymentPresenterProtocol? { get }
}

protocol PaymentRouterProtocol: class {
    
}
