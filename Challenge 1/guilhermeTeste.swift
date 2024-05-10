//
//  guilhermeTeste.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 10/05/24.
//

import Foundation

var mapaAtual = mapa();
var mapaBase = mapaAtual.mapaDesenho;
var posicoesValidas = mapaAtual.posicoesValidas;



var posicaoBoneco = (x: 4, y: 3, ladoOlhando: "a");

func loopGame() {
    
    print(posicoesValidas)
    
    while(true) {
        
        var entrada = readLine()
        var funcaoAndar: () -> (x: Int, y: Int) = {(x: 1, y: 1)};
        
        if let entradaConfirmada = entrada {
            
            var entradaSeparada = entradaConfirmada.split(separator: " ");
            
            switch entradaSeparada[0].uppercased() {
                
            case "W":
                funcaoAndar = {
                     return (x: posicaoBoneco.x, y: posicaoBoneco.y - 1)
                }
                
                posicaoBoneco.ladoOlhando = "↑";
                
                break
            case "A":
                funcaoAndar = {
                    (x: posicaoBoneco.x - 2, y: posicaoBoneco.y)
                }
                
                posicaoBoneco.ladoOlhando = "←";
                break
            case "S":
                funcaoAndar = {
                    (x: posicaoBoneco.x, y: posicaoBoneco.y + 1)
                }
                
                posicaoBoneco.ladoOlhando = "↓";
                break
            case "D":
                funcaoAndar = {
                    (x: posicaoBoneco.x + 2, y: posicaoBoneco.y)
                }
                
                posicaoBoneco.ladoOlhando = "→";
                break
            case "X":
                exit(0)
                break
            default:
                break
                
                
            }
            
            printarGameTeste(ladoViradoBoneco: posicaoBoneco.ladoOlhando)
     
            
            if entradaSeparada.count > 1 {
                if let numeroDeCasas = Int(entradaSeparada[1]) {
                    for i in 0..<numeroDeCasas {
                        var posicaoFutura = funcaoAndar();
                        if (mapaBase[posicaoFutura.y][posicaoFutura.x] == ".") {
                            posicaoBoneco.x = funcaoAndar().x
                            posicaoBoneco.y = funcaoAndar().y
                            printarGameTeste(ladoViradoBoneco: posicaoBoneco.ladoOlhando)
                        } else {
                            print("colisao".red())
                            break
                        }
                        
                        
                        do {
                            usleep(200000)
                        }
                    }
                }
            }
        }
    }
}





func printarGameTeste(ladoViradoBoneco: String) {
    
    
    
    var vetorCopia = mapaBase
    
    vetorCopia[posicaoBoneco.y][posicaoBoneco.x] = ladoViradoBoneco.red()
    
    
    
    for i in 0..<vetorCopia.count {
        for j in 0..<vetorCopia[0].count {
            print(vetorCopia[i][j] ,terminator: "");
        }
        
        print();
    }

}

    
    
    
    




extension String {
  
  func black() -> String { juntar("30") }
  func red() -> String { juntar("31") }
  func green() -> String { juntar("32") }
  func yellow() -> String { juntar("33") }
  func blue() -> String { juntar("34") }
  func magenta() -> String { juntar("35") }
  func cyan() -> String { juntar("36") }
  func white() -> String { juntar("37") }
  func bgBlack() -> String { juntar("40") }
  func bgRed() -> String { juntar("41") }
  func bgGreen() -> String { juntar("42") }
  func bgYellow() -> String { juntar("43") }
  func bgBlue() -> String { juntar("44") }
  func bgMagenta() -> String { juntar("45") }
  func bgCyan() -> String { juntar("46") }
  func bgWhite() -> String { juntar("47") }

  func black2() -> String { juntar("90") }
  func red2() -> String { juntar("91") }
  func green2() -> String { juntar("92") }
  func yellow2() -> String { juntar("93") }
  func blue2() -> String { juntar("94") }
  func magenta2() -> String { juntar("95") }
  func cyan2() -> String { juntar("96") }
  func white2() -> String { juntar("97") }
  func bgBlack2() -> String { juntar("100") }
  func bgRed2() -> String { juntar("101") }
  func bgGreen2() -> String { juntar("102") }
  func bgYellow2() -> String { juntar("103") }
  func bgBlue2() -> String { juntar("104") }
  func bgMagenta2() -> String { juntar("105") }
  func bgCyan2() -> String { juntar("106") }
  func bgWhite2() -> String { juntar("107") }

  func juntar(_ cor: String) -> String {
     "\u{001B}[0;" + cor + "m" + self + "\u{001B}[0;0m"
  }

  var tamanho: Int { self.count - 13 }

}


