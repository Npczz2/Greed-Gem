# Sobre o projeto

- Primeiro Challange Apple Developer Academy | Senac turma 2024 - 2025 e primeiro projeto em Swift.
- RPG de console utilizando conceitos básicos e explorando a linguagem.
- Greed Gem é um jogo de sobrevivência e exploração, onde o objetivo é coletar a joia lendária, e, para isso, o jogador deve gerenciar muito bem seus recursos coletados pelo mapa. Durante seu progresso, diversas situações inusitadas poderão acontecer, onde o jogador terá escolhas a fazer, podendo mudar completamente o final do jogo.

# Resumo da jogabilidade

- #### Apesar de ser um jogo de terminal, ele possui mecânicas de um jogo 2D, tendo movimentação e a direção que o personagem, representado por uma seta vermelha (“→”), está virado no mapa.

    ![Andando](https://github.com/Npczz2/Joguinho-c1/blob/main/Assets/andando.gif) 

*Os comandos para virar o personagem, são: W, A, S e D.*

- #### Durante a exploração, o jogador irá se deparar com itens espalhados pelo mapa, e como se trata de um jogo de cavernas e mineração, os itens encontrados serão pedras e minérios, espalhados aleatoriamente pelo mapa, representados pelos seguintes caracteres:

    - Pedra ( <span style="color: blue;">☗</span> )
    - Ferro ( ▰ )
    - Ouro ( ▮ )
    - Esmeralda ( ◆ )
    - Diamante ( ✦ )
    - Rubi ( ● )
    - Joia lendária ( ⋇ )

- #### Para coletar uma pedra ou um minério, o jogador deve ficar a frente do mesmo e interagir (apertando “E”):

    ![Quebando coisas](https://github.com/Npczz2/Joguinho-c1/blob/main/Assets/quebandocoisas.gif) 

- #### Para usar algum item, é preciso colocar (”i ” + posição do inventário):

    ![Inventario](https://github.com/Npczz2/Joguinho-c1/blob/main/Assets/inventario.gif)

- #### Para passar de nível (ou ir mais a fundo na caverna no nosso contexto), o jogador deve encontrar a "passagem secreta", que está localizada em baixo de uma pedra aleatória:

    ![Quebando coisas](https://github.com/Npczz2/Joguinho-c1/blob/main/Assets/passandodefase.gif) 

# Funcionalidades futuras (fazer maanha)

    - Cada fase do jogo é criada passando alguns parâmetros que pode ser randomizado (com excessão das interações dos NPCS), então seria muito legal criar um algoritmo para gerar mapas aleatórios, assim seria possível criar fases infinitas.
    - Cada mapa é salvo como um desenho dentro do código, tendo um algoritmo para mapear esse desenho.
    
    ![Passando de fase](https://github.com/Npczz2/Joguinho-c1/blob/main/Assets/Captura de Tela 2024-06-19 às 17.15.13.png) 
  
# Tecnologias utilizadas
- Swift
- Conceitos utilizados <- link da sheet cheat

# Como executar o jogo

- Executar o arquivo "Greed Gem" na pasta *(caminho da pasta amanha aqui)*

# Requisitos

- É necessário possuir um MAC, extensões de Swift no windows ou compiladores online não funcionarão.
- Sempre rode o projeto diretamente no terminal nativo do MAC, o terminal do XCode não suporte cores.
  
```bash
# clonar repositório
git clone https://github.com/Npczz2/Joguinho-c1
```

# Autor

- [Guilherme Mateus Sousa Santos](https://github.com/Domiuau)
- [Heitor Ivaza Lopes](https://github.com/Npczz2)
