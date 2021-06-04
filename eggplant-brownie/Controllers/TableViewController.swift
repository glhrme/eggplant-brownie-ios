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
 
    //MARK: - Table View methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        //Cria evento de longpress
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCell(_:)))
        //Adiciono evento de longpress a celular via addGestureRecognizer
        celula.addGestureRecognizer(longPress)
        return celula
    }
    
    //MARK: - Longpress Action
    
    @objc func longPressCell(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let view = gesture.view as! UITableViewCell
            guard let index = tableView.indexPath(for: view) else { return }
            let refeicao = refeicoes[index.row]
            
            let alerta = UIAlertController(title: refeicao.nome, message: "Felicidade: \(refeicao.felicidade)", preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
            
        }
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
