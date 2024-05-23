//
//  interacoesNpcs.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 23/05/24.
//

import Foundation

func stanElliotInteracao(){
    printarDevagar(texto: "Stan: Ei! Por favor me ajude! Este homem tentou me roubar! ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "Elliot: Não! esse comédia está inventando tudo isso, ele que tentou me roubar! ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "\(personagem.nome): Ei, se acalmem! ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "Elliot: Sai daí lerdão, me ajuda a bater nesse ladrãozinho! Ele vai querer te roubar também! ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "Stan: Pare! Pare, por favor! Me ajude a tirar esse homem de cima de mim! Ele é um ladrão!\n", completo: false)
    printarDevagar(texto: "Stan: Eu posso te dar dinheiro e comida quando saírmos da caverna! ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "Elliot: Eu já disse que ele é o verdadeiro ladrão, me ouve! ▼\n\n", completo: false)
    
    var escolhaValida = false
    
    repeat {
        
        printarEscolhas(escolhas: ["Ajudar Stan", "Ajudar Elliot"])
        
        if let escolha = readLine() {
            
            switch escolha {
               
            case "1": //Escolheu Stan
                printarDevagar(texto: "\(personagem.nome) tira Elliot de cima de Stan e empurra ele no chão. ▼".italic(), completo: false);
                _ = readLine()
                printarDevagar(texto: "\(personagem.nome): Sai de cima dele seu maluco! ▼\n", completo: false);
                _ = readLine()
                printarDevagar(texto: "Stan: Muito obrigado pela ajuda… Eu estava assustado demais, nem consegui me defender. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "\(personagem.nome): Não tem problema. Só toma mais cuidado por aí. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Stan: Você vai continuar descendo? ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "\(personagem.nome) Sim, ainda não alcancei meu objetivo. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Stan: E você tem comida o suficiente? ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "\(personagem.nome) Acho que sim. Vou ficar bem. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Stan: Certo… A gente se vê por aí… ▼", completo: false);
                _ = readLine()

                escolhaValida.toggle()
                break;
            case "2": //Escolheu Elliot
                printarDevagar(texto: "\(personagem.nome) ajuda Elliot a bater em Stan, que foge para longe. ▼".italic(), completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Corre mesmo, senão eu te pego! ▼\n", completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Valeu cara, não podia deixar esse moleque ileso pelo que ele anda fazendo pela caverna. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: personagem.nome + ": Ele anda roubando mais gente? ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Sim. Você era um minerador da Hawks também né? ▼", completo: false)
                _ = readLine()
                printarDevagar(texto: personagem.nome + ": Eu era. Um dos antigos. ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Sabe o pior? Esse moleque é filho do dono. ▼", completo: false)
                _ = readLine()
                printarDevagar(texto: personagem.nome + ": O que? Mas porque ele está roubando os outros? ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Provavelmente para fazer com que só ele chegue até a jóia. ▼", completo: false)
                _ = readLine()
                printarDevagar(texto: personagem.nome + ": Que cara maluco... ▼", completo: false);
                _ = readLine()
                printarDevagar(texto: "Elliot: Ele roubou tudo que um parceiro meu tinha. O velho endoidou… Não sei onde ele está agora.\n", completo: false)
                printarDevagar(texto: "Elliot: Bom, tome cuidado no caminho. Quem sabe não nos vemos de novo. ▼", completo: false)
                _ = readLine()
                
                escolheuStan = false
                
                escolhaValida.toggle()
                break;
            default:
                print("Escolha inválida, digite novamente")
                break;
                
            }
            
            mapaAtual.npcs[0].interagiu = true
            mapaAtual.npcs[1].interagiu = true
            
        }
        
    } while(!escolhaValida)
}
