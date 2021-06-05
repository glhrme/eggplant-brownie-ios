//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Guilherme de Assis dos Santos on 05/06/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    let controller: UIViewController
    
    init(_ view: UIViewController) {
        self.controller = view
    }
    
    func exibe(_ refeicao: Refeicao, _ handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        let botaoDeletar = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoDeletar)
        alerta.addAction(botaoCancelar)
        self.controller.present(alerta, animated: true, completion: nil)
    }
}
