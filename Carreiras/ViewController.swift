//
//  ViewController.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 21/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var tableCulturas: UITableView!
    @IBOutlet weak var colecaoAreas: UICollectionView!
    
    let listaCultura:Array<Cultura> = CulturaDAO().listaCulturas()
    let listaAreas:Array<AreaAtuacao> = AreaAtuacaoDAO().listaAreasAtuacao()
    let listaRedesSociais:Array<RedeSocial> = RedeSocialDAO().listaRedesSociais()
    
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
        return listaAreas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaArea = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaArea", for: indexPath) as! AreaCollectionViewCell
        celulaArea.backgroundColor = UIColor.blue
        return celulaArea
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableCulturas.dataSource = self
        self.tableCulturas.delegate = self
        self.colecaoAreas.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

