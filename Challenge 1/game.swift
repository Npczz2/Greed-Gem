import Foundation





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
    
    
    while(true) {

        if let entradaConfirmada = readLine() {
            personagem.acaoDoTurno(entrada: entradaConfirmada)
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
    
  //  printarEnergia()
    
    for _ in 0..<3 {
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
    
  //  printarDevagar(texto: "\n\nParry adentra a caverna e começa a explorar seu interior…\n\n", velocidade: velocidadeTexto, completo: textoCompleto)
        
    if(!textoCompleto){
        textoCompleto = true
    }
    
    print()
    
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
