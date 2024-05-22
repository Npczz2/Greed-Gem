//
//  main.swift
//  Challenge 1
//
//  Created by HEITOR IVAZA LOPES on 08/05/24.
//

import Foundation

print("Seja bem-vindo a Lust for Ore!")

comeco()

func comeco() {
    
    print("""

        1 - Iniciar jogo
        2 - Tutorial
        3 - Sair

    """)
    
    switch readLine() {
        
    case "1":
        loopGame()
        break
    case "2":
        chamarTutorial(completo: true)
        comeco()
        break
    case "3":
        exit(0)
        break
    default:
        print("opcao invalida, tente novamente")
        comeco()
        break
        
        
    }
}





