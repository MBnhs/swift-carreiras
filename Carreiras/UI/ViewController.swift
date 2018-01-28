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
    
    let listaCultura:Array<Cultura> = CulturaDAO().listaCulturas()
    let listaAreas:Array<AreaAtuacao> = AreaAtuacaoDAO().listaAreasAtuacao()
    let listaRedesSociais:Array<RedeSocial> = RedeSocialDAO().listaRedesSociais()
    
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
        
        ref = Database.database().reference()
        
        ref.child("hello2").setValue("world2!!!")
        
        
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

