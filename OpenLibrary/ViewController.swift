//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Azareel on 12/03/16.
//  Copyright © 2016 Azareel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buscarFrm: UITextField!
    @IBOutlet weak var respuesta: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buscar(sender: UIButton) {
        let url=NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+self.buscarFrm.text!)
        
        let resp:NSData?=NSData(contentsOfURL: url!)
        let texto=NSString(data: resp!, encoding: NSUTF8StringEncoding)
        self.respuesta.text=texto! as String
    }

    @IBAction func limpiar(sender: UIButton) {
        self.buscarFrm.text=""
        self.respuesta.text=""
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}