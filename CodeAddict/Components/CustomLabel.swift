//
//  CustomLabel.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

enum StyleLabel: CaseIterable {
    case title
    case subtitle
    case ratingNumber
    case author
    case raitingProfile
    case email
    case commitTitle
    case description
}

final class CustomLabel: UILabel {
    private enum Constants {
        static let magicNumberSeventeen: CGFloat = 17.0
        static let magicNumberthirteen: CGFloat = 13.0
        static let magicNumberelevent: CGFloat = 11.0
        static let magicNumbertwentyEight: CGFloat = 28.0
    }
    
    init(style: StyleLabel, title: String? = nil) {
        super.init(frame: .zero)
        styles(style, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styles(_ style: StyleLabel, title: String? = nil) {
        switch style {
        case .title:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberSeventeen, weight: .semibold)
            textColor = .black
            textAlignment = .left
            numberOfLines = .zero
        case .subtitle:
            text = title
            font = UIFont.systemFont(ofSize: CGFloat(StringRepresentationOfDigit.fifteen), weight: .semibold)
            textColor = .black
            textAlignment = .left
            numberOfLines = .zero
        case .ratingNumber:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberSeventeen, weight: .regular)
            textColor = .lightGray
            textAlignment = .left
            numberOfLines = .zero
        case .author:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumbertwentyEight, weight: .bold)
            textColor = .black
            textAlignment = .left
            numberOfLines = .zero
        case .raitingProfile:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberthirteen, weight: .regular)
            textColor = .black
            textAlignment = .left
            numberOfLines = .zero
        case .email:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberSeventeen, weight: .semibold)
            textColor = .black
            textAlignment = .left
            numberOfLines = .zero
        case .commitTitle:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberelevent, weight: .regular)
            textColor = .blueColor
            textAlignment = .left
            numberOfLines = .zero
        case .description:
            text = title
            font = UIFont.systemFont(ofSize: Constants.magicNumberSeventeen, weight: .regular)
            textColor = .lightGray
            textAlignment = .left
            numberOfLines = .zero
        }
    }
}
