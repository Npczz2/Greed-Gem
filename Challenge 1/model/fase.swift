//
//  mapas.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 10/05/24.
//

import Foundation

var todasAsFases: [Fase] = [
    
    Fase(mapaModelo: """
       ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐             &
   ┌┬┬┬┤┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼├┬┬┬┬┬┬┐      &
   ├┼┼┼┼ . . . . . . . . . . . . .├┼┼┼┼┼┼┼┬┐    &
   │ . . . . . . . . . . . . . . . . . . ├┼┤    &
 ┌┬│ . . . . . . ┌┬┬┬┬┬┬┬┐ . . . . . . . . └┬┐  &
 ├┼┘ . . . . . ┌┬┘┼┼┼┼┼┼┼┼┬┐ . . . . . . . . ││ &
││ . . . . . . └─┐         │ . . . . . . . ┌┼┘  &
││ . . . . . . . └─────────┘ . . . . . . . │    &
 ├┬┬┬┐ . . . . . . . . . . . . . . . ┌┬┬┬┬┬┘    &
 └┼┼┼┼┬┐ . . . . . . . . . . . ┌┬┬┬┬┬┼┼┼┼┼┘     &
   └┼┼┼┼┬┬┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┼┼┼┼┼┘           &
               └┬┬┬┬┬┬┬┬┬┘                      &
""",
         
         npcs: [Npc(desenho: "Y".cyan2() , interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadeMinerios: 2,
         quantidadePedras: 30,
         tipoDeMinerio: Minerio(desenho: "◆".yellow(), nivel: 1))
 
]

struct Fase {
    
    var mapaDesenho: [[Espaco]] = [];
    var posicoesValidas: [(x:Int, y: Int)] = [];
    var posicoesPedras: [(x:Int, y: Int)] = [];
    var posicoesMinerios: [(x:Int, y: Int)] = [];
    let npcs: [Npc];
    var posicoesNpcs: [(x:Int, y: Int)] = [];
    let posicaoSpawnBoneco = (x: 44, y: 5);
    let quantidadeMinerios: Int;
    let quantidadePedras: Int;
    var mapaDesenhadoComObjetos: [[Espaco]] = [];
    let tipoDeMinerio: Minerio;
    
    init (mapaModelo: String, npcs: [Npc], quantidadeMinerios: Int, quantidadePedras: Int, tipoDeMinerio: Minerio) {
        
        var vetor = mapaModelo.split(separator: "&")
        for i in 0..<vetor.count {
            var vetor2 = Array(vetor[i])
            mapaDesenho.append([])
            for j in 0..<vetor2.count {
                mapaDesenho[i].append(Espaco(String(vetor2[j])))
            }
        }

        self.npcs = npcs;
        self.tipoDeMinerio = tipoDeMinerio;
        self.quantidadePedras = quantidadePedras;
        self.quantidadeMinerios = quantidadeMinerios;
        mapaDesenhadoComObjetos = mapaDesenho
        
        for i in 1..<mapaDesenho.count - 1 {
            for j in 1..<mapaDesenho[0].count - 1 {
                if mapaDesenho[i][j].desenho == "." {
                    posicoesValidas.append((x: j, y: i))
                }
            }
        }
        
        for _ in 0..<quantidadePedras {
            let randomPosicaoValida = Int.random(in: 0..<posicoesValidas.count)
            let posicaoValida = posicoesValidas[randomPosicaoValida]
            posicoesPedras.append(posicaoValida)
            
            posicoesValidas.remove(at: randomPosicaoValida)
        }
        
        for _ in 0..<quantidadeMinerios {
            let randomPosicaoValida = Int.random(in: 0..<posicoesValidas.count)
            let posicaoValida = posicoesValidas[randomPosicaoValida]
            posicoesMinerios.append(posicaoValida)
            posicoesValidas.remove(at: randomPosicaoValida)
        }
        
        for _ in npcs {
            let randomPosicaoValida = Int.random(in: 0..<posicoesValidas.count)
            let posicaoValida = posicoesValidas[randomPosicaoValida]
            posicoesNpcs.append(posicaoValida)
            posicoesValidas.remove(at: randomPosicaoValida)
            
            
        }
        
    }
    
    func desenharObjetosMapa () {
        mapaAtual.mapaDesenhadoComObjetos = mapaAtual.mapaDesenho
        for i in 0..<mapaAtual.posicoesPedras.count {
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesPedras[i].y][mapaAtual.posicoesPedras[i].x] = Espaco("☗".white(), AlgoInteragivel(index: i) {
                energia -= 2
                mapaAtual.posicoesPedras.remove(at: i)
                
                for i in 0..<inventario.count{
                    if(inventario[i] == ""){
                        inventario[i] = "☗"
                        inventarioQuantidade[i] += 1
                        
                        break
                    }else if(inventario[i] == "☗"){
                        inventarioQuantidade[i] += 1
                        
                        break
                    }
                }
            })
           
                
            
        }
        
        for i in 0..<mapaAtual.posicoesMinerios.count {
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesMinerios[i].y][mapaAtual.posicoesMinerios[i].x] = Espaco(tipoDeMinerio.desenho, AlgoInteragivel(index: i) {
                energia -= 4
                mapaAtual.posicoesMinerios.remove(at: i)
                
                for i in 0..<inventario.count{
                    if(inventario[i] == ""){
                        inventario[i] = tipoDeMinerio.desenho
                        inventarioQuantidade[i] += 1
                        
                        break
                    }else if(inventario[i] == tipoDeMinerio.desenho){
                        inventarioQuantidade[i] += 1
                        
                        break
                    }
                }

            })
        }
        
        for i in 0..<mapaAtual.posicoesNpcs.count {
            mapaAtual.mapaDesenhadoComObjetos[posicoesNpcs[i].y][posicoesNpcs[i].x] = Espaco(npcs[i].desenho, AlgoInteragivel(index: 0) {
                npcs[i].interacao()
            })
        }
        
        
    }
}


class AlgoInteragivel {
    
    let interacao: (() -> Void);
    let index: Int;
    
    init(index: Int, interacao: @escaping () -> Void) {
        self.interacao = interacao
        self.index = index
    }
    
}

struct Espaco {
    var desenho: String;
    let algoInteragivel: AlgoInteragivel?;
    
    init(_ desenho: String, _ algoInteragivel: AlgoInteragivel) {
        self.desenho = desenho;
        self.algoInteragivel = algoInteragivel;
    }
    
    init(_ desenho: String) {
        self.desenho = desenho;
        self.algoInteragivel = nil;
    }
}

class Item {
    let desenho: String;
    
    init(desenho: String) {
        self.desenho = desenho
    }
    
}

class Minerio: Item {
    
    let nivel: Int;
    
    init(desenho: String, nivel: Int) {
        self.nivel = nivel
        super.init(desenho: desenho)
    }
}

class Npc: Item {
    
    let interacao: (() -> Void);
    
    init(desenho: String, interacao: @escaping () -> Void) {
        self.interacao = interacao
        super.init(desenho: desenho)
    }
}







