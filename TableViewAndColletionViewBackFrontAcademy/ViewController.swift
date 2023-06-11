//
//  ViewController.swift
//  TableViewAndColletionViewBackFrontAcademy
//
//  Created by Sillas Santos on 11/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var infoTableView: UITableView = {
        var view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        configureViews()
        configConstraints()
    }
    
    func addViews() {
        view.addSubview(infoTableView)
    }
    
    func configureViews() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            infoTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoTableView.widthAnchor.constraint(equalToConstant: view.frame.width / 100 * 80),
            infoTableView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

// MARK: - Protocols TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                     for: indexPath) as? CustomTableViewCell
        return cell ?? UITableViewCell()
    }
}

#Preview("ViewController") {
    ViewController() }
