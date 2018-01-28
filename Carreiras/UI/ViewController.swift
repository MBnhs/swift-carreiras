//
//  ViewController.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 21/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tableCulturas: UITableView!
    @IBOutlet weak var colecaoAreas: UICollectionView!
    @IBOutlet weak var colecaoRedesSociais: UICollectionView!
    
    var listaCultura:Array<Cultura> = Array()
    var listaAreas:Array<AreaAtuacao> = Array()
    var listaRedesSociais:Array<RedeSocial> = Array()
    
    var ref: DatabaseReference!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCultura.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let cultura = listaCultura[indexPath.row]
        cell.labelCulturaTitulo.text = cultura.titulo
        cell.labelCulturaDescricao.text = cultura.descricao
        cell.imageCultura.image = UIImage(named: cultura.icone)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numeroItens = 0
        if (collectionView == self.colecaoAreas) {
            numeroItens = listaAreas.count
        }
        
        if (collectionView == self.colecaoRedesSociais) {
            numeroItens = listaRedesSociais.count
        }
        
        return numeroItens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.colecaoAreas) {
            let celulaArea = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaArea", for: indexPath) as! AreaCollectionViewCell
            
            let area = listaAreas[indexPath.row]
            celulaArea.labelNome.text = area.nome
            celulaArea.imageArea.image = UIImage(named: area.icone)
            
            return celulaArea
        } else {
            let celulaRedeSocial = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaRedeSocial", for: indexPath) as! RedeSocialCollectionViewCell
            
            let redeSocial = listaRedesSociais[indexPath.row]
            celulaRedeSocial.imageRedeSocial.image = UIImage(named: redeSocial.icone)
            
            return celulaRedeSocial
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destino = PaginaWebViewController()
        let area = listaAreas[indexPath.row]
        destino.link = area.link
        navigationController?.pushViewController(destino, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableCulturas.dataSource = self
        self.tableCulturas.delegate = self
        self.colecaoAreas.dataSource = self
        self.colecaoAreas.delegate = self
        self.colecaoRedesSociais.dataSource = self
        loadCultura()
        loadAreas()
        loadRedesSociais()
        
        
        
    }
    
    func loadCultura() {
        ref = Database.database().reference()
        
        ref.child("culturas").observe(.childAdded, with: { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
            let titulo:String = data!["titulo"] as! String
            let descricao:String = data!["descricao"] as! String
            
            var iconeExtensao = ""
            if let icone = data!["icone"] {
                let iconeData = icone as! String
                iconeExtensao = "\(iconeData.replacingOccurrences(of: "_", with: "-")).png"
            }
            

            
            let cultura = Cultura(icone: iconeExtensao,
                                          titulo: titulo,
                                          descricao: descricao)
            self.listaCultura.append(cultura)
            self.tableCulturas.reloadData()
        })
    }
    
    func loadAreas() {
        ref = Database.database().reference()
        
        ref.child("areasAtuacao").observe(.childAdded, with: { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
            let link:String = data!["link"] as! String
            let nome:String = data!["nome"] as! String
            let icone:String = data!["icone"] as! String
            let iconeExtensao = "\(icone.replacingOccurrences(of: "_", with: "-")).png"
            
            let areaAtuacao = AreaAtuacao(icone: iconeExtensao,
                                          nome: nome,
                                        link:link)
            self.listaAreas.append(areaAtuacao)
            self.colecaoAreas.reloadData()
        })
    }
    
    func loadRedesSociais() {
        ref = Database.database().reference()
        
        ref.child("redesSociais").observe(.childAdded, with: { (snapshot) in
            let data = snapshot.value as? [String:AnyObject]
            let link:String = data!["link"] as! String
            let icone:String = data!["icone"] as! String
            let iconeExtensao = "\(icone.replacingOccurrences(of: "_", with: "-")).png"
            
            let redeSocial = RedeSocial(icone: iconeExtensao,
                                        link:link)
            self.listaRedesSociais.append(redeSocial)
            self.colecaoRedesSociais.reloadData()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let largura = collectionView.bounds.width / 2
        return CGSize(width: largura-10, height: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

