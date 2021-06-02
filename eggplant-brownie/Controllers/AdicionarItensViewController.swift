//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme de Assis dos Santos on 02/06/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: AdicionaItemDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    // MARK: - IBAction

    @IBAction func adicionaItem(_ sender: UIButton) {
        guard let nome = nomeTextField.text, let caloriasTxt = caloriasTextField.text, let calorias = Double(caloriasTxt) else { return }
        delegate?.add(Item(nome, calorias))
        navigationController?.popViewController(animated: true)
    }
    
}
