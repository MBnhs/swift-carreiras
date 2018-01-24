//
//  ViewController.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 21/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableCulturas: UITableView!
    
    let listaCultura:Array<Cultura> = CulturaDAO().listaCulturas()

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableCulturas.dataSource = self
        self.tableCulturas.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

