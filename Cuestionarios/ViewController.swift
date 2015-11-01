//
//  ViewController.swift
//  Cuestionarios
//
//  Created by Cornellana on 1/11/15.
//  Copyright © 2015 Cornellana. All rights reserved.
//

import UIKit

let rojo = UIColor.redColor()
let verde = UIColor.greenColor()
let a = UIImage(named: "A")
let b = UIImage(named: "B")
let c = UIImage(named: "C")



let correcto = UIImage(named: "correctAnswer")
let incorrecto = UIImage(named: "incorrectAnswer")

let fotoPregunta = UIImage(named: "futbol")

let cuestionario = [["Quien es el mejor equipo?","c"],["a","Madrid"],["b","Celta"],["c","Barça"]]
let numPreguntas = cuestionario.count


class ViewController: UIViewController {

    @IBOutlet weak var textoPregunta: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    @IBOutlet weak var respuestaAPregunta: UILabel!
    @IBOutlet weak var respuestaBPregunta: UILabel!
    @IBOutlet weak var respuestaCPregunta: UILabel!
    
    @IBOutlet weak var fotoImagen: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textoPregunta.text = cuestionario[0][0]
        fotoImagen.image = fotoPregunta
        
        for var i = 1 ; i < numPreguntas ; ++i {
            print(cuestionario[i][0])
            switch i {
            case 1:
                respuestaAPregunta.text = cuestionario[i][1]
                print(aButton.state)
                aButton.setImage(a!, forState: UIControlState.Normal)
            case 2:
                respuestaBPregunta.text = cuestionario[i][1]
                bButton.setImage(b!, forState: UIControlState.Normal)
            case 3:
                respuestaCPregunta.text = cuestionario[i][1]
                cButton.setImage(c!, forState: UIControlState.Normal)
            default: ()
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

