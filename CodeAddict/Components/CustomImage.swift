//
//  CustomImage.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

enum ImageStyle: CaseIterable {
    case cell
    case star
    case profile
    case wall
}

final class CustomImage: UIImageView {
    private enum Constans {
        static let starHeighWidth: CGFloat = 14.0
    }
    
    init(style: ImageStyle, image: UIImage? = nil) {
        super.init(frame: .zero)
        styles(style, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styles(_ style: ImageStyle, image: UIImage? = nil) {
        switch style {
        case .cell:
            self.image = image
            contentMode = .scaleAspectFill
            clipsToBounds = true
            backgroundColor = .lightGray
            layer.cornerRadius = CGFloat(StringRepresentationOfDigit.ten)
            setDimensions(height: CGFloat(StringRepresentationOfDigit.hour),
                          width: CGFloat(StringRepresentationOfDigit.hour))
        case .star:
            self.image = UIImage(systemName: "star")
            contentMode = .scaleAspectFill
            clipsToBounds = true
            tintColor = .lightGray
            setDimensions(height: Constans.starHeighWidth,
                          width: Constans.starHeighWidth)
        case .profile:
            self.image = image
            contentMode = .scaleAspectFill
            clipsToBounds = true
            backgroundColor = .lightGray
        case .wall:
            self.image = image
            contentMode = .scaleAspectFill
            clipsToBounds = true
            backgroundColor = .lightGray
        }
    }
}
