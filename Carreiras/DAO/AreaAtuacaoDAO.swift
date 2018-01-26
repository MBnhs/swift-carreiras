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
        let engenharia = AreaAtuacao(icone: "ic-engenharia.png",
                                     nome: "Engenharia",
                                     link:"http://www.google.com")
        let atendimento = AreaAtuacao(icone: "ic-atendimento.png",
                                     nome: "Atendimento",
                                     link:"http://www.google.com")
        
        
        let areasAtuacao:Array<AreaAtuacao> = [engenharia, atendimento]
        return areasAtuacao
    }

    
}
