//
//  SectionView.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

final class FooterView: UIView {
    private enum Constants {
        static let title = " Share Repo"
    }
    
    private lazy var shareButton = CustomButton(style: .shareButton, title: Constants.title)
    
    var shareHandleTappedClosure: ((ActivityController, Repo) -> ())?
    var repo: Repo?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = .white
        addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.heightAnchor.constraint(equalToConstant: CGFloat(StringRepresentationOfDigit.fifty)).isActive = true
        shareButton.anchor(top: topAnchor,
                           left: leftAnchor,
                           right: rightAnchor,
                           paddingTop: CGFloat(StringRepresentationOfDigit.twentyFour),
                           paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen),
                           paddingRight: CGFloat(StringRepresentationOfDigit.sixteen))
    }
    
    private func setupLabel() {
        shareButton.addTarget(self, action: #selector(handleTapped), for: .touchUpInside)
    }
    
    @objc
    func handleTapped() {
        guard let repo = repo else { return }
        self.repo = repo
        let controller = ActivityController()
        shareHandleTappedClosure?(controller, repo)
    }
}
