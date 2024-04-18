//
//  MainMovieTableViewCell.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 17/04/24.
//

import UIKit

class MainMovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MainMovieTableViewCell"
    
    let customView: MainMovieView = {
        let view = MainMovieView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.customView)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        configContraints()
        contentView.isUserInteractionEnabled = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    private func configContraints() {
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func configure() {
    
    }
    
}
