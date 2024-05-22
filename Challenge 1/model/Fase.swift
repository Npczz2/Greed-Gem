//
//  mapas.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 10/05/24.
//

import Foundation





class Fase {
    
    var mapaDesenho: [[Espaco]] = [];
    var posicoesValidas: [(x:Int, y: Int)] = [];
    var posicoesPedras: [(x:Int, y: Int)] = [];
    var posicoesMinerios: [(x:Int, y: Int)] = [];
    let npcs: [Npc];
    var posicoesNpcs: [(x:Int, y: Int)] = [];
    let posicaoSpawnBoneco: (x: Int, y: Int);
    let quantidadeMinerios: Int;
    let quantidadePedras: Int;
    var mapaDesenhadoComObjetos: [[Espaco]] = [];
    let tipoDeMinerio: Minerio;
    let posicaoEscada: (x: Int, y: Int)
    var fraseInicial: String = ""
    
    init (mapaModelo: String, npcs: [Npc], quantidadePedras: Int, quantidadeMinerios: Int, tipoDeMinerio: Minerio, posicaoSpawnBoneco: (x: Int, y: Int), fraseInicial: String) {
        
        let vetor = mapaModelo.split(separator: "&")
        for i in 0..<vetor.count {
            let vetor2 = Array(vetor[i])
            mapaDesenho.append([])
            for j in 0..<vetor2.count {
                mapaDesenho[i].append(Espaco(String(vetor2[j])))
            }
        }
        
        self.npcs = npcs;
        self.tipoDeMinerio = tipoDeMinerio;
        self.quantidadePedras = quantidadePedras;
        self.quantidadeMinerios = quantidadeMinerios;
        self.posicaoSpawnBoneco = posicaoSpawnBoneco;
        self.mapaDesenhadoComObjetos = mapaDesenho;
        self.fraseInicial = fraseInicial;
        personagem.posicao = posicaoSpawnBoneco;
        
        for i in 1..<mapaDesenho.count - 1 {
            for j in 1..<mapaDesenho[0].count - 1 {
                if mapaDesenho[i][j].desenho == "." {
                    posicoesValidas.append((x: j, y: i))
                }
            }
        }
        
        for npc in npcs {
            let randomPosicaoValida = Int.random(in: 0..<posicoesValidas.count)
            let posicaoValida = posicoesValidas[randomPosicaoValida]
            posicoesNpcs.append(npc.posicaoSpawnNPC)
            
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
        
        let randomPosicaoPedra = Int.random(in: 0..<posicoesPedras.count)
        posicaoEscada = posicoesPedras[randomPosicaoPedra]
    }
    
    func desenharObjetosMapa () {
        
        mapaAtual.mapaDesenhadoComObjetos = mapaAtual.mapaDesenho
        self.mapaDesenho[posicaoEscada.y][posicaoEscada.x] = Espaco("⇊".bgBlack(), AlgoInteragivel(index: 0, interacao: {
            faseNumero += 1;
            mapaAtual = todasAsFases[faseNumero]
            textoCompleto = false //Texto ter que ser digitado novamente
            personagem.posicao = todasAsFases[faseNumero].posicaoSpawnBoneco
        }))
        
        for i in 0..<mapaAtual.posicoesPedras.count { //Pedra
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesPedras[i].y][mapaAtual.posicoesPedras[i].x] = Espaco("☗".black2(), AlgoInteragivel(index: i) {
                personagem.energia -= 2
                ganharXP(quantidade: 1)
                mapaAtual.posicoesPedras.remove(at: i)
                personagem.adicionarAoInventario(item: ItemInventario("☗".black2(), quantidade: 1, nivel: 1))
                
            })
            
            
            
        }
        
        for i in 0..<mapaAtual.posicoesMinerios.count { //Minério
            
            
            
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesMinerios[i].y][mapaAtual.posicoesMinerios[i].x] = Espaco(tipoDeMinerio.desenho, AlgoInteragivel(index: i) {
                
                if personagem.inventario[0].nivel >= self.tipoDeMinerio.nivel - 1 {
                    
                    ganharXP(quantidade: 2)
                    mapaAtual.posicoesMinerios.remove(at: i)
                    personagem.adicionarAoInventario(item: ItemInventario(self.tipoDeMinerio.desenho, quantidade: 1, nivel: self.tipoDeMinerio.nivel))
                    
                } else {
                    printarDevagar(texto: "Você precisa de uma picareta de nível \(self.tipoDeMinerio.nivel) ou superior (\(personagem.niveisPicareta[self.tipoDeMinerio.nivel-1]) )", velocidade: 2, completo: false)
                    usleep(1000000)
                }
                personagem.energia -= self.tipoDeMinerio.nivel * 2
            })
            
            
            
            
            
        }
        
        for i in 0..<mapaAtual.posicoesNpcs.count { //NPCs
            mapaAtual.mapaDesenhadoComObjetos[posicoesNpcs[i].y][posicoesNpcs[i].x] = Espaco(npcs[i].desenho, AlgoInteragivel(index: 0) {
                self.npcs[i].interacao()
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


class Minerio {
    
    let nivel: Int;
    let desenho: String;
    
    init(desenho: String, nivel: Int) {
        self.nivel = nivel
        self.desenho = desenho
    }
}

class Npc {
    
    let interacao: (() -> Void);
    let posicaoSpawnNPC: (x: Int, y: Int);
    let desenho: String;
    
    init(desenho: String, posicaoSpawnNPC: (x: Int, y: Int), interacao: @escaping () -> Void) {
        self.interacao = interacao;
        self.posicaoSpawnNPC = posicaoSpawnNPC;
        self.desenho = desenho
    }
}







