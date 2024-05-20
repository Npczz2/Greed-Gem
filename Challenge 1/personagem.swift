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
    var inventario: [(desenho: String, quantidade: Int, interacao: (() -> Void)?)] = [
        ("T".green2(), 1, nil)
    ];
    
    var nome: String = "";
    var nivel: Int = 1;
    var xp: Int = 0;
    var xpNecessario: Int = 4;
    
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
                            personagem.posicao = posicaoFutura
                            
                            printarGameTeste()
                        } else {
                            break
                        }
                        
                        usleep(200000)
                        
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
    
    func adicionarAoInventario(item: (desenho: String, quantidade: Int, interacao: (() -> Void)?)) {

        if let itemExistente = buscarIndice(desenho: item.desenho) {

            inventario[itemExistente].quantidade += item.quantidade

        } else {
        inventario.append(item)

        }

    }

    func removerDoInventario(item: (desenho: String, quantidade: Int)) {

        if let itemExistente = buscarIndice(desenho: item.desenho) {

            if (inventario[itemExistente].quantidade > item.quantidade) {
                inventario[itemExistente].quantidade -= item.quantidade
            } else {
                inventario.remove(at: itemExistente)
            }


        }

    }
    
    func buscarIndice(desenho: String) -> Int? {

        for i in 0..<inventario.count {
            if inventario[i].desenho == desenho {
                return i;
            }
        }

        return nil;

    }
    
}
