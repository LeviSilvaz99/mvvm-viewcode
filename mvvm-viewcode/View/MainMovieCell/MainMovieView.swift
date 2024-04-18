//
//  MainMovieView.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 17/04/24.
//

import UIKit

class MainMovieView: UIView {
    
    private lazy var bgView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    public lazy var mainMoviewImageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupLayout()
        self.setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(bgView)
        bgView.addSubview(mainMoviewImageView)
        bgView.addSubview(title)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.heightAnchor.constraint(equalToConstant: 80),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgView.topAnchor.constraint(equalTo: self.topAnchor),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            title.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: bgView.centerXAnchor)
            
        ])
    }
    
}
