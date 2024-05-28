//
//  interacoesNpcs.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 23/05/24.
//

import Foundation

func wallisInteracao() {
    
    printarDialogo("Wallis: Não! não! Não entre, novato!");
    printarDialogo("Wallis: Eu sei que você está pensando na jóia, porém esta caverna esconde diversos perigos. As pessoas estão ficando loucas lá dentro. Inclusive eu. Eu perdi tudo, tudo que tinha…");
    printarDialogo(personagem.nome + ": O que aconteceu com você, meu senhor?");
    printarDialogo("Wallis: Me roubaram… Toda a minha comida, minhas roupas, meus equipamentos. É um milagre eu ainda estar de pé aqui. As pessoas dentro da caverna são sujas… Se passam por boas pessoas mas estão todas cegas pela jóia.");
    
    var escolhaValida = false;
    
    repeat {
        
        printarEscolhas(escolhas: ["Eu não me importo, eu preciso dessa jóia.", "Eu vou me cuidar. Obrigado pelo aviso, senhor."]);
        
        if let escolha = readLine() {
            
            switch escolha {
                
            case "1":
                printarDialogo("Wallis: Jovem, você vai se arrepender desta decisão. Eu perdi tudo… E você terá um fim trágico igual a mim.");
                escolhaValida.toggle();
                break;
                
            case "2":
                printarDialogo("Wallis: Você é bom… Não deixe a caverna te corromper…");
                escolhaValida.toggle();
                break;
                
            default:
                print("Escolha inválida, digite novamente");
                break;
                
            }
            
        }
        
    } while(!escolhaValida);
    
}

func antonyInteracao() {
    
    var escolhaValida = false;
    
    repeat {
        
        printarEscolhas(escolhas: ["Furtar a mochila", "Avisar o homem sobre a mochila"]);
        
        if let escolha = readLine() {
            
            switch escolha {
                
            case "1":
                printarDevagar(texto: "\n\(personagem.nome) rouba a mochila do homem e consegue pegar: \n".italic(), completo: false);
                roubarItens(itens: ["Pedra", "Ferro", "Torta", "Peixe"]);
                personagem.pontosBondade -= 1;
                escolhaValida.toggle();
                break;
                
            case "2":
                printarDialogo(personagem.nome + ": Ei, com licença, sua mochila está aberta.");
                printarDialogo("Antony: Sai daqui cara! Tira o olho das minhas coisas!");
                printarDialogo(personagem.nome + ": Não, não é isso, é só que-");
                printarDialogo("Antony: Não importa. Só dá o fora.");
                personagem.pontosBondade += 1;
                escolhaValida.toggle();
                break;
                
            default:
                print("Escolha inválida, digite novamente");
                break;
                
            }
            
        }
        
    } while(!escolhaValida);
}

func reencontroStanInteracao() {
    
    if escolheuStan {
        printarDialogo("Stan: Olha o que temos aqui… MUITO obrigado por não ter ajudado aquele cara mais cedo.");
        printarDialogo("\(personagem.nome): O que você está fazendo aqui?");
        printarDialogo("Stan: HAHAHA, o que você acha? Você acha mesmo que eu deixaria alguém além de mim encostar na jóia lendária?");
        printarDialogo("\(personagem.nome): Então você era o ladrão de verdade…");
        printarDialogo("Stan: Parabéns, gênio! Agora é tarde demais. Me dê tudo que você tem guardado na mochila ou eu acabo com você.");
        var escolhaValida = false;
        
        repeat {
            
            printarEscolhas(escolhas: ["Entregar todos os itens a Stan", "Enfrentar Stan "]);
            
            if let escolha = readLine() {
                
                switch escolha {
                    
                case "1":
                    
                    printarDialogo("\(personagem.nome) entrega todos os itens para Stan.".italic());
                    for i in (1..<personagem.inventario.count).reversed() {
                        personagem.inventario.remove(at: i);
                    }
                    escolhaValida.toggle();
                    break;
                    
                case "2":
                    
                    if personagem.nivel > 5 {
                        
                        printarDevagar(texto: "\(personagem.nome) consegue derrotar Stan, que era um minerador de nível 5, e vasculha sua mochila coletando:\n".italic(), completo: false);
                        roubarItens(itens: ["Torta", "Peixe", "Rubí", "Ouro", "Diamante"]);
                        
                    } else {
                        
                        printarDialogo("\(personagem.nome) não foi capaz de enfrentar Stan, que era um minerador de nível 3, e acabou perdendo sua vida\n".italic());
                        print(derrotaGrande);
                        
                        exit(0);
                        
                    }
                    
                    escolhaValida.toggle();
                    break;
                default:
                    print("Escolha inválida, digite novamente")
                    break;
                }
                
            }
            
        } while(!escolhaValida);
        
    } else {
        
        printarDialogo("Stan: HAHAHA! Você achou que ia ficar por isso mesmo né?");
        printarDialogo("\(personagem.nome): Você de novo…");
        printarDialogo("Stan: Parabéns por ter descoberto quem era o verdadeiro ladrão. Agora, me passa tudo que você tem aí.");
        printarDialogo("Eliot aparece no mapa para defender \(personagem.nome) e vai em direção a Stan.".italic());
        printarDialogo("Eliot: Eu sabia! Ei cara, pode ir na frente! Vou te retribuir pela outra hora.");
            
    }
}

func bryanInteracao() {
    
    var escolhaValida = false;
    
    repeat {
        
        printarEscolhas(escolhas: ["Tirar a pedra (gasta energia)", "Fingir que não ouviu", "Roubar os minérios restantes"]);
        
        if let escolha = readLine() {
            
            switch escolha {
                
            case "1":
                printarDevagar(texto: "\(personagem.nome) tira a pedra de cima do homem. ▼".italic(), completo: false);
                personagem.energia -= 5;
                _ = readLine();
                printarDialogo("Bryan: Muito obrigado, você me salvou! Pensei que iria morrer aqui...".italic());
                personagem.pontosBondade += 1;
                escolhaValida.toggle();
                break;
                
            case "2":
                printarDialogo("\(personagem.nome) finge que não ouviu o pedido de socorro do homem e segue sua exploração.");
                _ = readLine();
                escolhaValida.toggle();
                break;
                
            case "3":
                
                printarDevagar(texto: "\(personagem.nome) decide roubar os itens do homem que estava preso, coletando:\n", completo: false);
                roubarItens(itens: ["Pedra", "Esmeralda", "Diamante", "Fruta"]);
                personagem.pontosBondade -= 1;
                escolhaValida.toggle();
                break;
                
            default:
                print("Escolha inválida, digite novamente");
                break;
                
            }
            
        }
        
    } while(!escolhaValida);
}

func carlInteracao() {
    
    printarDialogo("Carl: SAI! SAI DAQUI! A JÓIA É MINHA! SAI DAQUI OU EU TE MATO!");
    printarDialogo("\(personagem.nome): Ei, calma, calma! Eu não quero lutar!");
    printarDialogo("Carl: NÃO, ELA É MINHA. SÓ. MINHA.");
    printarDialogo("Os dois começam a brigar e \(personagem.nome) consegue derrotar Carl.");
    printarDialogo("\(personagem.nome): É culpa sua. Você que começou com tudo isso.");
    
    var escolhaValida = false;
    
    repeat {
        
        printarEscolhas(escolhas: ["Poupar", "Roubar seus minérios restantes"]);
        
        if let escolha = readLine() {
            
            switch escolha {
                
            case "1":
                printarDialogo("\(personagem.nome) decide poupar a vida de Carl.".italic());
                personagem.pontosBondade += 1;
                escolhaValida.toggle();
                break;
                
            case "2":
                printarDevagar(texto: "\(personagem.nome) decide roubar todos os minérios restantes de Carl, recebendo:\n".italic(), completo: false);
                roubarItens(itens: ["Rubí", "Pedra", "Ouro", "Ferro"]);
                personagem.pontosBondade -= 1;
                escolhaValida.toggle();
                break;
                
            default:
                print("Escolha inválida, digite novamente");
                break;
            }
        }
        
    } while(!escolhaValida);
    
}

func stanElliotInteracao(){
    printarDialogo("Stan: Ei! Por favor me ajude! Este homem tentou me roubar!");
    printarDialogo("Elliot: Não! esse comédia está inventando tudo isso, ele que tentou me roubar!");
    printarDialogo("\(personagem.nome): Ei, se acalmem!");
    printarDialogo("Elliot: Sai daí lerdão, me ajuda a bater nesse ladrãozinho! Ele vai querer te roubar também!");
    printarDialogo("Stan: Pare! Pare, por favor! Me ajude a tirar esse homem de cima de mim! Ele é um ladrão!");
    printarDialogo("Stan: Eu posso te dar dinheiro e comida quando saírmos da caverna!");
    printarDialogo("Elliot: Eu já disse que ele é o verdadeiro ladrão, me ouve!");
    
    var escolhaValida = false
    
    repeat {
        
        printarEscolhas(escolhas: ["Ajudar Stan", "Ajudar Elliot"]);
        
        if let escolha = readLine() {
            
            switch escolha {
               
            case "1": //Escolheu Stan       
                printarDialogo("\(personagem.nome) tira Elliot de cima de Stan e empurra ele no chão.");
                printarDialogo("\(personagem.nome): Sai de cima dele seu maluco!");
                printarDialogo("Stan: Muito obrigado pela ajuda… Eu estava assustado demais, nem consegui me defender.");
                printarDialogo("\(personagem.nome): Não tem problema. Só toma mais cuidado por aí.");
                printarDialogo("Stan: Você vai continuar descendo?");
                printarDialogo("\(personagem.nome) Sim, ainda não alcancei meu objetivo.");
                printarDialogo("Stan: E você tem comida o suficiente?");
                printarDialogo("\(personagem.nome) Acho que sim. Vou ficar bem.");
                printarDialogo("Stan: Certo… A gente se vê por aí…");
                escolhaValida.toggle();
                break;
                
            case "2": //Escolheu Elliot
                printarDialogo("\(personagem.nome) ajuda Elliot a bater em Stan, que foge para longe.".italic());
                printarDialogo("Elliot: Corre mesmo, senão eu te pego!");
                printarDialogo("Elliot: Valeu cara, não podia deixar esse moleque ileso pelo que ele anda fazendo pela caverna.");
                printarDialogo(personagem.nome + ": Ele anda roubando mais gente?");
                printarDialogo("Elliot: Sim. Você era um minerador da Hawks também né?");
                printarDialogo(personagem.nome + ": Eu era. Um dos antigos.");
                printarDialogo("Elliot: Sabe o pior? Esse moleque é filho do dono.");
                printarDialogo(personagem.nome + ": O que? Mas porque ele está roubando os outros?");
                printarDialogo("Elliot: Provavelmente para fazer com que só ele chegue até a jóia.");
                printarDialogo(personagem.nome + ": Que cara maluco...");
                printarDevagar(texto: "Elliot: Ele roubou tudo que um parceiro meu tinha. O velho endoidou… Não sei onde ele está agora.\n\n", completo: false);
                printarDialogo("Elliot: Bom, tome cuidado no caminho. Quem sabe não nos vemos de novo.");
                escolheuStan = false;
                escolhaValida.toggle();
                break;
            default:
                print("Escolha inválida, digite novamente");
                break;
                
            }
            
            mapaAtual.npcs[0].interagiu = true;
            mapaAtual.npcs[1].interagiu = true;
            
        }
        
    } while(!escolhaValida)
}
