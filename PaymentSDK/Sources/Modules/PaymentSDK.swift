//
//  PaymentSDK.swift
//  Pods
//
//  Created by Tung Nguyen on 7/3/20.
//

import PaymentGateway

public class PaymentSDK {
    
    public struct Config {
        public static var expireTime: Int                  = 30
    }

    public struct Theme {
        public static var primaryColor: UIColor            = UIColor(red: 235, green: 31, blue: 58)
        
        public static var backButtonImage: UIImage?        = ImagesHelper.imageFor(name: "back")
        
        public static var navigationViewHeight: CGFloat    = 56
        
        public static var closeButtonTitle: String         = "Đóng"
        public static var cancelButtonTitle: String        = "Huỷ"
        public static var paymentSuccessTitle: String      = "Thanh toán thành công"
        public static var paymentFailureTitle: String      = "Thanh toán thất bại"
        public static var transactionCodeTitle: String     = "Mã thanh toán: "
        public static var paymentMethodsTitle: String      = "Phương thức thanh toán"
        public static var paymentQRTitle: String           = "VNPayQR"
        public static var paymentQRMethod: String          = "VNPayQR"
        public static var paymentCTTMethod: String         = "Thẻ (ATM/Debit/Credit...)"
        public static var paymentSPOSMethod: String        = "SPOS"
        public static var paymentCashMethod: String        = "Tiền mặt"
        public static var totalMoneyTitle: String          = "Tổng tiền"
        public static var resultTitle: String              = "Kết quả giao dịch"
    }
    
}

public extension PaymentMethod {

    var name: String {
        switch self {
        case .card:
            return PaymentSDK.Theme.paymentCTTMethod
        case .qr:
            return PaymentSDK.Theme.paymentQRMethod
        case .cash:
            return PaymentSDK.Theme.paymentCashMethod
        case .spos:
            return PaymentSDK.Theme.paymentSPOSMethod
        }
    }
    
    var iconName: String {
        switch self {
        case .cash:
            return "cash"
        case .card:
            return "card"
        case .spos:
            return "spos"
        case .qr:
            return "qr"
        }
    }
    
}
