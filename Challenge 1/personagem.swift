//
//  personagem.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 20/05/24.
//

import Foundation

class Personagem {
    
    var posicao: (x: Int, y: Int) = (x: 0, y: 0);
    var direcaoPadrao = "↓".red();
    var energia: Int = 100;
    var inventario: [String] = ["", ""];
    var inventarioQuantidade: [Int] = [0,0];
    var pegarFuturaPosicao: () -> (x: Int, y: Int) = { (x: personagem.posicao.x, y: personagem.posicao.y + 1) };
    
    func acaoDoTurno(entrada: String) {
        
        var entradaInvalida = false
        
            
            let entradaSeparada = entrada.split(separator: " ");
            
            switch entradaSeparada[0].uppercased() {
                
            case "W":
                pegarFuturaPosicao = { return (x: personagem.posicao.x, y: personagem.posicao.y - 1) }
                personagem.direcaoPadrao = "↑".red();
                break
                
            case "A":
                pegarFuturaPosicao = { (x: personagem.posicao.x - 2, y: personagem.posicao.y) }
                personagem.direcaoPadrao = "←".red();
                break
                
            case "S":
                pegarFuturaPosicao = { (x: personagem.posicao.x, y: personagem.posicao.y + 1) }
                personagem.direcaoPadrao = "↓".red();
                break
                
            case "D":
                pegarFuturaPosicao = { (x: personagem.posicao.x + 2, y: personagem.posicao.y) }
                personagem.direcaoPadrao = "→".red();
                break
                
            case "E": //Interagir
                let espacoFuturo = pegarFuturaPosicao();
                print(espacoFuturo)
                if let coisaNoEspaco = mapaAtual.mapaDesenhadoComObjetos[espacoFuturo.y][espacoFuturo.x].algoInteragivel {
                    coisaNoEspaco.interacao()
                    mapaAtual.desenharObjetosMapa()
                }
                break
            case "B":
                print("troca de mapa..")
                mapaAtual = todasAsFases[1];
                mapaAtual.desenharObjetosMapa();
                
                personagem.energia -= 10
                break
                
            case "X":
                exit(0)
                break
                
            case "I": //Inventário
                print("Inventário:")
                for i in 0..<personagem.inventario.count{
                    if(personagem.inventario[i] != ""){
                        print(personagem.inventario[i]," x", personagem.inventarioQuantidade[i])
                    }
                }
                break
            default:
                pegarFuturaPosicao = {
                    (x: personagem.posicao.x, y: personagem.posicao.y)
                }
                
                entradaInvalida = true
                break
                
                
            }
            
            
            
            
            if entradaSeparada.count > 1 && !entradaInvalida {
                if let numeroDeCasas = Int(entradaSeparada[1]) {
                    for i in 0..<numeroDeCasas {
                        var posicaoFutura = pegarFuturaPosicao();
                        if (mapaAtual.mapaDesenhadoComObjetos[posicaoFutura.y][posicaoFutura.x].desenho == ".") {
                            personagem.posicao.x = pegarFuturaPosicao().x
                            personagem.posicao.y = pegarFuturaPosicao().y
                            
                            printarGameTeste()
                        } else {
                            print("colisao".red())
                            break
                        }
                        
                        
                        do {
                            usleep(200000)
                        }
                    }
                }
            } else {
                printarGameTeste()
            }
            
            if(personagem.energia <= 0)
            {
                exit(0)
            }
        
        
    }
    
}
