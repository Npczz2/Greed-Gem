//
//  Carro.swift
//  Challenge 1
//
//  Created by GUILHERME MATEUS SOUSA SANTOS on 10/05/24.
//

import Foundation

var palavra: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

func testePati() {
    
    let vetor = palavra.split(separator: " ")
    
    for i in 0..<vetor.count {
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        print()
        for j in 0..<i {
            print(vetor[j] + " ", terminator: "")
        }
        
        do {
            usleep(100000)
        }
    }
    
    
    
    
    
}
