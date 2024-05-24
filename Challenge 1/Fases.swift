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
 ┌┤ . . . . . . . . . . ├┼┤  &
│├┤ . . . . . . . . . . . ││ &
││  . . . . . . . . . . . ││ &
 ├┐ . . . . . . . . . . ┌┬┤  &
 ├┤ . . . . . . . . . . ├┼┤  &
  ├┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┤    &
  ├┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┤    &
""",
         
         npcs: [Npc(desenho: "W".magenta(), posicaoSpawnNPC: (x: 19, y: 5), interacao: {
             
           
             printarDialogo("Wallis: Não! não! Não entre, novato!")
             printarDialogo("Wallis: Eu sei que você está pensando na jóia, porém esta caverna esconde diversos perigos. As pessoas estão ficando loucas lá dentro. Inclusive eu. Eu perdi tudo, tudo que tinha…")
             printarDialogo(personagem.nome + ": O que aconteceu com você, meu senhor?")
             
             printarDialogo("Wallis: Me roubaram… Toda a minha comida, minhas roupas, meus equipamentos. É um milagre eu ainda estar de pé aqui. As pessoas dentro da caverna são sujas… Se passam por boas pessoas mas estão todas cegas pela jóia.")
             
             var escolhaValida = false
             
             repeat {
                 
                 printarEscolhas(escolhas: ["Eu não me importo, eu preciso dessa jóia.", "Eu vou me cuidar. Obrigado pelo aviso, senhor."])
                 
                 if let escolha = readLine() {
                     
                     switch escolha {
                         
                     case "1":
                         printarDialogo("Wallis: Jovem, você vai se arrepender desta decisão. Eu perdi tudo… E você terá um fim trágico igual a mim.")
                         escolhaValida.toggle()
                         break;
                     case "2":
                         printarDialogo("Wallis: Você é bom… Não deixe a caverna te corromper…")
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
             
             var escolhaValida = false
             
             repeat {
                 
                 printarEscolhas(escolhas: ["Furtar a mochila", "Avisar o homem sobre a mochila"])
                 
                 if let escolha = readLine() {
                     
                     switch escolha {
                         
                     case "1":
                         
                         printarDevagar(texto: "\n\(personagem.nome) rouba a mochila do homem e consegue pegar: \n".italic(), completo: false);
                         roubarItens(itens: ["Pedra", "Ferro", "Torta", "Peixe"])
                         personagem.pontosBondade -= 1;
                         _ = readLine()
                         escolhaValida.toggle()
                         break;
                     case "2":
                         
                         printarDialogo(personagem.nome + ": Ei, com licença, sua mochila está aberta.")
                         printarDialogo("Antony: Sai daqui cara! Tira o olho das minhas coisas!")
                         printarDialogo(personagem.nome + ": Não, não é isso, é só que-")
                         printarDialogo("Antony: Não importa. Só dá o fora.")
                         personagem.pontosBondade += 1;
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
             
             stanElliotInteracao()
             
         }),Npc(desenho: "E".magenta(), posicaoSpawnNPC: (x: 24, y: 5), interacao: {
             
             stanElliotInteracao()
             
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
             
             if escolheuStan {
                 printarDialogo("Stan: Olha o que temos aqui… MUITO obrigado por não ter ajudado aquele cara mais cedo.")
                 printarDialogo("\(personagem.nome): O que você está fazendo aqui?")
                 printarDialogo("Stan: HAHAHA, o que você acha? Você acha mesmo que eu deixaria alguém além de mim encostar na jóia lendária?")
                 printarDialogo("\(personagem.nome): Então você era o ladrão de verdade…")
                 printarDialogo("Stan: Parabéns, gênio! Agora é tarde demais. Me dê tudo que você tem guardado na mochila ou eu acabo com você.")
                 
                 var escolhaValida = false
                 
                 repeat {
                     
                     printarEscolhas(escolhas: ["Entregar todos os itens a Stan", "Enfrentar Stan "])
                     
                     if let escolha = readLine() {
                         
                         switch escolha {
                             
                         case "1":
                             
                             printarDevagar(texto: "\(personagem.nome) entrega todos os itens para Stan.".italic(), completo: false);
                             printarDialogo("\(personagem.nome) entrega todos os itens para Stan.".italic())
                             for i in (1..<personagem.inventario.count).reversed() {
                                 personagem.inventario.remove(at: i)
                             }
                             escolhaValida.toggle()
                             break;
                             
                         case "2":
                             
                             if personagem.nivel > 3 {
                                 
                                 printarDevagar(texto: "\(personagem.nome) consegue derrotar Stan, que era um minerador de nível 3, e vasculha sua mochila coletando:\n".italic(), completo: false)
                                 roubarItens(itens: ["Torta", "Peixe", "Rubí", "Ouro", "Diamante"])
                                 _ = readLine()
                                 
                                 
                             } else {
                                 
                                 printarDialogo("\(personagem.nome) não foi capaz de enfrentar Stan, que era um minerador de nível 3, e acabou perdendo sua vida\n".italic())
                                 print(derrotaGrande)
                                 
                                 exit(0)
                                 
                                 
                                 
                                 
                             }
                             
                             escolhaValida.toggle()
                             break;
                         default:
                             print("Escolha inválida, digite novamente")
                             break;
                             
                         }
                         
                     }
                     
                 } while(!escolhaValida)
                 
                 
                 
                 
                 
             } else {

                 printarDialogo("Stan: HAHAHA! Você achou que ia ficar por isso mesmo né?")
                 printarDialogo("\(personagem.nome): Você de novo…")
                 printarDialogo("Stan: Parabéns por ter descoberto quem era o verdadeiro ladrão. Agora, me passa tudo que você tem aí.")
                 printarDialogo("Eliot aparece no mapa para defender \(personagem.nome) e vai em direção a Stan.".italic())
                 printarDialogo("Eliot: Eu sabia! Ei cara, pode ir na frente! Vou te retribuir pela outra hora.")
                   
                 
             }
             
             
             
             
             
             
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
             printarDialogo("Bryan: Por favor… Tire essa pedra de cima de mim, não consigo me mexer. Por favor, me salve.")
             
             
             var escolhaValida = false
             
             repeat {
                 
                 printarEscolhas(escolhas: ["Tirar a pedra (gasta energia)", "Fingir que não ouviu", "Roubar os minérios restantes"])
                 
                 if let escolha = readLine() {
                     
                     switch escolha {
                         
                     case "1":
                         printarDevagar(texto: "\(personagem.nome) tira a pedra de cima do homem. ▼".italic(), completo: false);
                         personagem.energia -= 5
                         _ = readLine()
                         printarDialogo("Bryan: Muito obrigado, você me salvou! Pensei que iria morrer aqui...".italic())
                       
                       
                         
                         personagem.pontosBondade += 1
                         
                         escolhaValida.toggle()
                         break;
                     case "2":
                         printarDialogo("\(personagem.nome) finge que não ouviu o pedido de socorro do homem e segue sua exploração.")
                         _ = readLine()
                         
                         escolhaValida.toggle()
                         break;
                         
                     case "3":
                         printarDevagar(texto: "\(personagem.nome) decide roubar os itens do homem que estava preso, coletando:\n", completo: false);
                         roubarItens(itens: ["Pedra", "Esmeralda", "Diamante", "Fruta"])
                         _ = readLine()
                         
                         personagem.pontosBondade -= 1
                         escolhaValida.toggle()
                         break
                     default:
                         print("Escolha inválida, digite novamente")
                         break;
                         
                     }
                     
                 }
                 
             } while(!escolhaValida)
             
             
             
         }), Npc(desenho: "C".magenta(), posicaoSpawnNPC: (x: 39, y: 10), interacao: {
             
             printarDialogo("Carl: SAI! SAI DAQUI! A JÓIA É MINHA! SAI DAQUI OU EU TE MATO!")
             printarDialogo("\(personagem.nome): Ei, calma, calma! Eu não quero lutar!")
             printarDialogo("Carl: NÃO, ELA É MINHA. SÓ. MINHA.")
             printarDialogo("Os dois começam a brigar e \(personagem.nome) consegue derrotar Carl.")
             printarDialogo("\(personagem.nome): É culpa sua. Você que começou com tudo isso.")
      
             var escolhaValida = false
             
             repeat {
                 
                 printarEscolhas(escolhas: ["Poupar", "Roubar seus minérios restantes"])
                 
                 if let escolha = readLine() {
                     
                     switch escolha {
                         
                     case "1":
                         
                         printarDialogo("\(personagem.nome) decide poupar a vida de Carl.".italic())
                         personagem.pontosBondade += 1
                         escolhaValida.toggle()
                         break;
                         
                     case "2":
                         
                         printarDevagar(texto: "\(personagem.nome) decide roubar todos os minérios restantes de Carl, recebendo:\n".italic(), completo: false)
                         _ = readLine()
                         roubarItens(itens: ["Rubí", "Pedra", "Ouro", "Ferro"])
                         
                         personagem.pontosBondade -= 1
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
         
         npcs: [Npc(desenho: "⋇".magenta(), posicaoSpawnNPC: (x: 5, y: 4) ){
             
             if(personagem.inventario[0].nivel < mapaAtual.tipoDeMinerio.nivel) {
                
                 printarDialogo("\(personagem.nome) tenta usar sua picareta para extrair a jóia e finalmente levá-la para casa. Porém, ao tentar arrancar a jóia que ficava fixa em uma pedra extremamente dura, ele acaba forçando demais pelo nível de sua picareta ser insuficiente e acaba quebrando a jóia.")
                 print(derrotaGrande)
                 
             } else {
                 
                 if personagem.pontosBondade < 0 {
                     
                     printarDialogo("Depois de sua longa jornada, \(personagem.nome) conseguiu coletar a jóia. Estava confuso, pois o que devia ser um momento de extrema celebração se tornou algo agonizante. Ao segurar a jóia, começou a imaginá-la com sangue escorrendo de sua base, representando a morte das pessoas que ele deixou para trás na caverna.")
                     printarDialogo("Em completo desespero, saiu correndo de volta pelo caminho que trilhou. Depois de muita dificuldade, alcançou a entrada da caverna.")
                     printarDialogo("Para sua surpresa, a polícia o aguardava. Alguém de dentro da caverna conseguiu escapar e relatar os crimes de \(personagem.nome).")
                     printarDialogo("\(personagem.nome) foi sentenciado a 10 anos de prisão e teve a jóia confiscada.")
                     
                     print(derrotaGrande)
                     
                 
                     
                 } else if personagem.pontosBondade == 0 {
                     
                     printarDialogo("\(personagem.nome), com o alívio em seu olhar e a felicidade estampada em seu rosto, consegue coletar a jóia e, voltando do caminho de onde veio, sai da caverna e vende a jóia por 10.250.000 dólares australianos.")
                     printarDialogo("Tendo conseguido o dinheiro para viver o resto da sua vida na tranquilidade, pensa em como valeu a pena ter arriscado sua vida pela jóia.")
                     
                 } else {
                     printarDialogo("\(personagem.nome), com o alívio em seu olhar e a felicidade estampada em seu rosto, consegue coletar a jóia e, voltando do caminho de onde veio, sai da caverna e vende a jóia por 10.250.000 dólares australianos.")
                      printarDialogo("Com o dinheiro que conseguiu, fundou a mineradora Beavers, concorrente direta de seu antigo local de trabalho, a mineradora Hawks.")
                      printarDialogo("Porém, o que \(personagem.nome) não esperava que seus atos de bondade durante sua exploração teriam consequências. Muitos mineradores salvos por ele criaram uma relação de confiança, e, mesmo recebendo um salário inferior, aceitaram trabalhar em sua mineradora.")
                      printarDialogo("A mineradora foi crescendo aos poucos, e depois de alguns meses conseguiu ultrapassar sua concorrente.")
                 }
                
                 
             }
             
             exit(0)
         }],
         quantidadePedras: 30,
         quantidadeMinerios: 0,
         tipoDeMinerio: Minerio(desenho: "⋇".magenta(), nivel: 7),
         posicaoSpawnBoneco: (x: 49, y: 4),
         fraseInicial: personagem.nome + " sente uma energia percorrendo seu corpo. Quando olha à frente, observa a lendária jóia, na cor roxa, mais reluzente que qualquer diamante do mundo."
        ),
    
    
    
    
]


