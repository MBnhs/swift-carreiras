//
//  AreaAtuacaoDAO.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 25/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class AreaAtuacaoDAO: NSObject {

    func listaAreasAtuacao() -> Array<AreaAtuacao> {
        let engenharia = AreaAtuacao(icone: "engenharia.png",
                                     nome: "Engenharia",
                                     link:"http://www.google.com")
        
        
        let areasAtuacao:Array<AreaAtuacao> = [engenharia]
        return areasAtuacao
    }

    
}
