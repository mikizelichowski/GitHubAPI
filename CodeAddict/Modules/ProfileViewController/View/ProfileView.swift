//
//  ProfileView.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 10/12/2020.
//

import UIKit

final class ProfileView: UITableViewCell {
    private enum Constants {
        static let widthHeigtView: CGFloat = 36.0
        static let authorLabel = "COMMIT AUTHOR NAME"
        static let emailLabel = "email@authorname.com"
        static let messageLabel = "This is a commit message that needs to fold"
    }
    
    private let commitAuthorLabel = CustomLabel(style: .commitTitle, title: Constants.authorLabel)
    private let emailLabel = CustomLabel(style: .email, title: Constants.emailLabel)
    private let descriptionLabel = CustomLabel(style: .description, title: Constants.messageLabel)
    
    private let numberView: UIView = {
        let view = UIView(frame: CGRect(x: .zero, y: .zero,
                                        width: Constants.widthHeigtView,
                                        height: Constants.widthHeigtView))
        view.layer.cornerRadius = Constants.widthHeigtView / CGFloat(StringRepresentationOfDigit.two)
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        selectionStyle = .none
        backgroundColor = .white
        let stack = UIStackView(arrangedSubviews: [commitAuthorLabel, emailLabel, descriptionLabel])
        stack.alignment = .leading
        stack.axis = .vertical
        [numberView, stack].forEach{ addSubview($0)}
        numberView.centerY(inView: self,
                           leftAnchor: leftAnchor,
                           paddingLeft: CGFloat(StringRepresentationOfDigit.twenty))
        stack.centerY(inView: numberView,
                      leftAnchor: numberView.rightAnchor,
                      paddingLeft: CGFloat(StringRepresentationOfDigit.twenty))
        stack.anchor(right: rightAnchor,
                     paddingRight: CGFloat(StringRepresentationOfDigit.four))
    }
    
    func update(repo: CommitData) {
        commitAuthorLabel.text = repo.author.name
        emailLabel.text = repo.author.email
        descriptionLabel.text = repo.message.message
    }
}
