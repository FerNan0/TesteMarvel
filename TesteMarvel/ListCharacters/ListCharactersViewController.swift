//
//  ListCharactersViewController.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 22/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

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
        interactor.doRequest()
    }
}


extension ListCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = listTbv.dequeueReusableCell(withIdentifier: "listCell") as? ListCell {
//            cell.configure(image: movies[indexPath.row].poster ?? "", name: movies[indexPath.row].title ?? "", year: movies[indexPath.row].year ?? "")
//            cell.selectionStyle = .none
//            return cell
//        }
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

