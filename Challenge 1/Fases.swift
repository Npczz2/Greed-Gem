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
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 5, y: 4), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 10,
         tipoDeMinerio: Minerio(desenho: "▰".blue(), nivel: 2),
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
││ . . . . . . . . ┌┬┬┬┐ . . ││ &
 ├┬┬┬┬┬┬┬┬┬┬┬┐ . . ├┼┼┼┤ . . ││ &
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
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 3, y: 3), interacao: {
             print("heitorgdnfjjndfg");
             print("ola vc interagiu com o npc pc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44ola vc interagiu com o npc 44")
             
         })],
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
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 6, y: 4), interacao: {
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
         
         npcs: [Npc(desenho: "Y".cyan2(), posicaoSpawnNPC: (x: 6, y: 4), interacao: {
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
         
         npcs: [Npc(desenho: "⋇".magenta(), posicaoSpawnNPC: (x: 5, y: 4), interacao: {
             print("vc coletou a joia fim de game uau pdijsgfngisdfi colocar finais aqui")
             exit(0)
         })],
         quantidadePedras: 70,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "⋇".magenta(), nivel: 7),
         posicaoSpawnBoneco: (x: 49, y: 4),
         fraseInicial: personagem.nome + " sente uma energia percorrendo seu corpo. Quando olha à frente, observa a lendária jóia, na cor roxa, mais reluzente que qualquer diamante do mundo."
        ),
    
    
    
    
]
