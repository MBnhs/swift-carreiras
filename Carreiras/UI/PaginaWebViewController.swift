//
//  PaginaWebViewController.swift
//  Carreiras
//
//  Created by Marcelo Banhos on 27/01/18.
//  Copyright © 2018 Marcelo Banhos. All rights reserved.
//

import UIKit

class PaginaWebViewController: UIViewController, UIWebViewDelegate {

    var link : String = ""
    
    @IBOutlet weak var paginaWeb: UIWebView!
    @IBOutlet weak var indicador: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.paginaWeb.delegate = self
        indicador.startAnimating()
        let url = URL(string: link)
        let request = URLRequest(url:url!)
        paginaWeb.loadRequest(request)
        
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicador.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
