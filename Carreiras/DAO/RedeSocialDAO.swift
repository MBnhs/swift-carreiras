//
//  RedeSocialDAO.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 25/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class RedeSocialDAO: NSObject {

    func listaRedesSociais() -> Array<RedeSocial> {
        let facebook = RedeSocial(icone: "facebook.png",
                                  link:"http://www.facebook.com")
        
        
        let redesSociais:Array<RedeSocial> = [facebook]
        return redesSociais
    }

    
}
