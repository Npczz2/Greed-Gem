import Foundation





var personagem = Personagem()
var mapaAtual = todasAsFases[0]
//var posicaoBoneco: (x: Int, y:Int, ladoOlhando:String) = (x: mapaAtual.posicaoSpawnBoneco.x, y: mapaAtual.posicaoSpawnBoneco.y,         ladoOlhando: "↓");

var velocidadeTexto: Double = 1
var textoCompleto: Bool = false


func loopGame() {
    
    print("Digite o nome do personagem: ")
    personagem.nome = readLine()!
    
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




func printarGameTeste() {
    
    for _ in 0..<20 {
        print()
    }
    
    
    printarEnergia()
    printarInventario()
    
    var mapaComObjetos = mapaAtual.mapaDesenhadoComObjetos
    mapaComObjetos[personagem.posicao.y][personagem.posicao.x].desenho = personagem.direcaoPadrao
    for i in 0..<mapaComObjetos.count {
        for j in 0..<mapaComObjetos[0].count {
            print(mapaComObjetos[i][j].desenho ,terminator: "");
        }
        
    }
    
    printarDevagar(texto: "\n\n" + mapaAtual.fraseInicial, velocidade: velocidadeTexto, completo: textoCompleto)
        
    if(!textoCompleto){
        textoCompleto = true
    }
    
    print()
    
}

func printarInventario() {

    var vetorInvDesenhado:[[[String]]] = []
    let terminador = ["│", "┼", "│", "┼", "│"]

    for i in 0..<personagem.inventario.count {

        vetorInvDesenhado.append(desenhoCaixa(index: i, desenho: personagem.inventario[i].desenho,
                                              quantidade: personagem.inventario[i].quantidade))

    }

for i in 0..<vetorInvDesenhado[0].count {
    for k in 0..<vetorInvDesenhado.count {
         for j in 0..<vetorInvDesenhado[k][i].count {

            print(vetorInvDesenhado[k][i][j],
                  terminator: j == vetorInvDesenhado[k][i].count - 1 &&
                   k == vetorInvDesenhado.count - 1
                    ? terminador[i] : "")
        }

    }
     print()
}
    

 }

func desenhoCaixa(index: Int, desenho: String, quantidade: Int) -> [[String]] {

    return [
        ["│", " ", String(index), index < 10 ? " " : ""],
        ["┼", "─", "─", "─"],
        ["│", " ", desenho, " "],
        ["┼", "─", "─", "─"],
        ["│", "x", String(quantidade), quantidade < 10 ? " " : ""]
    ]

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
    
    print(personagem.nome + " - Nível " + String(personagem.nivel) + " (" + String(personagem.xp) + "/" + String(personagem.xpNecessario) + ")")
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

func printarEscolhas(escolhas: [String]){
    
    for i in 0..<escolhas.count{
        print(i + 1, ".", escolhas[i])
    }
    
    var escolha = Int(readLine()!)!
    
    while(escolha != 1 && escolha != 2){
        print("Escolha inválida. Digite novamente.")
        escolha = Int(readLine()!)!
    }
    
    if(escolha == 1){
        printarDevagar(texto: "Wallis: Jovem, você vai se arrepender desta decisão. Eu perdi tudo… E você terá um fim trágico igual a mim.", velocidade: velocidadeTexto, completo: false)
        readLine()
    }else if(escolha == 2){
        printarDevagar(texto: "Wallis: Você é bom… Não deixe a caverna te corromper…", velocidade: velocidadeTexto, completo: false)
        readLine()
    }
}

func ganharXP(quantidade: Int){
    personagem.xp += quantidade
    
    if(personagem.xp >= personagem.xpNecessario){
        print("Subiu de nível!")
        personagem.nivel += 1
        
        personagem.xp -= personagem.xpNecessario
        personagem.xpNecessario = Int(Double(personagem.xpNecessario) * 1.5)
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
