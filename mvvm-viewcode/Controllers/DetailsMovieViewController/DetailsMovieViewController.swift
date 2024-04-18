//
//  DetailsMovieViewController.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 18/04/24.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {
    
    public lazy var detailMovieImage: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
                   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildHierarch()
        setupConstraints()
        configView()
    }

    
    private func buildHierarch() {
        view.addSubview(detailMovieImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            detailMovieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            detailMovieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            detailMovieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33),
            detailMovieImage.heightAnchor.constraint(equalToConstant: 213),
        ])
    }
    
    func configView() {
        self.detailMovieImage.sd_setImage(with: viewModel.movieImage)
    }
    
}
