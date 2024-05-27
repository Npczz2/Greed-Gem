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
    var inventario: [ItemInventario] = []
    var inventarioDesenhado:[[[String]]] = []
    let niveisPicareta: [String] = ["༒".yellow(), "༒".black2(), "༒".white(), "༒".yellow2(), "༒".green2(), "༒".cyan2(), "༒".red()]
    var pontosBondade: Int = 0
    var nome: String = "";
    var nivel: Int = 1;
    var xp: Int = 0;
    var xpNecessario: Int = 4;
    
    
    init() {
        inventario.append(ItemInventario("༒".yellow(), quantidade: 1, nivel: 0) {
 
            if let quantidadeMinerios = self.buscaMinerio(nivel: self.inventario[0].nivel + 1), quantidadeMinerios.quantidade > 4 {
                
                self.inventario[0].nivel += 1;
                self.inventario[0].desenho = self.niveisPicareta[self.inventario[0].nivel]
                self.removerDoInventario(item: (desenho: self.inventario[quantidadeMinerios.index].desenho, quantidade: 5))
                self.desenharInventario()
           
                
            }
            
            
            
        })
        inventario.append(ItemInventario("◍".yellow(), quantidade: 5, nivel: 0) {
            recuperarEnergia(quantidadeEnergia: 10)
            self.removerDoInventario(item: (desenho: "◍".yellow(), quantidade: 1)) // arruma dps
        })
        inventario.append(ItemInventario("❦".red(), quantidade: 3, nivel: 0) {
            recuperarEnergia(quantidadeEnergia: 8)
            self.removerDoInventario(item: (desenho: "❦".red(), quantidade: 1))
        })
        inventario.append(ItemInventario("∝".cyan(), quantidade: 5, nivel: 0) {
            recuperarEnergia(quantidadeEnergia: 5)
            self.removerDoInventario(item: (desenho: "∝".cyan(), quantidade: 1))
        })
        

    }
    
    
    
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
                    desenharInventario()
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
                
            case "HELP":
                chamarTutorial(completo: false);
                return
            
                
            case "I":
                
                if entradaSeparada.count > 1 {
                    if let indiceInventario = Int(entradaSeparada[1]), let interacao = inventario[indiceInventario - 1].interacao {
                        interacao()
                        desenharInventario()
                        
                    }
                }
                
                
                printarGameTeste()
                return
                
            default:
                pegarFuturaPosicao = {
                    (x: personagem.posicao.x, y: personagem.posicao.y)
                }
                
                entradaInvalida = true
                break
                
                
            }
        
            printarGameTeste()
            

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
            }
            
            if(personagem.energia <= 0)
            {
                printarDialogo("\(personagem.nome) trabalha até ficar esgotado e morre de fadiga.")
                print(derrotaGrande)
                exit(0)
            }
        
        
    }
    
    
    func adicionarAoInventario(item: ItemInventario) {

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
    
    func buscaMinerio(nivel: Int) -> (index: Int, quantidade: Int)? {
        
        for i in 0..<inventario.count {
            if inventario[i].nivel == nivel {
                return (index: i, quantidade: inventario[i].quantidade)
            }
        }
        
        return nil;
        
    }
    
    func buscarIndice(desenho: String) -> Int? {

        for i in 0..<inventario.count {
            if inventario[i].desenho == desenho {
                return i;
            }
        }

        return nil;

    }
    
    func desenharInventario() {
      
        inventarioDesenhado.removeAll()
        
        for i in 0..<self.inventario.count {
            
            inventarioDesenhado.append(desenhoCaixa(index: i, desenho: personagem.inventario[i].desenho,
                                                  quantidade: personagem.inventario[i].quantidade,
                                                  interagivel: personagem.inventario[i].interacao != nil))
            
        }
    }
    
}

struct ItemInventario {
    
    var desenho: String;
    var quantidade: Int;
    var nivel: Int;
    var interacao: (() -> Void)? = nil
    
    init(_ desenho: String, quantidade: Int, nivel: Int, _ interacao: (() -> Void)?) {
        self.desenho = desenho
        self.quantidade = quantidade
        self.nivel = nivel
        self.interacao = interacao
    }
    
    init(_ desenho: String, quantidade: Int, nivel: Int) {
        self.desenho = desenho
        self.quantidade = quantidade
        self.nivel = nivel
        
    }
}

func recuperarEnergia(quantidadeEnergia: Int){
    var energiaDif: Int = 100 - personagem.energia
    if(energiaDif <= quantidadeEnergia){
        personagem.energia += energiaDif
    }else{
        personagem.energia += quantidadeEnergia
    }
}
