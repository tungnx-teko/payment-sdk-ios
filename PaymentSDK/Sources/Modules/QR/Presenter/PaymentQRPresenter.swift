//
//  PaymentQRPresenter.swift
//  Pods
//
//  Created by Tung Nguyen on 7/2/20.
//

import Foundation
import PaymentGateway

class PaymentQRPresenter: PaymentQRPresenterProtocol, PaymentMethodPresenterProtocol {
    
    weak var view: PaymentQRViewProtocol?
    var router: PaymentQRRouterProtocol?
    let transaction: Transaction
    var method: PaymentMethod = .qr
    
    var observer: PaymentObserver
    
    var timer: Timer!
    var timeLeft: Int = PaymentSDK.Config.expireTime
    
    init(view: PaymentQRViewProtocol, router: PaymentQRRouterProtocol?, transaction: Transaction) {
        self.view = view
        self.router = router
        self.transaction = transaction
        self.observer = PaymentObserver()
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0), target: self, selector: #selector(onTimeFire), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func viewDidLoad() {
        observeTransaction(transactionCode: transaction.code) { [weak self] result in
            self?.router?.goToResult(result)
        }
    }
    
    @objc
    func onTimeFire() {
        timeLeft -= 1
        view?.showTime(interval: timeLeft)
        if timeLeft <= 0 {
            timer.invalidate()
            // FIXME: Change to timeout error
            self.router?.goToResult(.failure(PaymentError(code: 1)))
        }
    }
    
    
}
