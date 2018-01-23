//
//  CulturaDAO.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 23/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class CulturaDAO: NSObject {

    func listaCulturas() -> Array<Cultura> {
        let nossaCultura = Cultura(icone: "",
                                   titulo:"Nossa cultura",
                                   descricao: "Somos orientados pela satisfação e fidelização de nossos clientes")
        let criatividade = Cultura(icone: "criatividade.png",
                                   titulo:"Criatividade",
                                   descricao: "Estimulamos a intervenção humana como algo insubstituível. Nosso ambiente é inspirador")
        let colaboracao = Cultura(icone: "colaboracao.png",
                                  titulo:"Colaboração",
                                  descricao: "Valorizamos o trabalho em equipe e as habilidades individuais. Incentivamos o empreendedorismo e formamos um time fora de série")
        let tecnologia = Cultura(icone: "tec_ino.png",
                                 titulo:"Tecnologia e Inovação",
                                 descricao: "Utilizamos a tecnologia para melhorar continuamente nosso negócio. Transformamos e conectamos pessoas")
        
        let culturas:Array<Cultura> = [nossaCultura, criatividade, colaboracao, tecnologia]
        return culturas
    }
    
}
