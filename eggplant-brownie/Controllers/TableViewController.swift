//
//  TableViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme de Assis dos Santos on 01/06/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate {
    func add(_ refeicao: Refeicao)
}

class TableViewController : UITableViewController, TableViewControllerDelegate {
    var refeicoes = [Refeicao("Pizza", 5), Refeicao("Coxinha", 5)]
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionarComidaSegue" {
            if let viewController = segue.destination as? AdicionaItemController {
                viewController.delegate = self
            }
        }
        
    }
    
}
