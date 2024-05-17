import Foundation



struct Personagem {
    
    var posicao: (x: Int, y: Int) = (x: 0, y: 0)
    var direcaoPadrao = "↓".red()
    var energia: Int = 100
    var inventario: [String] = ["", ""]
    var inventarioQuantidade: [Int] = [0,0]
    
}

var personagem = Personagem()
var mapaAtual = todasAsFases[0]
//var posicaoBoneco: (x: Int, y:Int, ladoOlhando:String) = (x: mapaAtual.posicaoSpawnBoneco.x, y: mapaAtual.posicaoSpawnBoneco.y,         ladoOlhando: "↓");

var velocidadeTexto: Double = 1
var textoCompleto: Bool = false


func loopGame() {
    
    print("Digite a velocidade de digitação do texto (0.5; 1; 2; 5):")
    velocidadeTexto = Double(readLine()!)!
    
    mapaAtual.desenharObjetosMapa()
    personagem.posicao = mapaAtual.posicaoSpawnBoneco
    printarGameTeste();
    var pegarFuturaPosicao: () -> (x: Int, y: Int) = { (x: personagem.posicao.x, y: personagem.posicao.y + 1) };
    
    while(true) {
        
        
        let entrada = readLine()
        var entradaInvalida = false
        
        if let entradaConfirmada = entrada {
            
            let entradaSeparada = entradaConfirmada.split(separator: " ");
            
            switch entradaSeparada[0].uppercased() {
                
            case "W":
                pegarFuturaPosicao = { return (x: personagem.posicao.x, y: personagem.posicao.y - 1) }
                personagem.direcaoPadrao = "↑".red();
                break
                
            case "A":
                pegarFuturaPosicao = { (x: personagem.posicao.x - 2, y: personagem.posicao.y) }
                personagem.direcaoPadrao = "←".red();
                break
                
            case "S":
                pegarFuturaPosicao = { (x: personagem.posicao.x, y: personagem.posicao.y + 1) }
                personagem.direcaoPadrao = "↓".red();
                break
                
            case "D":
                pegarFuturaPosicao = { (x: personagem.posicao.x + 2, y: personagem.posicao.y) }
                personagem.direcaoPadrao = "→".red();
                break
                
            case "E": //Interagir
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
                
                personagem.energia -= 10
                break
                
            case "X":
                exit(0)
                break
                
            case "I": //Inventário
                print("Inventário:")
                for i in 0..<personagem.inventario.count{
                    if(personagem.inventario[i] != ""){
                        print(personagem.inventario[i]," x", personagem.inventarioQuantidade[i])
                    }
                }
                break
            default:
                pegarFuturaPosicao = {
                    (x: personagem.posicao.x, y: personagem.posicao.y)
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
                            personagem.posicao.x = pegarFuturaPosicao().x
                            personagem.posicao.y = pegarFuturaPosicao().y
                            
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
            
            if(personagem.energia <= 0)
            {
                exit(0)
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
    
    printarEnergia()
    
    for _ in 0..<20 {
        print()
    }
    
    var mapaComObjetos = mapaAtual.mapaDesenhadoComObjetos
    print("posicao spawn", mapaAtual.posicaoSpawnBoneco)
    mapaComObjetos[personagem.posicao.y][personagem.posicao.x].desenho = personagem.direcaoPadrao
    for i in 0..<mapaComObjetos.count {
        for j in 0..<mapaComObjetos[0].count {
            print(mapaComObjetos[i][j].desenho ,terminator: "");
        }
        
    }
    
    printarDevagar(texto: "\n\nParry adentra a caverna e começa a explorar seu interior…\n\n", velocidade: velocidadeTexto, completo: textoCompleto)
        
    if(!textoCompleto){
        textoCompleto = true
    }
    
}

func printarEnergia(){
    var energiaConv: Int = personagem.energia/5
    var barraEnergia: String = ""
    for i in 0..<energiaConv{
        barraEnergia += "#"
    }
    
    for i in 0..<20-energiaConv {
        barraEnergia += "#".black2()
    }
    
    print("Energia: [" + barraEnergia + "]")
}

func printarDevagar(texto: String, velocidade: Double, completo: Bool){
    var textoConv = Array(texto)
    var velocidadeConv = 50000 / velocidade
    
    setbuf(__stdoutp, nil)
    
    if(!completo){ //Caso ainda não tenha digitado o texto
        for i in 0..<textoConv.count{
            print(textoConv[i], terminator: "")
            
            usleep(useconds_t(velocidadeConv))
        }
    }else{
        print(texto.italic())
    }
}
    
    









extension String {
    
    func bold() -> String { juntar("1")}
    func dim() -> String { juntar("2")}
    func italic() -> String { juntar("3")}
    func underline() -> String { juntar("4")}
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
