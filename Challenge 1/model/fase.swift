//
//  mapas.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 10/05/24.
//

import Foundation

var faseNumero: Int = 0;
var todasAsFases: [Fase] = [
    
    Fase(mapaModelo: """
        ├┐  . .  ┌┤           &
         ├┐ . . ┌┤            &
  ┌┬┬┬┬┬┬┼┤ . . ├┼┬┬┬┬┬┬┬┐    &
  ├┼┼┼┼┼┼┼┤ . . ├┼┼┼┼┼┼┼┼┤    &
  │ . . . . . . . . . .  ├┬┐  &
 ┌┤ . . . . . . . . . .  ├┼┤  &
│├┤ . . . . . . . . . . .  ││ &
││  . . . . . . . . . . .  ││ &
 ├┐ . . . . . . . . . .  ┌┬┤  &
 ├┤ . . . . . . . . . .  ├┼┤  &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤    &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 19, y: 5), interacao: {
             printarDevagar(texto: "Wallis:  Não! não! Não entre, novato!\nWallis: Eu sei que você está pensando na jóia, porém esta caverna esconde diversos perigos. As pessoas estão ficando loucas lá dentro. Inclusive eu. Eu perdi tudo, tudo que tinha…   \n" + personagem.nome + ": O que aconteceu com você, meu senhor?\nWallis: Me roubaram… Toda a minha comida, minhas roupas, meus equipamentos. É um milagre eu ainda estar de pé aqui. As pessoas dentro da caverna são sujas… Se passam por boas pessoas mas estão todas cegas pela jóia.\n\n", velocidade: 1, completo: false)
                          
             printarEscolhas(escolhas: ["Eu não me importo, eu preciso dessa jóia.", "Eu vou me cuidar. Obrigado pelo aviso, senhor."])
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "◆".blue(), nivel: 1),
         posicaoSpawnBoneco: (x: 13, y: 1),
         fraseInicial: personagem.nome + " adentra a caverna e começa a explorar seu interior…\n"
                    ),
    
    Fase(mapaModelo: """
  ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐                   &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
  │ . . . . . . . ├┬┐                 &
 ┌┤ . . . . . . . ├┼┼┬┬┬┬┬┬┬┬┬┬┬┬┬┐   &
│├┤ . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
││  . . . . . . . . . . . . . . . ││  &
 ├┐ . . . . . . . ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤   &
 ├┤ . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤                   &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
""",
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 5, y: 4), interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "▰".blue(), nivel: 3),
         posicaoSpawnBoneco: (x: 5, y: 2),
         fraseInicial: personagem.nome + " desce mais um nível na caverna e observa um homem minerando, desatento com seus pertences."
                    ),
    
    Fase(mapaModelo: """
 ┌┬┬┬┬┬┬┬┬┬┬┬┐                  &
 ├┼┼┼┼┼┼┼┼┼┼┼┤                  &
││ . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┬┬┐    &
││ . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
││ . . . . . . . . . . . . ├┬┐  &
││ . . . . . . . . . . . . ├┼┤  &
││ . . . . . . . . . . . . . ││ &
 ├┬┬┬┬┬┬┬┬┬┬┬┐ . . . . . . . ││ &
 ├┼┼┼┼┼┼┼┼┼┼┼┤ . . . . . . . ││ &
             │ . . . . . . ┌┬┤  &
             ├┬┬┬┬┬┬┬┬┬┬┬┬┬┼┼┤  &
             ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 7, y: 3), interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "▮".yellow(), nivel: 4),
         posicaoSpawnBoneco: (x: 6, y: 3),
         fraseInicial: personagem.nome + " continua sua exploração e se depara com dois homens brigando."
                    ),
    
    Fase(mapaModelo: """
 ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐              &
 ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤              &
││ . . . . . . . . . . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┐  &
││ . . . . . . . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┤  &
││ . . . . . . . . . . . . . . . . . . . . ││ &
 ├┬┬┬┬┬┬┬┬┬┬┬┐ . . . . . . . . ┌┬┬┬┬┬┬┬┬┬┬┬┤  &
 ├┼┼┼┼┼┼┼┼┼┼┼┤ . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┤  &
             │ . . . . . . . . │              &
             │ . . . . . . . . │              &
             ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤              &
             ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤              &
""",
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 3, y: 3), interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "◆".green(), nivel: 5),
         posicaoSpawnBoneco: (x: 8, y: 2),
         fraseInicial: "Depois da situação caótica, " + personagem.nome + " até desconfia do silêncio desse andar…"
                    ),
    
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
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 6, y: 4), interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "✦".cyan2(), nivel: 6),
         posicaoSpawnBoneco: (x: 44, y: 5),
         fraseInicial: personagem.nome + " desce mais um andar e avista Stan novamente…"
                    ),
    
    Fase(mapaModelo: """
              ┌┬┬┬┬┬┬┬┬┬┬┐                             &
              ├┼┼┼┼┼┼┼┼┼┼┤                             &
 ┌┬┬┬┬┬┬┬┬┬┬┬┬┤ . . . .  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐          &
┌┼┼┼┼┼┼┼┼┼┼┼┼┼┤ . . . .  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤          &
││  . . . . . . . . . . . . . . . . . . . . ├┬┬┬┬┬┬┐   &
││  . . . . ┌┬┐ . . . . . . . . . . . . . . ├┼┼┼┼┼┼┼┐  &
 └┬┬┬┬┬┬┐ . . . . . . . . . . . . . ┌┬┬┬┐ . . . . . ││ &
     └┼┼│ . . . . ┌┬┬┬┬┬┬┬┬┬┐ . . . ├┼┼┼┤ . . . . . ││ &
       ││ . . . . ├┼┼┼┼┼┼┼┼┼┤ . . . . . . . . . . . ││ &
       └├┬┬┬┬┬┬┬┬┬┤         ├┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┬┬┬┘ &
        └┼┼┼┼┼┼┼┼┼┘         └┼┼┼┼┼┤ . . . . ├┼┼┼┼┼┼┼┘  &
                                  ├┬┬┬┬┬┬┬┬┬┤          &
                                  └┼┼┼┼┼┼┼┼┼┘          &
""",
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 6, y: 4), interacao: {
            print("heitorgdnfjjndfg");
            print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
            
        })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "●".red(), nivel: 7),
         posicaoSpawnBoneco: (x: 17, y: 2),
         fraseInicial: personagem.nome + " avança na caverna e se espanta com o número de pessoas perdidas na caverna. Ele encontra duas pessoas debilitadas."
                    ),
    
    Fase(mapaModelo: """
                     ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐              &
        ┌┬┬┬┬┬┬┬┬┬┬┬┬┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤              &
  ┌┬┬┬┬┬┤┼┼┼┼┼┼┼┼┼┼┼┼┤. . . . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┐  &
  ├┼┼┼┼┼┤ . . . . . . . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┤  &
 ││ . . . . . . . . . . . . . . . . . . . . . . . ││ &
 ││ . . . . . . . . . . . . . . . . . . . . . . . ││ &
  ├┬┬┬┬┬┐ . . . . . . . . . . . . . . ┌┬┬┬┬┬┬┬┬┬┬┬┤  &
  ├┼┼┼┼┼┼┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┼┼┼┼┼┼┼┼┼┼┼┼┤  &
            ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤           &
""",
         
         npcs: [Npc(desenho: "⋇".magenta(), posicaoSpawnNPC: (x: 5, y: 4), interacao: {
            print("vc coletou a joia fim de game uau pdijsgfngisdfi colocar finais aqui")
             exit(0)
        })],
         quantidadePedras: 70,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "⋇".magenta(), nivel: 8),
         posicaoSpawnBoneco: (x: 49, y: 4),
         fraseInicial: personagem.nome + " sente uma energia percorrendo seu corpo. Quando olha à frente, observa a lendária jóia, na cor roxa, mais reluzente que qualquer diamante do mundo."
                    ),
    

    
 
]

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
        
        for i in 0..<mapaAtual.posicoesPedras.count {
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesPedras[i].y][mapaAtual.posicoesPedras[i].x] = Espaco("☗".white(), AlgoInteragivel(index: i) {
                personagem.energia -= 2
                ganharXP(quantidade: 1)
                mapaAtual.posicoesPedras.remove(at: i)
                personagem.adicionarAoInventario(item: ItemInventario("☗".white(), quantidade: 1, nivel: 1))
                
//                for i in 0..<inventario.count{
//                    if(inventario[i] == ""){
//                        inventario[i] = "☗"
//                        inventarioQuantidade[i] += 1
//                        
//                        break
//                    }else if(inventario[i] == "☗"){
//                        inventarioQuantidade[i] += 1
//                        
//                        break
//                    }
//                }
            })
           
                
            
        }
        
        for i in 0..<mapaAtual.posicoesMinerios.count {
            mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesMinerios[i].y][mapaAtual.posicoesMinerios[i].x] = Espaco(tipoDeMinerio.desenho, AlgoInteragivel(index: i) {
                personagem.energia -= 4
                ganharXP(quantidade: 2)
                mapaAtual.posicoesMinerios.remove(at: i)
                personagem.adicionarAoInventario(item: ItemInventario(self.tipoDeMinerio.desenho, quantidade: 1, nivel: self.tipoDeMinerio.nivel))
                
//                for i in 0..<inventario.count{
//                    if(inventario[i] == ""){
//                        inventario[i] = self.tipoDeMinerio.desenho
//                        inventarioQuantidade[i] += 1
//                        
//                        break
//                    }else if(inventario[i] == self.tipoDeMinerio.desenho){
//                        inventarioQuantidade[i] += 1
//                        
//                        break
//                    }
//                }

            })
        }
        
        for i in 0..<mapaAtual.posicoesNpcs.count {
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
    let posicaoSpawnNPC: (x: Int, y: Int);
    init(desenho: String, posicaoSpawnNPC: (x: Int, y: Int), interacao: @escaping () -> Void) {
        self.interacao = interacao;
        self.posicaoSpawnNPC = posicaoSpawnNPC;
        super.init(desenho: desenho)
    }
}







