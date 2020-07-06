//
//  SposProtocols.swift
//  Pods
//
//  Created by Tung Nguyen on 7/5/20.
//

import Foundation

protocol SposRouterProtocol: class {
    
}

protocol SposViewProtocol: class {
    var presenter: SposPresenterProtocol? { get }
}

protocol SposPresenterProtocol: class {
    
}
