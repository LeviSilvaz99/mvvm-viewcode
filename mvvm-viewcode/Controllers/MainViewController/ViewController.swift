//
//  ViewController.swift
//  mvvm-viewcode
//
//  Created by André Levi Oliveira Silva on 17/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    ///views
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MainMovieTableViewCell.self, forCellReuseIdentifier: MainMovieTableViewCell.identifier)
        return tableView
    }()
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .medium)
        activity.color = .gray
        activity.center = view.center
        activity.hidesWhenStopped = true
        return activity
    }()
    
    //viewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //variables
    var cellDataSource: [Movie] = []
    
    //LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        setupUI()
        buildHierarch()
        setupConstraints()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func bindViewModel() {
        //Esta linha de código está chamando a função bind na propriedade isLoading do objeto viewModel. Isso significa que estamos observando as mudanças no valor da propriedade isLoading
        
        viewModel.isLoading.bind { [weak self] isLoading in
            // Se self for nil, isso significa que a referência ao objeto self foi liberada, e não há necessidade de continuar a execução da closure. Se isLoading for nil, significa que não houve alteração no valor de isLoading ou que ocorreu algum erro ao acessar o novo valor.
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTableView()
            
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .green
        self.navigationItem.title = "main"
    }
    
    private func buildHierarch() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieTableViewCell.identifier, for: indexPath) as? MainMovieTableViewCell
        let movieData = cellDataSource[indexPath.row]
//        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        cell?.customView.title.text = self.viewModel.getMovieTitle(movieData)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
