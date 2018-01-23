//
//  Cultura.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 23/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class Cultura: NSObject {
    
    let icone:String
    let titulo:String
    let descricao:String
    
    init(icone:String, titulo:String, descricao:String) {
        self.icone = icone
        self.titulo = titulo
        self.descricao = descricao
    }

}
