//
//  DetailsCharacterViewController.swift
//  TesteMarvel
//
//  Created by Fernando Duarte on 23/04/20.
//  Copyright © 2020 Fernando Duarte. All rights reserved.
//

import UIKit

class  DetailsCharacterViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel! {
        didSet {
            self.lblName.textAlignment = NSTextAlignment.center
        }
    }
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var btnMoreInformation: UIButton!
    var character: Characters!
    var interactor: DetailsCharacterInteractorHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interac = DetailsCharacterInteractor()
        interactor = interac
        setText()
        setUI()
    }
    
    func setText() {
        lblName.text = character.name
        btnMoreInformation.setTitle("More information", for: .normal)
    }
    
    func setUI() {
        imgCharacter.image = interactor.downloadImage(urlString: character.thumbnail?.path ?? "")
    }
    
    @IBAction func clickMoreInformation(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "This will open a link for more information, are you sure?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { Void in
            if let requestUrl = NSURL(string: self.character.resourceURI ?? "") {
                 UIApplication.shared.openURL(requestUrl as URL)
            }
        }))
        alert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
