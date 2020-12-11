//
//  SectionView.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

final class ProfileSectionView: UIView {
    private enum Constants {
        static let magicNumberTwentyTwo: CGFloat = 22.0
        static let titleButton = "VIEW ONLINE"
        static let repoTitle = "Repo Title"
        static let sectionTitle = "Commits History"
    }
    
    private lazy var onlineButton = CustomButton(style: .viewOnline, title: Constants.titleButton)
    private let repoLabel = CustomLabel(style: .title, title: Constants.repoTitle)
    
    var repos: Repo?
    var webRepoClosure: ((Repo) -> ())?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sectionTitle
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: Constants.magicNumberTwentyTwo)
        return label
    }()
    
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
        let stack = UIStackView(arrangedSubviews: [repoLabel, onlineButton])
        stack.axis = .horizontal
        [stack, titleLabel].forEach { addSubview($0)}
        stack.anchor(top: topAnchor,
                     left: leftAnchor,
                     right: rightAnchor,
                     paddingTop: CGFloat(StringRepresentationOfDigit.twenty),
                     paddingLeft: CGFloat(StringRepresentationOfDigit.twenty),
                     paddingRight: CGFloat(StringRepresentationOfDigit.twenty))
        titleLabel.anchor(top: stack.bottomAnchor,
                          left: leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor,
                          paddingTop: CGFloat(StringRepresentationOfDigit.twenty),
                          paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen),
                          paddingBottom: CGFloat(StringRepresentationOfDigit.ten),
                          paddingRight: CGFloat(StringRepresentationOfDigit.four))
    }
    
    func setupLabel() {
        onlineButton.addTarget(self, action: #selector(handleTapped), for: .touchUpInside)
    }
    
    @objc
    func handleTapped() {
        guard let repo = repos else { return }
        webRepoClosure?(repo)
    }
    
    func update(repo: Repo) {
        self.repos = repo
        repoLabel.text = repo.name
    }
}
