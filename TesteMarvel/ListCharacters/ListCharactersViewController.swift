//
//  ListCharactersViewController.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

protocol ListCharactersViewControllerHelper {
    func showAlertFailedRequest()
    func reloadTBVData()
}

class ListCharactersViewController: UIViewController {

    @IBOutlet weak var listTbv: UITableView!
    let interactor = ListCharactersInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters List"
        listTbv.delegate = self
        listTbv.dataSource = self
        listTbv.tableFooterView = UIView()
        listTbv.allowsSelection = true
        listTbv.register(UINib(nibName: "CharactersListCell", bundle: nil), forCellReuseIdentifier: "charactersListCell")
        let presenter = ListCharactersPresenter()
        presenter.viewController = self
        interactor.presenter = presenter
        interactor.doRequestCharacters()
    }
}


extension ListCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listTbv.dequeueReusableCell(withIdentifier: "charactersListCell") as? CharactersListCell {
            cell.configure(imageURL: interactor.characters?[indexPath.row].thumbnail?.path ?? "" , name: interactor.characters?[indexPath.row].name ?? "", interactor: interactor)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController(nibName: "Detail", bundle: nil) as DetailViewController
//        vc.movie = movies[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ListCharactersViewController: ListCharactersViewControllerHelper {
    func reloadTBVData() {
        self.listTbv.reloadData()
    }
    
    
    func showAlertFailedRequest() {
        let alert = UIAlertController(title: "Request Failed", message: "Would you like to try it again?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { Void in
            self.interactor.doRequestCharacters()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
