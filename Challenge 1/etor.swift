//
//  etor.swift
//  Challenge 1
//
//  Created by HEITOR IVAZA LOPES on 10/05/24.
//

import Foundation

var mapRender: [[String]] = [["/ ", "/ ", "/ ", "/ ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "  ", "  ", "  ", "/"],
                             ["/ ", "/ ", "/ ", "/ ", "/"]]

var playerPosX: Int = 2
var playerPosY: Int = 1

var andar: Int = 1

renderMinerals()

while(true){
    print("Andar", String(andar))
    renderMap()

    print("Qual a direção desejada?")
    var direction = readLine()

switch direction{
    case "cima":
        if(mapRender[playerPosY - 1][playerPosX] == "  "){
            mapRender[playerPosY][playerPosX] = "  "
            playerPosY = playerPosY - 1
        }
        else if(mapRender[playerPosY - 1][playerPosX] == "┼ "){
            print("Andar concluído. Passando para o andar", String(andar + 1))
            andar += 1
            resetPhase()
        }
        else{
            print("Impossível avançar para essa direção.")
        }
        break
        
    case "baixo":
        if(mapRender[playerPosY + 1][playerPosX] == "  "){
            mapRender[playerPosY][playerPosX] = "  "
            playerPosY = playerPosY + 1
        }
        else if(mapRender[playerPosY + 1][playerPosX] == "┼ "){
            print("Andar concluído. Passando para o andar", String(andar + 1))
            andar += 1
            resetPhase()
        }
        else
        {
            print("Impossível avançar para essa direção.")
        }
        break
        
    case "esquerda":
        if(mapRender[playerPosY][playerPosX - 1] == "  "){
            mapRender[playerPosY][playerPosX] = "  " //Posição atual vira vazia
            playerPosX = playerPosX - 1
        }
        else if(mapRender[playerPosY][playerPosX - 1] == "┼ "){
            print("Andar concluído. Passando para o andar", String(andar + 1))
            andar += 1
            resetPhase()
        }
        else
        {
            print("Impossível avançar para essa direção.")
        }
        break
        
    case "direita":
        if(mapRender[playerPosY][playerPosX + 1] == "  "){
            mapRender[playerPosY][playerPosX] = "  " //Posição atual vira vazia
            playerPosX = playerPosX + 1
        }
        else if(mapRender[playerPosY][playerPosX + 1] == "┼ "){
            print("Andar concluído. Passando para o andar", String(andar + 1))
            andar += 1
            resetPhase()
        }
        else
        {
            print("Impossível avançar para essa direção.")
        }
        break
        
        
    default:
        print("Valor inválido.")
        break
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

func renderMinerals(){
    var mineralPosX = Int.random(in: 0..<5)
    var mineralPosY = Int.random(in: 0..<5)
    
    if(mapRender[mineralPosX][mineralPosY] == "  "){
        mapRender[mineralPosX][mineralPosY] = "┼ "
        print("Minério renderizado")
    }
    else
    {
        renderMinerals()
    }
}

func resetPhase(){
    
    for i in 0..<5{
        for j in 0..<5{
            if(mapRender[i][j] == "o " || mapRender[i][j] == "┼ "){
                mapRender[i][j] = "  "
            }
        }
    }
    
    renderMinerals()
    
    playerPosX = 2
    playerPosY = 1
}
    
