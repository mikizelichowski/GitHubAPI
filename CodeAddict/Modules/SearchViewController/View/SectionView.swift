//
//  SectionView.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit

final class SectionView: UIView {
    private enum Constants {
        static let fontNumber: CGFloat = 22.0
        static let title = "Repositories"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.title
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: Constants.fontNumber)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.centerY(inView: self,
                           leftAnchor: leftAnchor,
                           paddingLeft: CGFloat(StringRepresentationOfDigit.twelve))
    }
}
