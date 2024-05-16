//
//  main.swift
//  Challenge 1
//
//  Created by HEITOR IVAZA LOPES on 08/05/24.
//

import Foundation

loopGame()

//
//var desenhoCaverna1 = """
//
//       ┌┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┐             &
//   ┌┬┬┬┤┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼├┬┬┬┬┬┬┐      &
//   ├┼┼┼┼ . . . . . . . . . . . . .├┼┼┼┼┼┼┼┬┐    &
//   │ . . . . . . . . . . . . . . . . . . ├┼┤    &
// ┌┬│ . . . . . . ┌┬┬┬┬┬┬┬┐ . . . . . . . . └┬┐  &
// ├┼┘ . . . . . ┌┬┘┼┼┼┼┼┼┼┼┬┐ . . . . . . . . ││ &
//││ . . . . . . └─┐         │ . . . . . . . ┌┼┘  &
//││ . . . . . . . └─────────┘ . . . . . . . │    &
// ├┬┬┬┐ . . . . . . . . . . . . . . . ┌┬┬┬┬┬┘    &
// └┼┼┼┼┬┐. . . . . . . . . . . ┌┬┬┬┬┬┬┼┼┼┼┼┘     &
//   └┼┼┼┼┬┬┬┬┬┬┬┐ . . . . ┌┬┬┬┬┼┼┼┼┼┼┘           &
//               └┬┬┬┬┬┬┬┬┬┘                      &
//""";
//
//carroamarelo(mapa: desenhoCaverna1)
//
//func carroamarelo (mapa: String) {
//    
//    var vetor = mapa.split(separator: "&")
//    var matriz: [[Espaco]] = []
//   
//    for i in 0..<vetor.count {
//        var vetor2 = Array(vetor[i])
//        matriz.append([])
//        for j in 0..<vetor2.count {
//            matriz[i].append(Espaco(String(vetor2[j])))
//        }
//    }
//  
//    imprimiMatrizSeparada(matriz: matriz)
//    
//}
//
//func imprimiMatrizSeparada(matriz: [[Espaco]]) {
//    for i in 0..<matriz.count {
//        for j in 0..<matriz[0].count {
//            print(matriz[i][j], terminator: "")
//        }
//      
//    }
//}
