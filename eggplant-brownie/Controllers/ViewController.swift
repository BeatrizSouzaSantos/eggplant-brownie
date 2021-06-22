//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by user on 09/06/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView!
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens : [Item] = [Item(nome: "Molho de Tomate", calorias: 40.0),
                          Item(nome: "Molho de Salada", calorias: 40.0),
                          Item(nome: "Molho Apimentado", calorias: 40.0),
                          Item(nome: "Quejo", calorias: 40.0)]
    var itensSelecionados : [Item] = []
    
    // MARK: - IBOutlats
    
   @IBOutlet var nomeTextField: UITextField?
   @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        //adicionando botao a TopBar
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItens(){
        
        //exibindo a tela de adicionar novo item
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return itens.count
       }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)

        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]

        celula.textLabel?.text = item.nome

        return celula
    }

    // MARK: - UITableViewDelegate
    //identificar o clique de usuario

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //Checkando lista de itens
            guard let celula = tableView.cellForRow(at: indexPath) else { return }
            if celula.accessoryType ==  .none {
                 celula.accessoryType = .checkmark
                let linhaDaTabela = indexPath.row
                //Adicionando elementos que o usuario selecionou
                itensSelecionados.append(itens[linhaDaTabela])
                     } else {
                         celula.accessoryType = .none
                        //removendo o check da lista
                        let item = itens[indexPath.row]
                        if let position = itensSelecionados.firstIndex(of: item) {
                            itensSelecionados.remove(at: position)
                        }
                        
                        }
                        
                     }

    // MARK: - IBActions
    
   @IBAction func Adicionar(_ sender: Any) {
    
    guard let nomeDaRefeicao = nomeTextField?.text else {
               return
           }
    guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
               return
           }
    
    let refeicao = Refeicao (nome: nomeDaRefeicao, felicidade: felicidade)
    
    print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    
    
    delegate?.add(refeicao)
    navigationController?.popViewController(animated: true)

       }

   }
