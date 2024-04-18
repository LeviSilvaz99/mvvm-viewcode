//
//  MainMovieView.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 17/04/24.
//

import UIKit
import SDWebImage

class MainMovieView: UIView {
    
    private lazy var bgView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 4
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
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
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            mainMoviewImageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
            mainMoviewImageView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor),
            mainMoviewImageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5),
            mainMoviewImageView.widthAnchor.constraint(equalToConstant: 92),
            
            title.leadingAnchor.constraint(equalTo: mainMoviewImageView.trailingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: bgView.centerXAnchor)
            
        ])
    }
    
    public func setupCell(viewModel: MovieTableViewModel) {
        self.title.text = viewModel.title
        self.mainMoviewImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
