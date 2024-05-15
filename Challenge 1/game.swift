import Foundation




var mapaAtual = todasAsFases[0]
var posicaoBoneco: (x: Int, y:Int, ladoOlhando:String) = (x: mapaAtual.posicaoSpawnBoneco.x, y: mapaAtual.posicaoSpawnBoneco.y,         ladoOlhando: "↓");


func loopGame() {
    
    mapaAtual.desenharObjetosMapa()
    printarGameTeste();
    var pegarFuturaPosicao: () -> (x: Int, y: Int) = { (x: posicaoBoneco.x, y: posicaoBoneco.y + 1) };
    
    while(true) {
        
        
        let entrada = readLine()
        var entradaInvalida = false
        
        
        if let entradaConfirmada = entrada {
            
            let entradaSeparada = entradaConfirmada.split(separator: " ");
            
            switch entradaSeparada[0].uppercased() {
                
            case "W":
                pegarFuturaPosicao = { return (x: posicaoBoneco.x, y: posicaoBoneco.y - 1) }
                posicaoBoneco.ladoOlhando = "↑";
                break
                
            case "A":
                pegarFuturaPosicao = { (x: posicaoBoneco.x - 2, y: posicaoBoneco.y) }
                posicaoBoneco.ladoOlhando = "←";
                break
                
            case "S":
                pegarFuturaPosicao = { (x: posicaoBoneco.x, y: posicaoBoneco.y + 1) }
                posicaoBoneco.ladoOlhando = "↓";
                break
                
            case "D":
                pegarFuturaPosicao = { (x: posicaoBoneco.x + 2, y: posicaoBoneco.y) }
                posicaoBoneco.ladoOlhando = "→";
                break
                
            case "E":
                let espacoFuturo = pegarFuturaPosicao();
                print(espacoFuturo)
                if let coisaNoEspaco = mapaAtual.mapaDesenhadoComObjetos[espacoFuturo.y][espacoFuturo.x].algoInteragivel {
                    coisaNoEspaco.interacao()
                    mapaAtual.desenharObjetosMapa()
                }
                break
            case "B":
                print("troca de mapa..")
                mapaAtual = todasAsFases[1];
                mapaAtual.desenharObjetosMapa();
                break
                
            case "X":
                exit(0)
                break
            default:
                pegarFuturaPosicao = {
                    (x: posicaoBoneco.x, y: posicaoBoneco.y)
                }
                
                entradaInvalida = true
                break
                
                
            }
            
            printarGameTeste()
            
            
            if entradaSeparada.count > 1 && !entradaInvalida {
                if let numeroDeCasas = Int(entradaSeparada[1]) {
                    for i in 0..<numeroDeCasas {
                        var posicaoFutura = pegarFuturaPosicao();
                        if (mapaAtual.mapaDesenhadoComObjetos[posicaoFutura.y][posicaoFutura.x].desenho == ".") {
                            posicaoBoneco.x = pegarFuturaPosicao().x
                            posicaoBoneco.y = pegarFuturaPosicao().y
                            printarGameTeste()
                        } else {
                            print("colisao".red())
                            break
                        }
                        
                        
                        do {
                            usleep(200000)
                        }
                    }
                }
            }
        }
    }
}





// func desenharObjetosMapa () {
//     mapaAtual.mapaDesenhadoComObjetos = mapaAtual.mapaDesenho
//     for i in 0..<mapaAtual.posicoesPedras.count {
//         mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesPedras[i].y][mapaAtual.posicoesPedras[i].x] = Espaco("▚".bgYellow2(), i) {
//             print("interacaoPedra")
//             mapaAtual.posicoesPedras.remove(at: i)
//         }
//     }

//     for i in 0..<mapaAtual.posicoesMinerios.count {
//         mapaAtual.mapaDesenhadoComObjetos[mapaAtual.posicoesMinerios[i].y][mapaAtual.posicoesMinerios[i].x] = Espaco("o".blue2(), i) {
//             print("interacaoMinerio")
//             mapaAtual.posicoesMinerios.remove(at: i)
//         }
//     }


// }


func printarGameTeste() {
    
    var mapaComObjetos = mapaAtual.mapaDesenhadoComObjetos
    mapaComObjetos[posicaoBoneco.y][posicaoBoneco.x].desenho = posicaoBoneco.ladoOlhando.red()
    for i in 0..<mapaComObjetos.count {
        for j in 0..<mapaComObjetos[0].count {
            print(mapaComObjetos[i][j].desenho ,terminator: "");
        }
        
        print();
    }
    
}









extension String {
    
    func black() -> String { juntar("30") }
    func red() -> String { juntar("31") }
    func green() -> String { juntar("32") }
    func yellow() -> String { juntar("33") }
    func blue() -> String { juntar("34") }
    func magenta() -> String { juntar("35") }
    func cyan() -> String { juntar("36") }
    func white() -> String { juntar("37") }
    func bgBlack() -> String { juntar("40") }
    func bgRed() -> String { juntar("41") }
    func bgGreen() -> String { juntar("42") }
    func bgYellow() -> String { juntar("43") }
    func bgBlue() -> String { juntar("44") }
    func bgMagenta() -> String { juntar("45") }
    func bgCyan() -> String { juntar("46") }
    func bgWhite() -> String { juntar("47") }
    func underLine() -> String { juntar("4") }
    func risco() -> String {juntar("9")}
    
    func black2() -> String { juntar("90") }
    func red2() -> String { juntar("91") }
    func green2() -> String { juntar("92") }
    func yellow2() -> String { juntar("93") }
    func blue2() -> String { juntar("94") }
    func magenta2() -> String { juntar("95") }
    func cyan2() -> String { juntar("96") }
    func white2() -> String { juntar("97") }
    func bgBlack2() -> String { juntar("100") }
    func bgRed2() -> String { juntar("101") }
    func bgGreen2() -> String { juntar("102") }
    func bgYellow2() -> String { juntar("103") }
    func bgBlue2() -> String { juntar("104") }
    func bgMagenta2() -> String { juntar("105") }
    func bgCyan2() -> String { juntar("106") }
    func bgWhite2() -> String { juntar("107") }
    
    func juntar(_ cor: String) -> String {
        "\u{001B}[0;" + cor + "m" + self + "\u{001B}[0;0m"
    }
    
    var tamanho: Int { self.count - 13 }
    
}
