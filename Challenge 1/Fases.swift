//
//  Fases.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 22/05/24.
//

import Foundation


var faseNumero: Int = 0;
var todasAsFases: [Fase] = [
    
    Fase(mapaModelo: """
        ├┐  . .  ┌┤          &
         ├┐ . . ┌┤           &
  ┌┬┬┬┬┬┬┼┤ . . ├┼┬┬┬┬┬┬┐    &
  ├┼┼┼┼┼┼┼┤ . . ├┼┼┼┼┼┼┼┤    &
  │ . . . . . . . . . . ├┬┐  &
 ┌┤ . . . . . . . . . . ├┼┤  &
│├┤ . . . . . . . . . . . ││ &
││  . . . . . . . . . . . ││ &
 ├┐ . . . . . . . . . . ┌┬┤  &
 ├┤ . . . . . . . . . . ├┼┤  &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤    &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "W".magenta(), posicaoSpawnNPC: (x: 19, y: 5), interacao: {
             
             printarDevagar(texto: "\nWallis: Não! não! Não entre, novato!\nWallis: Eu sei que você está pensando na jóia, porém esta caverna esconde diversos perigos. As pessoas estão ficando loucas lá dentro. Inclusive eu. Eu perdi tudo, tudo que tinha… ▼\n", completo: false)
         
             
            _ = readLine()
             
             printarDevagar(texto: personagem.nome + ": O que aconteceu com você, meu senhor? ▼\n", completo: false)
             
             _ = readLine()
        
             
            printarDevagar(texto: "Wallis: Me roubaram… Toda a minha comida, minhas roupas, meus equipamentos. É um milagre eu ainda estar de pé aqui. As pessoas dentro da caverna são sujas… Se passam por boas pessoas mas estão todas cegas pela jóia. ▼\n", completo: false)
             
             _ = readLine()
             
             
             var escolhaValida = false
             
             repeat {
                 
                 printarEscolhas(escolhas: ["Eu não me importo, eu preciso dessa jóia.", "Eu vou me cuidar. Obrigado pelo aviso, senhor."])
                 
                 if let escolha = readLine() {
                     
                     switch escolha {
                        
                     case "1":
                         printarDevagar(texto: "\nWallis: Jovem, você vai se arrepender desta decisão. Eu perdi tudo… E você terá um fim trágico igual a mim. ▼", completo: false);
                         _ = readLine()
                         escolhaValida.toggle()
                         break;
                     case "2":
                         printarDevagar(texto: "\nWallis: Você é bom… Não deixe a caverna te corromper… ▼", completo: false);
                         _ = readLine()
                         escolhaValida.toggle()
                         break;
                     default:
                         print("Escolha inválida, digite novamente")
                         break;
                         
                     }
                     
                 }
                 
             } while(!escolhaValida)
              
                 
           
                 
                 
                 
                 
                 
           
          
             
             
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "◆".blue(), nivel: 1),
         posicaoSpawnBoneco: (x: 13, y: 1),
         fraseInicial: personagem.nome + " adentra a caverna e começa a explorar seu interior…\n"
        ),
    
    Fase(mapaModelo: """
      ┌┬┬┬┬┬┬┬┬┬┬┬┐                   &
  ┌┬┬┬┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
  ├┼┼┼┤ . . . . . ├┬┐                 &
 ┌┤ . . . . . . . ├┼┼┬┬┬┬┬┬┬┬┬┬┬┬┬┐   &
│├┤ . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
││  . . . . . . . . . . . . . . . ││  &
 ├┐ . . . . . . . ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤   &
 ├┤ . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤                   &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
""",
         
         npcs: [Npc(desenho: "A".magenta(), posicaoSpawnNPC: (x: 33, y: 5), interacao: {
             printarEscolhas(escolhas: ["Furtar a mochila", "Avisar o homem sobre a mochila"])
             
             
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "▰".white(), nivel: 2),
         posicaoSpawnBoneco: (x: 5, y: 3),
         fraseInicial: personagem.nome + " desce mais um nível na caverna e observa um homem minerando, desatento com seus pertences."
        ),
    
    Fase(mapaModelo: """
 ┌┬┬┬┬┬┬┬┬┬┬┬┐                  &
 ├┼┼┼┼┼┼┼┼┼┼┼┤                  &
││ . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┬┬┐    &
││ . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
││ . . . . . . . . . . . . ├┬┐  &
││ . . . . . . . . . . . . ├┼┤  &
││ . . . . . . . . ┌┬┬┬┐ . . ││ &
 ├┬┬┬┬┬┬┬┬┬┬┬┐ . . ├┼┼┼┤ . . ││ &
 ├┼┼┼┼┼┼┼┼┼┼┼┤ . . . . . . . ││ &
             │ . . . . . . ┌┬┤  &
             ├┬┬┬┬┬┬┬┬┬┬┬┬┬┼┼┤  &
             ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "S".magenta(), posicaoSpawnNPC: (x: 22, y: 5), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         }),Npc(desenho: "E".magenta(), posicaoSpawnNPC: (x: 24, y: 5), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "▮".yellow(), nivel: 3),
         posicaoSpawnBoneco: (x: 6, y: 3),
         fraseInicial: personagem.nome + " continua sua exploração e se depara com dois homens brigando."
        ),
    
    Fase(mapaModelo: """
 ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐                &
 ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤                &
││ . . . . . . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┐    &
││ . . . . . . . . . . ├┼├┼┼┼┼┼┼┼┼┼┤    &
││ . ┌┬┬┬┐ . . . . . . . . . . . . ││   &
 ├┬┬┬┼┼┼┼┼┬┬┬┐ . . . . . ┌┬┬┬┬┬┬┬┬┬┤    &
 ├┼┼┼┼┼┼┼┼┼┼┼┤ . . . . . ├┼┼┼┼┼┼┼┼┼┤    &
             ├┬┬┬┐ . . . │              &
             ├┼┼┼┤ . . . │              &
                 ├┬┬┬┬┬┬┬┤              &
                 ├┼┼┼┼┼┼┼┤              &
""",
         
         npcs: [],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "◆".green(), nivel: 4),
         posicaoSpawnBoneco: (x: 8, y: 2),
         fraseInicial: "Depois da situação caótica, " + personagem.nome + " até desconfia do silêncio desse andar…"
        ),
    
    Fase(mapaModelo: """
       ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐             &
   ┌┬┬┬┤┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┬┬┬┬┬┬┐      &
   ├┼┼┼┤ . . . . . . . . . . . . . ├┼┼┼┼┼┼┬┐    &
   │ . . . . . . . . . . . . . . . . . . ├┼┤    &
 ┌┬│ . . . . . . ┌┬┬┬┬┬┬┬┐ . . . . . . . . └┬┐  &
 ├┼┘ . . . . . ┌┬┼┼┼┼┼┼┼┼┼┬┐ . . . . . . . . ││ &
││ . . . . . . └─┐         │ . . . . . . . ┌┬┘  &
││ . . . . . . . └─────────┘ . . . . . . . │    &
 ├┬┬┬┐ . . . . . . . . . . . . . . . ┌┬┬┬┬┬┘    &
 └┼┼┼┼┬┐ . . . . . . . . . . . ┌┬┬┬┬┬┼┼┼┼┼┘     &
   └┼┼┼┼┬┬┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┼┼┼┼┼┘           &
      └┼┼┼┼┼┼┼┼┼┬┬┬┬┬┬┬┬┬┼┼┼┼┼┼┼┘               &
            └┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┘                   &
""",
         
         npcs: [Npc(desenho: "S".magenta(), posicaoSpawnNPC: (x: 30, y: 5), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "✦".cyan2(), nivel: 5),
         posicaoSpawnBoneco: (x: 44, y: 5),
         fraseInicial: personagem.nome + " desce mais um andar e avista Stan novamente…"
        ),
    
    Fase(mapaModelo: """
              ┌┬┬┬┬┬┬┬┬┬┐                              &
              ├┼┼┼┼┼┼┼┼┼┤                              &
  ┌┬┬┬┬┬┬┬┬┬┬┬┤ . . . . ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐          &
 ┌┼┼┼┼┼┼┼┼┼┼┼┼┤ . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤          &
 ││ . . . . . . . . . . . . . . . . . . . . ├┬┬┬┬┬┬┐   &
 ││ . . . . ┌┬┐ . . . . . . . . . . . . . . ├┼┼┼┼┼┼┼┐  &
 └┼┬┬┬┬┬┐ . . . . . . . . . . . . . ┌┬┬┬┐ . . . . . ││ &
     └┼┼│ . . . . ┌┬┬┬┬┬┬┬┬┬┐ . . . ├┼┼┼┤ . . . . . ││ &
       ││ . . . . ├┼┼┼┼┼┼┼┼┼┤ . . . . . . . . . . . ││ &
       └├┬┬┬┬┬┬┬┬┬┤         ├┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┬┬┘  &
        └┼┼┼┼┼┼┼┼┼┘         └┼┼┼┼┼┤ . . . . ├┼┼┼┼┼┼┘   &
                                  ├┬┬┬┬┬┬┬┬┬┤          &
                                  └┼┼┼┼┼┼┼┼┼┘          &
""",
         
         npcs: [Npc(desenho: "B".magenta(), posicaoSpawnNPC: (x: 17, y: 8), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         }), Npc(desenho: "C".magenta(), posicaoSpawnNPC: (x: 39, y: 10), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "●".red(), nivel: 6),
         posicaoSpawnBoneco: (x: 17, y: 2),
         fraseInicial: personagem.nome + " avança na caverna e se espanta com o número de pessoas perdidas na caverna. Ele encontra duas pessoas debilitadas."
        ),
    
    Fase(mapaModelo: """
                     ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐          &
        ┌┬┬┬┬┬┬┐   ┌┬┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤          &
  ┌┬┬┬┬┬┤┼┼┼┼┼┼┼┬┬┬┼┼┤. . . . . . . . . . ├┬┬┬┬┬┬┬┐  &
  ├┼┼┼┼┼┤ . . . ├┼┤ . . . ┌┬┐ . . . . . . ├┼┼┼┼┼┼┼┤  &
 ││ . . . . . . ├┼┤ . . . ├┼┤ . . . . . . . . . . ││ &
 ││ . . . . . . . . . . . ├┼┼┬┐ . . . . . . . . . ││ &
  ├┬┬┬┬┬┐ . . . . . . . . ├┼┼┼┤ . . . ┌┬┬┬┬┬┬┬┬┬┬┬┤  &
  ├┼┼┼┼┼┼┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┼┼┼┼┼┬┬┬┬┬┬┬┼┼┼┼┼┼┼┼┼┼┼┼┤  &
            ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤           &
""",
         
         npcs: [],
         quantidadePedras: 70,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "⋇".magenta(), nivel: 7),
         posicaoSpawnBoneco: (x: 49, y: 4),
         fraseInicial: personagem.nome + " sente uma energia percorrendo seu corpo. Quando olha à frente, observa a lendária jóia, na cor roxa, mais reluzente que qualquer diamante do mundo."
        ),
    
    
    
    
]
