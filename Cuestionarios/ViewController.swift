//
//  ViewController.swift
//  Cuestionarios
//
//  Created by Cornellana on 1/11/15.
//  Copyright © 2015 Cornellana. All rights reserved.
//

import UIKit

// Definicion de la encuesta

    let textoCuestion = "Quien es el mejor Equipo del Mundo?"
    let lasRespuestas = ["a","b","c"]
    let cuestionario = ["a":"Madrid","b":"Celta","c":"Barça"]
    let respuestaPregunta = "c"

    let numPreguntas = cuestionario.count
    var respuestasBuenas = 0


    let rojo = UIColor.redColor()
    let verde = UIColor.greenColor()

    let correcto = UIImage(named: "correctAnswer")
    let incorrecto = UIImage(named: "incorrectAnswer")

    let fotoPregunta = UIImage(named: "futbol")



    var botones:[String:UIButton] = [:]
    var respuestas:[String:UILabel] = [:]

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
        
        textoPregunta.text = textoCuestion

        fotoImagen.image = fotoPregunta
        
        
         botones = ["a":aButton, "b":bButton, "c":cButton]
         respuestas = ["a":respuestaAPregunta, "b":respuestaBPregunta, "c":respuestaCPregunta]
        
        for var i: String in lasRespuestas {
            
            pintaPregunta(i)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func aButtonPressed(sender: UIButton) {
        
        comprobarRespuesta("a")
        
        }
    
    @IBAction func bButtonPressed(sender: UIButton) {
        
        comprobarRespuesta("b")
        
    }
    
    @IBAction func cButtonPressed(sender: UIButton) {
        
        comprobarRespuesta("c")
    }
    
    func resultadoCorrecto (laCorrectaEs:String) {

        for var i: String in lasRespuestas {
        botones[i]!.enabled = false
        if laCorrectaEs == i {
            botones[i]!.enabled = true
            respuestasBuenas++
        }
      }
    }
    
    func resultadoIncorrecto (laCorrectaEs:String) {
        
        for var i: String in lasRespuestas {
            botones[i]!.enabled = false
            if laCorrectaEs == i {
                botones[i]!.enabled = true
            }
        }
        
    }
    
    func pintaPregunta (laPregunta:String) {
        
        respuestas[laPregunta]!.text = cuestionario[laPregunta]
        botones[laPregunta]!.hidden = false
        botones[laPregunta]!.setImage(UIImage(named: laPregunta.capitalizedString), forState: UIControlState.Normal)

    }
    
    func comprobarRespuesta(laRespuesta:String) {
        
        if respuestaPregunta == laRespuesta {
            botones[laRespuesta]!.setImage(correcto, forState: UIControlState.Normal)
            respuestas[laRespuesta]!.textColor = verde
            resultadoCorrecto(laRespuesta)}
        else {
            botones[laRespuesta]!.setImage(incorrecto, forState: UIControlState.Normal)
            respuestas[laRespuesta]!.textColor = rojo
            resultadoIncorrecto(laRespuesta)}
        
    }


}
    
    
    
    



