//
//  ViewController.swift
//  Cuestionarios
//
//  Created by Cornellana on 1/11/15.
//  Copyright © 2015 Cornellana. All rights reserved.
//

import UIKit

// Definicion de la encuesta

    var preguntasExamen = [[String]]()
    var alternativasPregunta = [[String]]()
    var misRespuestas = Array<Array<String>>()
    var respuestaPregunta = ""
    let indicePreguntas = ["a","b","c","d"]
    let maxPreguntas = indicePreguntas.count
    var maxPaginas = 0


//================================================================

    var respuestasBuenas = 0
    var numPagina:Int = 1


    let rojo = UIColor.redColor()
    let verde = UIColor.greenColor()

    let correcto = UIImage(named: "correctAnswer")
    let incorrecto = UIImage(named: "incorrectAnswer")

    var botones:[String:UIButton] = [:]
    var respuestas:[String:UILabel] = [:]

class ViewController: UIViewController {

    @IBOutlet weak var textoPregunta: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    
    @IBOutlet weak var bacKButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var respuestaAPregunta: UILabel!
    @IBOutlet weak var respuestaBPregunta: UILabel!
    @IBOutlet weak var respuestaCPregunta: UILabel!
    @IBOutlet weak var respuestaDPregunta: UILabel!
    
    @IBOutlet weak var numeroPregunta: UILabel!
    @IBOutlet weak var numeroPuntos: UILabel!

    
    
    @IBOutlet weak var fotoImagen: UIImageView!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numeroPregunta.text = "\(numPagina)"
        numeroPuntos.text = "\(respuestasBuenas)"
        
        
        nextButton.hidden = false
        preguntasExamen = [["Trivia Animales","4","7","Animales"],
            ["A Playpus is:","c","platypus"],
            ["Do polar bears eat penguins?","b","polarBear"],
            ["What do giant pandas eat exclusively?","b","panda"],
            ["What kind of animal is the lion","a","leon"]]
        alternativasPregunta = [["a","b"],
            ["An Australian hedgehog","There is no such beast","A fuury mammal wich lays eggs, has a duck's bill and is poisonous"],
            ["No, it's bad for their figure","No they live in opposite poles of the planet","Yes it's their favorite snack","they need eat two every day"],
            ["McDonalds's","Bamboo"],
            ["Carnivoro","Hervivoro","omnivoro"]]
         maxPaginas = alternativasPregunta.count - 1
        


        for var ii = 0 ; ii <= maxPaginas ; ii++ {
            misRespuestas.append(Array(count:2, repeatedValue:"x"))
        }
        
        // Pinta Pantalla Inicial
        
         botones = ["a":aButton, "b":bButton, "c":cButton, "d":dButton]
         respuestas = ["a":respuestaAPregunta, "b":respuestaBPregunta, "c":respuestaCPregunta, "d":respuestaDPregunta]
        
        textoPregunta.text = preguntasExamen[numPagina][0]
        respuestaPregunta = preguntasExamen[numPagina][1]
        fotoImagen.image = UIImage(named: preguntasExamen[numPagina][2])
        
        
        for var i:Int = 0; i < maxPaginas; i++ {
            pintaPregunta(numPagina, ind: i)
        }
        
        numPagina++
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
    
    @IBAction func dButtonPressed(sender: UIButton) {
        comprobarRespuesta("d")
    }
    @IBAction func darLaRespuesta(sender: UIButton) {
        respuestasBuenas--
        comprobarRespuesta(respuestaPregunta)
    }
  
    @IBAction func nextButtonPressed(sender: UIButton) {
        
        textoPregunta.text = preguntasExamen[numPagina][0]
        reactivateButtons()
        
        for var i:Int = 0; i < maxPreguntas; i++ {
        pintaPregunta(numPagina, ind: i)
        }
        
        numeroPregunta.text = "\(numPagina)"
        respuestaPregunta = preguntasExamen[numPagina][1]
        fotoImagen.image = UIImage(named: preguntasExamen[numPagina][2])
        
        nextButton.hidden = false
        bacKButton.hidden = false
        
        if numPagina == 1 {
            bacKButton.hidden = true
        } else {
            if numPagina == maxPaginas {
                nextButton.hidden = true
            }
        }
        numPagina++
    }


    @IBAction func backButtonPressed(sender: UIButton) {
    
    
        numPagina = numPagina-2
        
        textoPregunta.text = preguntasExamen[numPagina][0]
        reactivateButtons()
        
        for var i:Int = 0; i < maxPreguntas; i++ {
            pintaPregunta(numPagina, ind: i)
        }
        
        numeroPregunta.text = "\(numPagina)"
        respuestaPregunta = preguntasExamen[numPagina][1]
        fotoImagen.image = UIImage(named: preguntasExamen[numPagina][2])
        
        if numPagina == Int(preguntasExamen[0][1]) {
            numPagina = 0
        }
        
        nextButton.hidden = false
        bacKButton.hidden = false
        
        if numPagina == 1 {
            bacKButton.hidden = true
        } else {
            if numPagina == 0 {
                nextButton.hidden = true
            }
        }
        numPagina++
        
      }
    
    
    
    
    // Funciones
    
    
    
    func resultadoCorrecto (laCorrectaEs:String) {

        for var i: String in indicePreguntas {
        botones[i]!.enabled = false
        if laCorrectaEs == i {
            botones[i]!.enabled = true
            respuestasBuenas++
            numeroPuntos.text = "\(respuestasBuenas)"
        }
      }
    }
    func resultadoIncorrecto (laCorrectaEs:String) {
        
        for var i: String in indicePreguntas {
            botones[i]!.enabled = false
            if laCorrectaEs == i {
                botones[i]!.enabled = true
            }
        }
    }

    func reactivateButtons(){
        
        for var i:String in indicePreguntas {
            botones[i]!.enabled = true
            respuestas[i]!.textColor = UIColor.blackColor()
        }
        
    }
    
    func pintaPregunta (pagina:Int,ind:Int) {
        
        if ind >= alternativasPregunta[pagina].count {
            botones[indicePreguntas[ind]]!.hidden = true
            respuestas[indicePreguntas[ind]]!.text = ""
            return
        }
        
        if misRespuestas[pagina][0] == "x" {
            respuestas[indicePreguntas[ind]]!.text = alternativasPregunta[pagina][ind]
            botones[indicePreguntas[ind]]!.hidden = false
            botones[indicePreguntas[ind]]!.setImage(UIImage(named: indicePreguntas[ind].capitalizedString), forState: UIControlState.Normal)
        } else {
            if misRespuestas[pagina][0] == indicePreguntas[ind] {
                
                if misRespuestas[pagina][1] == "c" {
                    botones[indicePreguntas[ind]]!.setImage(correcto, forState: UIControlState.Normal)
                    botones[indicePreguntas[ind]]!.hidden = false
                    botones[indicePreguntas[ind]]!.enabled = false
                    respuestas[indicePreguntas[ind]]!.text = alternativasPregunta[pagina][ind]
                    respuestas[indicePreguntas[ind]]!.textColor = verde
                } else {
                    botones[indicePreguntas[ind]]!.setImage(incorrecto, forState: UIControlState.Normal)
                    botones[indicePreguntas[ind]]!.hidden = false
                    botones[indicePreguntas[ind]]!.enabled = false
                    respuestas[indicePreguntas[ind]]!.text = alternativasPregunta[pagina][ind]
                    respuestas[indicePreguntas[ind]]!.textColor = rojo
                }
        
        } else {
            
            respuestas[indicePreguntas[ind]]!.text = alternativasPregunta[pagina][ind]
            botones[indicePreguntas[ind]]!.enabled = false
            botones[indicePreguntas[ind]]!.setImage(UIImage(named: indicePreguntas[ind].capitalizedString), forState: UIControlState.Normal)
            botones[indicePreguntas[ind]]!.hidden = false
            }
        }
    }
     


    func comprobarRespuesta(laRespuesta:String) {
        
        if respuestaPregunta == laRespuesta {
            botones[laRespuesta]!.setImage(correcto, forState: UIControlState.Normal)
            respuestas[laRespuesta]!.textColor = verde
            misRespuestas[numPagina-1][0] = laRespuesta
            misRespuestas[numPagina-1][1] = "c"
            resultadoCorrecto(laRespuesta)
        }
        else {
            botones[laRespuesta]!.setImage(incorrecto, forState: UIControlState.Normal)
            respuestas[laRespuesta]!.textColor = rojo
            misRespuestas[numPagina-1][0] = laRespuesta
            misRespuestas[numPagina-1][1] = "i"
            resultadoIncorrecto(laRespuesta)
        }

    }

}

    


    



