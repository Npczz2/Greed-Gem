//
//  main.swift
//  Challenge 1
//
//  Created by HEITOR IVAZA LOPES on 08/05/24.
//

import Foundation

print("Hello, World!")
print("HAHAHAHAHAHAH")
print("heitor boboca")

//HAHAHAHAHAHA DOMI SEU OTARIO TO TENTANDO ESCREVER AQUI UM CODIGO PARECIDO DE MOVIMENTAÇÃO 🖕

var mapRender: [[String]] = [["/ ", "/ ", "/ ", "/ ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"]]

var playerPosX: Int = 1
var playerPosY: Int = 3

while(true){
    renderMap()
    
    var direction = readLine()
    
    if(direction == "cima"){
        if(mapRender[playerPosY - 1][playerPosX] != "/ "){
            mapRender[playerPosY][playerPosX] = "  "
            playerPosY = playerPosY - 1
        }
    }
}

func renderMap(){
    mapRender[playerPosY][playerPosX] = "o "

    for i in 0..<5{
        for j in 0..<5{
            print(mapRender[i][j], terminator: "")
        }
        print()
    }
}


