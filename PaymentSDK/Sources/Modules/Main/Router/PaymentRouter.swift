//
//  PaymentRouter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import UIKit
import PaymentGateway

public class PaymentRouter: PaymentRouterProtocol {
    
    weak var viewController: UIViewController?
    
    public static func createModule(request: BasePaymentRequest, delegate: PaymentDelegate) -> UIViewController {
        let view = PaymentViewController()
        let router = PaymentRouter()
        let presenter = PaymentPresenter(view: view, router: router, request: request, delegate: delegate)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
}
