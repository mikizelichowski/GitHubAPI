//
//  SearchView.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 09/12/2020.
//

import UIKit
import SDWebImage

final class SearchView: UITableViewCell {
    private enum Constants {
        static let cellHeight: CGFloat = 92.0
        static let cornerRadius: CGFloat = 13.0
        static let paddingTop: CGFloat = 30.0
    }
    
    var profileImage = CustomImage(style: .cell)
    var starImage = CustomImage(style: .star)
    let titleLabel = CustomLabel(style: .title)
    let raitingLabel = CustomLabel(style: .ratingNumber)
    private let backgroundCell = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        selectionStyle = .none
        addSubview(backgroundCell)
        backgroundCell.backgroundColor = .backgroundCell
        backgroundCell.layer.cornerRadius = Constants.cornerRadius
        backgroundCell.anchor(top: topAnchor,
                              left: leftAnchor,
                              bottom: bottomAnchor,
                              right: rightAnchor,
                              paddingTop: CGFloat(StringRepresentationOfDigit.nine),
                              paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen),
                              paddingBottom: CGFloat(StringRepresentationOfDigit.nine),
                              paddingRight: CGFloat(StringRepresentationOfDigit.sixteen),
                              height: Constants.cellHeight)
        
        [profileImage, titleLabel].forEach { backgroundCell.addSubview($0)}
        profileImage.centerY(inView: backgroundCell,
                             leftAnchor: backgroundCell.leftAnchor,
                             paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen))
        profileImage.anchor(top: backgroundCell.topAnchor,
                            bottom: backgroundCell.bottomAnchor,
                            paddingTop: CGFloat(StringRepresentationOfDigit.sixteen),
                            paddingBottom: CGFloat(StringRepresentationOfDigit.sixteen))
        titleLabel.anchor(top: backgroundCell.topAnchor,
                          left: profileImage.rightAnchor,
                          right: backgroundCell.rightAnchor,
                          paddingTop: Constants.paddingTop,
                          paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen),
                          paddingRight: CGFloat(StringRepresentationOfDigit.four))
        
        let stack = UIStackView(arrangedSubviews: [starImage, raitingLabel])
        stack.axis = .horizontal
        stack.spacing = CGFloat(StringRepresentationOfDigit.four)
        backgroundCell.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: profileImage.rightAnchor,
                     right: backgroundCell.rightAnchor,
                     paddingTop: CGFloat(StringRepresentationOfDigit.two),
                     paddingLeft: CGFloat(StringRepresentationOfDigit.sixteen))
    }
    
    func update(listUser: Repo) {
        
        guard let imageURL = URL(string: listUser.owner.avatar_url) else { return}
        titleLabel.text = listUser.name
        profileImage.sd_setImage(with: imageURL)
        raitingLabel.text = String(listUser.stargazers_count)
    }
}
