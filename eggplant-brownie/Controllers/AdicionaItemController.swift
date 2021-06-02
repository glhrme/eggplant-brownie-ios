//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 23/02/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit


protocol AdicionaItemDelegate {
    func add(_ item: Item)
}

class AdicionaItemController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemDelegate {
    
    // MARK: - Atributos
    
    var delegate: TableViewControllerDelegate?
    var itens: [Item] = [
    ]
    
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let botaoAdicionaItem = UIBarButtonItem(title: "Adiciona Item", style: .plain, target: self, action: #selector(self.adicionaItem))
        print(botaoAdicionaItem)
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionaItem() {
        let adicionarItensViewController = AdicionarItensViewController()
        adicionarItensViewController.delegate = self
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nomeDaRefeicao, felicidade, itensSelecionados)
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = itens[indexPath.item].nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if cell.accessoryType.rawValue == 3 {
            cell.accessoryType = .none
            if let pos = itensSelecionados.firstIndex(of: itens[indexPath.row]) {
                itensSelecionados.remove(at: pos)
            }
        } else {
            cell.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        }
    }
    
    //MARK: - Delegate
    
    func add(_ item: Item) {
        itens.append(item)
        print("oi")
        tableView.reloadData()
    }
    
}

