import Foundation





var personagem = Personagem()
var mapaAtual = todasAsFases[1]
var velocidadeTexto: Double = 1
var textoCompleto: Bool = false


func loopGame() {
    
    print("\u{001B}[2J")
    print("Digite o nome do personagem: ")
    personagem.nome = readLine()!
    print("Digite a velocidade de digitação do texto (0.5; 1; 2; 5):")
    velocidadeTexto = Double(readLine()!)!
    
    print("\u{001B}[2J")
    printarDevagar(texto: "\nUm boato de uma jóia rara encontrada em uma caverna na Austrália foi espalhado pelo mundo. Várias pessoas, mesmo as sem experiência nas cavernas decidiram tentar obtê-la por conta de seu valor de venda. ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "\nEntretanto, a caverna na qual se encontrava a jóia era conhecida como a Toca Do Diabo, conhecida por sua taxa de mortalidade de 82,6%. Relatos de pessoas que conseguiram sair com vida dessa caverna contam que ela parece algo mágico, um labirinto que te prende na caverna conforme você avança. Mesmo assim, diversos civis cegos pelo dinheiro ignoraram os avisos do governo e adentraram nessas cavernas em busca do objeto raro. ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "\nA estimativa do governo é que 18 pessoas já morreram dentro da caverna desde o surgimento do boato.", completo: false)
    _ = readLine()
    print("\n─────────────────────────────────────────────────────────────────────\n")
    printarDevagar(texto: personagem.nome + " era um minerador experiente que trabalhava na maior mineradora de diamante da Austrália, chamada Hawks. Depois do boato da jóia lendária se espalhar entre seus colegas de trabalho, todos partiram o mais rápido possível para a Toca Do Diabo para procurá-la, deixando família, casa e emprego para trás. ▼", completo: false)
    _ = readLine()
    printarDevagar(texto: "\nTomado por um frio na barriga e um sentimento de adrelina que nunca havia sentido antes, " + personagem.nome + " decide ir atrás da jóia.", completo: false)
    _ = readLine()
    
    chamarTutorial(completo: false)
    
    mapaAtual.desenharObjetosMapa()
    personagem.posicao = mapaAtual.posicaoSpawnBoneco
    printarGameTeste();
    
    
    while(true) {
        
        if let entradaConfirmada = readLine() {
            if !entradaConfirmada.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                personagem.acaoDoTurno(entrada: entradaConfirmada)
            } else {
                printarGameTeste()
            }
        }
        
    }
}




func printarGameTeste() {
    
    print("\u{001B}[2J")
    printarEnergia()
    printarInventario()
    
    var mapaComObjetos = mapaAtual.mapaDesenhadoComObjetos
    mapaComObjetos[personagem.posicao.y][personagem.posicao.x].desenho = personagem.direcaoPadrao
    for i in 0..<mapaComObjetos.count {
        for j in 0..<mapaComObjetos[0].count {
            print(mapaComObjetos[i][j].desenho ,terminator: "");
        }
        
    }
    
    printarDevagar(texto: "\n\n" + mapaAtual.fraseInicial, completo: textoCompleto)
    
    if(!textoCompleto){
        textoCompleto = true
    }
    
    print()
    
}

func printarInventario() {
    
    print()
    var vetorInvDesenhado:[[[String]]] = []
    let terminador = ["│", "┼", "│", "┼", "│"]
    
    for i in 0..<personagem.inventario.count {
        
        vetorInvDesenhado.append(desenhoCaixa(index: i, desenho: personagem.inventario[i].desenho,
                                              quantidade: personagem.inventario[i].quantidade,
                                              interagivel: personagem.inventario[i].interacao != nil))
        
        
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
    print()
    
}

func desenhoCaixa(index: Int, desenho: String, quantidade: Int, interagivel: Bool) -> [[String]] {
    
    let indexString = String(index + 1);
    
    return [
        ["│", " ", interagivel ? indexString : indexString.black2(), index  < 9 ? " " : ""],
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

func printarDevagar(texto: String, completo: Bool){
    var textoConv = Array(texto)
    var velocidadeConv = 50000 / velocidadeTexto
    
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

func roubarItens(itens:[String]){
    
    for i in 0..<itens.count{
        switch(itens[i]){
        case "Pedra":
            var quantidade = Int.random(in: 1...7)
            personagem.adicionarAoInventario(item: ItemInventario("☗".black2(), quantidade: quantidade, nivel: 1))
            
            print("☗".black2() + " x" + String(quantidade))
            break
            
        case "Ferro":
            var quantidade = Int.random(in: 1...4)
            personagem.adicionarAoInventario(item: ItemInventario("▰".white(), quantidade: quantidade, nivel: 2))
            
            print("▰".white() + " x" + String(quantidade))
            break
            
        case "Torta":
            var quantidade = Int.random(in: 1...2)
            personagem.adicionarAoInventario(item: ItemInventario("◍".yellow(), quantidade: quantidade, nivel: 0))
            
            print("◍".yellow() + " x" + String(quantidade))
            
            break
            
        default:
            
            break
        }
    }
}

let textoTutorial = "────────────────────────────────────────────────────────────\nTUTORIAL\n\nComandos:\n- Andar: Direção (W, A, S, D) + quantidade de casas a andar\n- Olhar para direção: W, A, S, D\n- Interagir/Quebrar: E\n- Usar item do inventário: I + número da caixa do item\n\nMineração:\nPara minerar, olhe para o minério e use o botão de interação (E). Você começa com uma picareta de madeira e precisa melhorá-la para quebrar minérios superiores. Exemplo:\n" +
"༒".yellow() + "   →  " + "☗".black2() + " Pedra\n" +
"༒".black2() + "   →  " + "▰".white() + " Ferro\n" +
"༒".white() + "   →  " + "▮".yellow() + " Ouro\n" +
"༒".yellow2() + "   →  " + "◆".green() + " Esmeralda\n" +
"༒".green2() + "   →  " + "✦".cyan2() + " Diamante\n" +
"༒".cyan2() + "   →  " + "●".red() + " Rubí\n" +
"༒".red() + "   →  " + "⋇".magenta() + " Jóia lendária\n" +
"\nEnergia:\nQuebrar minérios e descer andares gasta energia. Caso sua energia acabe, você desmaia e perde o jogo. Para recuperar energia, você pode comer uma comida (" + " ◍ ".yellow() + "❦ ".red() + "∝ ".cyan() + ") do seu inventário (I + posição da comida).\n\nDescer andares e XP:\nPara descer para um novo andar da caverna, você precisa encontrar a escada (⇊) debaixo de uma pedra aleatória e interagir com ela (E). Quebrar pedras e minérios também te concede XP, fator decisivo nos combates. \n\n NPCs:\n NPCs são representados com Letras na cor azul (Ex: " + "Y".magenta() + "). Você pode interagir ('E') com eles.\n" + "Dica: Melhore sua picareta antes de descer de andar, pois você não conseguirá subir de volta. ▼".italic()

func chamarTutorial(completo: Bool){
    if(completo){
    print(textoTutorial)
    }else{
        print("────────────────────────────────────────────────────────────\nTUTORIAL\n\nComandos:\n- Andar: Direção (W, A, S, D) + quantidade de casas a andar\n- Olhar para direção: W, A, S, D\n- Interagir/Quebrar: E\n- Usar item do inventário: I + número da caixa do item\n\n Digite 1 para mais informações.\n────────────────────────────────────────────────────────────")
        var input = readLine()
        if(input == "1"){
            print(textoTutorial)
        } else {
            return
        }
            
        
    }
    
    _ = readLine()
    
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
    func bgCyan() -> String { return juntar("46") }
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
