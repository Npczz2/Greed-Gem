//
//  Fases.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 22/05/24.
//

import Foundation

var escolheuStan: Bool = true;
var faseNumero: Int = 0;
var todasAsFases: [Fase] = [
    
    Fase(mapaModelo: """
        ├┐  . .  ┌┤          &
         ├┐ . . ┌┤           &
  ┌┬┬┬┬┬┬┼┤ . . ├┼┬┬┬┬┬┬┐    &
  ├┼┼┼┼┼┼┼┤ . . ├┼┼┼┼┼┼┼┤    &
  │ . . . . . . . . . . ├┬┐  &
 ┌┤ . . . . . . .   . . ├┼┤  &
│├┤ . . . . . . . . . . . ││ &
││  . . . . . . . . . . . ││ &
 ├┐ . . . . . . . . . . ┌┬┤  &
 ├┤ . . . . . . . . . . ├┼┤  &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤    &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "W".magenta(), posicaoSpawnNPC: (x: 19, y: 5), interacao: {
             
             wallisInteracao();
         })],
         quantidadePedras: 8,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "◆".blue(), nivel: 1),
         posicaoSpawnBoneco: (x: 13, y: 1),
         fraseInicial: personagem.nome + " adentra a caverna e começa a explorar seu interior…\n",
         ultimaFase: false
        ),
    
    Fase(mapaModelo: """
      ┌┬┬┬┬┬┬┬┬┬┬┬┐                   &
  ┌┬┬┬┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
  ├┼┼┼┤ . . . . . ├┬┐                 &
 ┌┤ . . . . . . . ├┼┼┬┬┬┬┬┬┬┬┬┬┬┬┬┐   &
│├┤ . . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
││  . . . . . . . . . . . . . .   ││  &
 ├┐ . . . . . . . ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤   &
 ├┤ . . . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤   &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤                   &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤                   &
""",
         
         npcs: [Npc(desenho: "A".magenta(), posicaoSpawnNPC: (x: 33, y: 5), interacao: {
             
             antonyInteracao();
             
         })],
         quantidadePedras: 5,
         quantidadeMinerios: 7,
         tipoDeMinerio: Minerio(desenho: "▰".white(), nivel: 2),
         posicaoSpawnBoneco: (x: 5, y: 3),
         fraseInicial: personagem.nome + " desce mais um nível na caverna e observa um homem minerando, desatento com seus pertences.",
         ultimaFase: false
        ),
    
    Fase(mapaModelo: """
 ┌┬┬┬┬┬┬┬┬┬┬┬┐                  &
 ├┼┼┼┼┼┼┼┼┼┼┼┤                  &
││ . . . . . ├┬┬┬┬┬┬┬┬┬┬┬┬┬┐    &
││ . . . . . ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
││ . . . . . . . . . . . . ├┬┐  &
││ . . . . . . . . .     . ├┼┤  &
││ . . . . . . . . ┌┬┬┬┐ . . ││ &
 ├┬┬┬┬┬┬┬┬┬┬┬┐ . . ├┼┼┼┤ . . ││ &
 ├┼┼┼┼┼┼┼┼┼┼┼┤ . . . . . . . ││ &
             │ . . . . . . ┌┬┤  &
             ├┬┬┬┬┬┬┬┬┬┬┬┬┬┼┼┤  &
             ├┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "S".magenta(), posicaoSpawnNPC: (x: 22, y: 5), interacao: {
             
             stanElliotInteracao();
             
         }),Npc(desenho: "E".magenta(), posicaoSpawnNPC: (x: 24, y: 5), interacao: {
             
             stanElliotInteracao();
             
         })],
         quantidadePedras: 9,
         quantidadeMinerios: 6,
         tipoDeMinerio: Minerio(desenho: "▮".yellow2(), nivel: 3),
         posicaoSpawnBoneco: (x: 6, y: 3),
         fraseInicial: personagem.nome + " continua sua exploração e se depara com dois homens brigando.",
         ultimaFase: false
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
         quantidadePedras: 3,
         quantidadeMinerios: 9,
         tipoDeMinerio: Minerio(desenho: "◆".green2(), nivel: 4),
         posicaoSpawnBoneco: (x: 8, y: 2),
         fraseInicial: "Depois da situação caótica, " + personagem.nome + " até desconfia do silêncio desse andar…",
         ultimaFase: false
        ),
    
    Fase(mapaModelo: """
       ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐             &
   ┌┬┬┬┤┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┬┬┬┬┬┬┐      &
   ├┼┼┼┤ . . . . . . . . . . . . . ├┼┼┼┼┼┼┬┐    &
   │ . . . . . . . . . . . . . . . . . . ├┼┤    &
 ┌┬│ . . . . . . ┌┬┬┬┬┬┬┬┐ . . . . . . . . └┬┐  &
 ├┼┘ . . . . . ┌┬┼┼┼┼┼┼┼┼┼┬┐   . . . . . . . ││ &
││ . . . . . . └─┐         │ . . . . . . . ┌┬┘  &
││ . . . . . . . └─────────┘ . . . . . . . │    &
 ├┬┬┬┐ . . . . . . . . . . . . . . . ┌┬┬┬┬┬┘    &
 └┼┼┼┼┬┐ . . . . . . . . . . . ┌┬┬┬┬┬┼┼┼┼┼┘     &
   └┼┼┼┼┬┬┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┼┼┼┼┼┘           &
      └┼┼┼┼┼┼┼┼┼┬┬┬┬┬┬┬┬┬┼┼┼┼┼┼┼┘               &
            └┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┘                   &
""",
         
         npcs: [Npc(desenho: "S".magenta(), posicaoSpawnNPC: (x: 30, y: 5), interacao: {
             
             reencontroStanInteracao();
         })],
         quantidadePedras: 12,
         quantidadeMinerios: 6,
         tipoDeMinerio: Minerio(desenho: "✦".cyan2(), nivel: 5),
         posicaoSpawnBoneco: (x: 44, y: 5),
         fraseInicial: personagem.nome + " desce mais um andar e avista Stan novamente…",
         ultimaFase: false
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
       ││ . . .   ├┼┼┼┼┼┼┼┼┼┤ . . . . . . . . . . . ││ &
       └├┬┬┬┬┬┬┬┬┬┤         ├┬┬┬┬┬┐ . . . . ┌┬┬┬┬┬┬┬┘  &
        └┼┼┼┼┼┼┼┼┼┘         └┼┼┼┼┼┤ .   . . ├┼┼┼┼┼┼┘   &
                                  ├┬┬┬┬┬┬┬┬┬┤          &
                                  └┼┼┼┼┼┼┼┼┼┘          &
""",
         
         npcs: [Npc(desenho: "B".magenta(), posicaoSpawnNPC: (x: 17, y: 8), interacao: {
             printarDialogo("Bryan: Por favor… Tire essa pedra de cima de mim, não consigo me mexer. Por favor, me salve.");
             
             bryanInteracao();

         }), Npc(desenho: "C".magenta(), posicaoSpawnNPC: (x: 39, y: 10), interacao: {
             
             carlInteracao();
             
         })],
         quantidadePedras: 15,
         quantidadeMinerios: 5,
         tipoDeMinerio: Minerio(desenho: "●".red(), nivel: 6),
         posicaoSpawnBoneco: (x: 17, y: 2),
         fraseInicial: personagem.nome + " avança na caverna e se espanta com o número de pessoas perdidas na caverna. Ele encontra duas pessoas debilitadas.",
         ultimaFase: false
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
         
         npcs: [Npc(desenho: "⋇".magenta(), posicaoSpawnNPC: (x: 5, y: 4) ){
             
             if(personagem.inventario[0].nivel < mapaAtual.tipoDeMinerio.nivel - 1) {
                 
                 printarDialogo("\(personagem.nome) tenta usar sua picareta para extrair a jóia e finalmente levá-la para casa. Porém, ao tentar arrancar a jóia que ficava fixa em uma pedra extremamente dura, ele acaba forçando demais pelo nível de sua picareta ser insuficiente e acaba quebrando a jóia.");
                 print(derrotaGrande);
                 
             } else {
                 
                 personagem.adicionarAoInventario(item: ItemInventario("⋇".magenta(), quantidade: 1, nivel: 7));
                 personagem.desenharInventario();
                 printarGameTeste();
                 
                 if personagem.pontosBondade < 0 {
                     
                     printarDialogo("Depois de sua longa jornada, \(personagem.nome) conseguiu coletar a jóia. Estava confuso, pois o que devia ser um momento de extrema celebração se tornou algo agonizante. Ao segurar a jóia, começou a imaginá-la com sangue escorrendo de sua base, representando a morte das pessoas que ele deixou para trás na caverna.");
                     printarDialogo("Em completo desespero, saiu correndo de volta pelo caminho que trilhou. Depois de muita dificuldade, alcançou a entrada da caverna.");
                     printarDialogo("Para sua surpresa, a polícia o aguardava. Alguém de dentro da caverna conseguiu escapar e relatar os crimes de \(personagem.nome).");
                     printarDialogo("\(personagem.nome) foi sentenciado a 10 anos de prisão e teve a jóia confiscada.");
                     print(derrotaGrande);
                     
                 } else if personagem.pontosBondade > 1 {
                     
                     printarDialogo("\(personagem.nome), com o alívio em seu olhar e a felicidade estampada em seu rosto, consegue coletar a jóia e, voltando do caminho de onde veio, sai da caverna e vende a jóia por 10.250.000 dólares australianos.");
                     printarDialogo("Com o dinheiro que conseguiu, fundou a mineradora Beavers, concorrente direta de seu antigo local de trabalho, a mineradora Hawks.");
                     printarDialogo("Porém, o que \(personagem.nome) não esperava que seus atos de bondade durante sua exploração teriam consequências. Muitos mineradores salvos por ele criaram uma relação de confiança, e, mesmo recebendo um salário inferior, aceitaram trabalhar em sua mineradora.");
                     printarDialogo("A mineradora foi crescendo aos poucos, e depois de alguns meses conseguiu ultrapassar sua concorrente.");
                     
                 } else {
                     
                     printarDialogo("\(personagem.nome), com o alívio em seu olhar e a felicidade estampada em seu rosto, consegue coletar a jóia e, voltando do caminho de onde veio, sai da caverna e vende a jóia por 10.250.000 dólares australianos.");
                     printarDialogo("Tendo conseguido o dinheiro para viver o resto da sua vida na tranquilidade, pensa em como valeu a pena ter arriscado sua vida pela jóia.");
                 }
                         
             }
             
             exit(0);
         }],
         quantidadePedras: 30,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "⋇".magenta(), nivel: 7),
         posicaoSpawnBoneco: (x: 49, y: 4),
         fraseInicial: personagem.nome + " sente uma energia percorrendo seu corpo. Quando olha à frente, observa a lendária jóia, na cor roxa, mais reluzente que qualquer diamante do mundo.",
         ultimaFase: true
        ),

]


