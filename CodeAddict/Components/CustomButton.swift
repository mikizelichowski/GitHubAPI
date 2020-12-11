//
//  CustomButton.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

enum ButtonStyle {
    case viewOnline
    case shareButton
}

final class CustomButton: UIButton {
    private enum Constants {
        static let cornerRadius: CGFloat = 17.0
        static let magicNumberSeventeen: CGFloat = 17.0
        static let magicNumberFifteen: CGFloat = 15.0
        static let shareIcon = "shareIcon"
        static let width: CGFloat = 130.0
        static let height: CGFloat = 30.0
    }
    
    init(style: ButtonStyle, title: String? = nil) {
        super.init(frame: .zero)
        styles(style, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styles(_ style: ButtonStyle, title: String? = nil) {
        switch style {
        case .viewOnline:
            layer.cornerRadius = Constants.cornerRadius
            backgroundColor = .buttonLigth
            setTitle(title, for: .normal)
            setTitleColor(.blueColor, for: .normal)
            UIFont.systemFont(ofSize: Constants.magicNumberFifteen, weight: .semibold)
            setDimensions(height: Constants.height, width: Constants.width)
            contentEdgeInsets = UIEdgeInsets(top: CGFloat(StringRepresentationOfDigit.five),
                                             left: CGFloat(StringRepresentationOfDigit.five),
                                             bottom: CGFloat(StringRepresentationOfDigit.five),
                                             right: CGFloat(StringRepresentationOfDigit.five))
        case .shareButton:
            backgroundColor = .buttonLigth
            layer.cornerRadius = CGFloat(StringRepresentationOfDigit.ten)
            setTitleColor(.blueColor, for: .normal)
            setTitle(title, for: .normal)
            setImage(UIImage(named: Constants.shareIcon), for: .normal)
            tintColor = .blueLight
            UIFont.systemFont(ofSize: Constants.magicNumberSeventeen, weight: .semibold)
        }
    }
}
