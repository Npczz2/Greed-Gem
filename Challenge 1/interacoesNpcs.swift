//
//  interacoesNpcs.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 23/05/24.
//

import Foundation

func stanElliotInteracao(){
    printarDialogo("Stan: Ei! Por favor me ajude! Este homem tentou me roubar!")
    printarDialogo("Elliot: Não! esse comédia está inventando tudo isso, ele que tentou me roubar!")
    printarDialogo("\(personagem.nome): Ei, se acalmem!")
    printarDialogo("Elliot: Sai daí lerdão, me ajuda a bater nesse ladrãozinho! Ele vai querer te roubar também!")
    printarDialogo("Stan: Pare! Pare, por favor! Me ajude a tirar esse homem de cima de mim! Ele é um ladrão!")
    printarDialogo("Stan: Eu posso te dar dinheiro e comida quando saírmos da caverna!")
    printarDialogo("Elliot: Eu já disse que ele é o verdadeiro ladrão, me ouve!")
    
    var escolhaValida = false
    
    repeat {
        
        printarEscolhas(escolhas: ["Ajudar Stan", "Ajudar Elliot"])
        
        if let escolha = readLine() {
            
            switch escolha {
               
            case "1": //Escolheu Stan
                printarDialogo("\(personagem.nome) tira Elliot de cima de Stan e empurra ele no chão.")
                printarDialogo("\(personagem.nome): Sai de cima dele seu maluco!")
                printarDialogo("Stan: Muito obrigado pela ajuda… Eu estava assustado demais, nem consegui me defender.")
                printarDialogo("\(personagem.nome): Não tem problema. Só toma mais cuidado por aí.")
                printarDialogo("Stan: Você vai continuar descendo?")
                printarDialogo("\(personagem.nome) Sim, ainda não alcancei meu objetivo.")
                printarDialogo("Stan: E você tem comida o suficiente?")
                printarDialogo("\(personagem.nome) Acho que sim. Vou ficar bem.")
                printarDialogo("Stan: Certo… A gente se vê por aí…")

                escolhaValida.toggle()
                break;
            case "2": //Escolheu Elliot
                printarDialogo("\(personagem.nome) ajuda Elliot a bater em Stan, que foge para longe.".italic())
                printarDialogo("Elliot: Corre mesmo, senão eu te pego!")
                printarDialogo("Elliot: Valeu cara, não podia deixar esse moleque ileso pelo que ele anda fazendo pela caverna.")
                printarDialogo(personagem.nome + ": Ele anda roubando mais gente?")
                printarDialogo("Elliot: Sim. Você era um minerador da Hawks também né?")
                printarDialogo(personagem.nome + ": Eu era. Um dos antigos.")
                printarDialogo("Elliot: Sabe o pior? Esse moleque é filho do dono.")
                printarDialogo(personagem.nome + ": O que? Mas porque ele está roubando os outros?")
                printarDialogo("Elliot: Provavelmente para fazer com que só ele chegue até a jóia.")
                printarDialogo(personagem.nome + ": Que cara maluco...")
                printarDevagar(texto: "Elliot: Ele roubou tudo que um parceiro meu tinha. O velho endoidou… Não sei onde ele está agora.\n\n", completo: false)
                printarDialogo("Elliot: Bom, tome cuidado no caminho. Quem sabe não nos vemos de novo.")
                
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
