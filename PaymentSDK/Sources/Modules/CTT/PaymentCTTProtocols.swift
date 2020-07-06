//
//  PaymentCTTProtocols.swift
//  Pods
//
//  Created by Tung Nguyen on 7/3/20.
//

import Foundation

protocol PaymentCTTPresenterProtocol: class {
    
}

protocol PaymentCTTViewProtocol: class {
    var presenter: PaymentCTTPresenterProtocol? { get }
}

protocol PaymentCTTRouterProtocol: class {
    
}
