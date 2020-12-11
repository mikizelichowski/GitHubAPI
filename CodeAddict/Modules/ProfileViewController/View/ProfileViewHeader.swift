//
//  ProfileViewHeader.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

final class ProfileViewHeader: UIView {
    private enum Constants {
        static let numberTitle = " Number of Stars"
        static let iconImage = "star.fill"
    }
    
    private var profileImageView = CustomImage(style: .wall, image: #imageLiteral(resourceName: "venom-7"))
    private let repoTitle = CustomLabel(style: .subtitle)
    private let authorNameLabel = CustomLabel(style: .author)
    private let starIcon = CustomImage(style: .star, image: UIImage(systemName: Constants.iconImage))
    private let numberInt = CustomLabel(style: .raitingProfile)
    private let numberLabel = CustomLabel(style: .raitingProfile, title: Constants.numberTitle)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [starIcon, numberLabel, numberInt])
        stack.axis = .horizontal
        stack.spacing = CGFloat(StringRepresentationOfDigit.two)
        [profileImageView, repoTitle, authorNameLabel, stack].forEach{ addSubview($0)}
        profileImageView.fillSuperView()
        
        stack.anchor(left: leftAnchor,
                     bottom: bottomAnchor,
                     right: rightAnchor,
                     paddingLeft: CGFloat(StringRepresentationOfDigit.twenty),
                     paddingBottom: CGFloat(StringRepresentationOfDigit.twenty),
                     paddingRight: CGFloat(StringRepresentationOfDigit.hundred))
        authorNameLabel.anchor(left: leftAnchor,
                               bottom: stack.topAnchor,
                               right: rightAnchor,
                               paddingLeft: CGFloat(StringRepresentationOfDigit.twenty),
                               paddingBottom: CGFloat(StringRepresentationOfDigit.ten),
                               paddingRight: CGFloat(StringRepresentationOfDigit.twenty))
        repoTitle.anchor(left: leftAnchor,
                         bottom: authorNameLabel.topAnchor,
                         right: rightAnchor,
                         paddingLeft: CGFloat(StringRepresentationOfDigit.twenty),
                         paddingBottom: CGFloat(StringRepresentationOfDigit.ten),
                         paddingRight: CGFloat(StringRepresentationOfDigit.twenty))
    }
    
    func update(with repo: Repo) {
        //guard let user = repo else { return }
        //        guard let imageUrl = URL(string: (repo.owner.avatar_url)!) else { return }
        //        profileImageView.sd_setImage(with: imageUrl)
        //        authorNameLabel.text = user.owner.login
        //        repoTitle.text = user.name
        //        numberInt.text = String(user.stargazers_count)
        
        guard let imageUrl = URL(string: repo.owner.avatar_url) else { return }
        profileImageView.sd_setImage(with: imageUrl)
        authorNameLabel.text = repo.owner.login
        repoTitle.text = repo.name
        numberInt.text = String(repo.stargazers_count)
    }
}

