//
//  main.swift
//  Domino
//
//  Created by Igor Dourado  on 20/03/23.
//

import Foundation

struct Peca{
    var lado1 : Int = 0
    var lado2 : Int = 0
}

var string0 = ""
var string1 = ""
var string2 = ""
var string3 = ""
var string4 = ""

var stringa = ""
var stringb = ""
var stringc = ""
var stringd = ""
var stringe = ""


var jogadora = ""
var jogadorb = ""
var jogadorc = ""
var jogadord = ""


enum Pessoas {
    case jogador1, jogador2, jogador3, jogador4
    
    var description: String {
        switch self {
        case .jogador1:
            return jogadora
        case .jogador2:
            return jogadorb
        case .jogador3:
            return jogadorc
        case .jogador4:
            return jogadord
       
        }
    }
}

enum Erros : Error {
    case opcaoInvalida
    case noInt
    
    var description: String {
        switch self {
        case .opcaoInvalida:
            return "Opção inválida, digite uma dentre as mostradas"
        case .noInt:
            return "Digite apenas números"
        }
    }
}

print(#"""
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⠟⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁ ⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⠀⣶⡆⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠸⠿⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿                                                                               _______
⣿⠀ ⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿           88                                88                  /⠿⠿/         /______/|
⣿⠀⣶⡦⠀ ⣶⡆⠀⠙⢿⣿⣧⠀⠸⠿⠂⠀⠀⠀⠀⠀⠸⠿⠂⠀⠙⢿⣿⣿           88                                ""                 /⠿⠿/         |     o ||
⣿⠀⠀⠀⠀⠀⠀⢀⣴⠆⠀⠙⢿⣷⣄⠀⠀⠀⠀ ⠀⠀⠀⢀⣴⠟⠀ ⠙⣿           88                                                                ⎟   o   ⎟⎟
⣿⠀⣶⡦⠀⢀⣴⠟⠁⠀⣶⡆⠀⠙⢿⣷⣄⠀⠸⠿⠀⢀⣴⠟⠁⠀⠺⠿⠀⣿   ,adPPYb,88  ,adPPYba,  88,dPYba,,adPYba,  88 8b,dPPYba,   ,adPPYba,       | o     ||
⣿⣄ ⠀⣴⠟⠁⠀⠀⠀ ⠀⠀⠀⠀⠙⢿⣷⣄⠀⠰⠟⠁⠀⠀⠀⠀⠀⠀⣿  a8"    `Y88 a8"     "8a 88P'   "88"    "8a 88 88P'   `"8a a8"     "8a      ⎟-------⎟⎟
⣿⣿⣷⣄⠀ ⣶⡆⠀⠀⠀⠀⠀ ⣶⡆⠀⢻⣿⣷⣄⠀⠀⠀⠀⠀⠺⠿⠀⣿  8b       88 8b       d8 88      88      88 88 88       88 8b       d8      ⎟ o   o ⎟⎟
⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣴⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀ ⠀⣿  "8a,   ,d88 "8a,   ,a8" 88      88      88 88 88       88 "8a,   ,a8"      ⎟   o   ⎟⎟
⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⣶⡆⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠸⠿⠀⣿   `"8bbdP"Y8  `"YbbdP"'  88      88      88 88 88       88  `"YbbdP"'       | o   o ||
⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄  ⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣴⣿                                                                             ⎟_______⎟/
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
"""#)
print("\n")
sleep(2)

var ultima : Int
var primeira : Int

//var pecas : [String : Peca] = ["🁶" : Peca(lado1: 1, lado2: 3)]


var todas = [Peca]()
for i in 0...6{
    for j in i...6{
        todas.append(Peca(lado1: i, lado2: j))
    }
}


print("Digite o nome do jogador 1 :")
jogadora = readLine()!
if jogadora.count == 0{
    jogadora = "Anônimo 1"
}
print("Digite o nome do jogador 2 :")
jogadorb = readLine()!
if jogadorb.count == 0{
    jogadorb = "Anônimo 2"
}
print("Digite o nome do jogador 3 :")
jogadorc = readLine()!
if jogadorc.count == 0{
    jogadorc = "Anônimo 3"
}

print("Digite o nome do jogador 4 :")
jogadord = readLine() ?? "Anônimo 4"
if jogadord.count == 0{
    jogadord = "Anônimo 4"
}


var jogadores = [String : [Peca]]()
//jogadores["Manoel"] =

todas.shuffle()
var numero = todas.firstIndex(where: {$0.lado1 ==  6 && $0.lado2 == 6})
var nome = [0 : Pessoas.jogador1.description , 1 : Pessoas.jogador2.description , 2 : Pessoas.jogador3.description , 3 : Pessoas.jogador4.description ]

var rodada = numero! / 7
var vez = nome[rodada]
jogadores[Pessoas.jogador1.description] = Array(todas[0...6])
jogadores[Pessoas.jogador2.description] = Array(todas[7...13])
jogadores[Pessoas.jogador3.description] = Array(todas[14...20])
jogadores[Pessoas.jogador4.description] = Array(todas[21...27])

func organiza(vetor : [Peca]) -> [Peca]{
    var vetor = vetor
    for i in 0...vetor.count-1{
        if vetor[i].lado2 == vetor[i].lado1{
            
            vetor.insert(Peca(lado1: vetor[i].lado1, lado2: vetor[i].lado2), at: 0)
            vetor.remove(at: i+1)
        }
    }
    return vetor
}


var corrente : [Peca] = [todas[numero!]]

var ind = jogadores[vez!]!.firstIndex(where: {$0.lado1 ==  6 && $0.lado2 == 6})
jogadores[vez!]?.remove(at: ind!)
rodada = (rodada+1) % 4

for _ in jogadores[nome[rodada]!]!{
    
}

var numeroEsquerda = corrente[0].lado1
var numeroDireita = corrente[0].lado2

func jogada(current: Peca, numDir: Int, numEsq: Int, arr : [Peca]) -> [Peca]{
    var current = current
    var arr = arr
    if (current.lado1 == numEsq || current.lado1 == numDir ){
        if (current.lado2 == numEsq || current.lado2 == numDir){ // dois lados possiveis
            if current.lado1 == current.lado2 && current.lado1 == numDir{
                arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                corrente.append(current)
                return arr
            }
            if current.lado1 == current.lado2 && current.lado1 == numEsq{
                arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                corrente.insert(current, at: 0)
                return arr
            }
            print("Digite 1 para esquerdo e 2 para direito")
            let input = Int(readLine() ?? "0")
            if input == 1{
                if current.lado1 == corrente[0].lado1{
                    
                    arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                    if corrente[0].lado1 < current.lado2{
                        let aux = current.lado1
                        current.lado1 = current.lado2
                        current.lado2 = aux
                    }
                    corrente.insert(current, at: 0)
                    return arr
                }
                arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                corrente.insert(current, at: 0)
                return arr
            }
            else if input == 2 {
                if current.lado2 == corrente[corrente.count-1].lado2{//
                    arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                    if corrente[corrente.count-1].lado2 > current.lado1{
                        let aux = current.lado1
                        current.lado1 = current.lado2
                        current.lado2 = aux
                    }
                    corrente.append(current)
                    return arr
                }
                arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
                corrente.append(current)
                return arr
            }
        }
        if current.lado1 == numDir  {
            arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
            corrente.append(current)
            return arr
        }
        if current.lado1 == numEsq{
            arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
            let aux = current.lado1
            current.lado1 = current.lado2
            current.lado2 = aux
            corrente.insert(current, at: 0)
            return arr
        }
    }
    if current.lado2 == numEsq {
        arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
        corrente.insert(current, at: 0)
        return arr
    }
    if current.lado2 == numDir{
        arr.remove(at: arr.firstIndex(where: {$0.lado1 ==  current.lado1 && $0.lado2 == current.lado2})!)
        let aux = current.lado1
        current.lado1 = current.lado2
        current.lado2 = aux
        corrente.append(current)
        return arr
    }
    
    return arr
}
    
func atualiza(){
    numeroDireita = corrente[corrente.count-1].lado2
    numeroEsquerda = corrente[0].lado1
}
        
        
func imprimeMao(pec: [Peca]){
    string0 = ""
    string1 = ""
    string2 = ""
    string3 = ""
    string4 = ""
    for x in pec{
        if x.lado1 == x.lado2 {
            string0 += "    "
            string1 += "┃\(x.lado1)̲̅┃ "
            string2 += "┃\(x.lado2)̲┃ "
            string3 += "    "
        } else{
            string0 += "      "
            string1 += "  ̲̲̲̲ "
            string2 += "⎥\(x.lado1)┃\(x.lado2)⎥ "
            string3 += " ‾‾‾‾ "
        }
    }
}
        
func imprimeJogo(vet : [Peca]){
    stringa = ""
    stringb = ""
    stringc = ""
    stringd = ""
    for x in vet{
        if x.lado1 == x.lado2 {
            stringa += "    "
            stringb += "┃\(x.lado1)̲̅┃"
            stringc += "┃\(x.lado2)̲┃"
            stringd += "   "
        } else{
            stringa += "      "
            stringb += "  ̲̲̲̲"
            stringc += "⎥\(x.lado1)┃\(x.lado2)⎥"
            stringd += " ‾‾‾‾"
        }
    }
}
    

func verificaOpcao(opt : String, vetorOpt : [Int]) throws -> Int{
    if (Int(opt) == nil){
        throw Erros.noInt
    }
    if (!vetorOpt.contains(Int(opt)!)){
        throw Erros.opcaoInvalida
    }
    return Int(opt)!
}

var jogofechado = 0
var teveVencedor = true
while(jogadores[Pessoas.jogador1.description]!.count > 0 && jogadores[Pessoas.jogador2.description]!.count > 0 && jogadores[Pessoas.jogador3.description]!.count > 0 && jogadores[Pessoas.jogador4.description]!.count > 0 ){
    jogadores[nome[rodada]!]! = organiza(vetor: jogadores[nome[rodada]!]!)
    print("\(String(repeating: "\n", count: 70))*MESA DO BUTECO*")
    imprimeJogo(vet: corrente)
    print(stringa)
    print(stringb)
    print(stringc)
    print(stringd)
    sleep(2)
    print ("*MÃO DO JOGADOR \(nome[rodada] ?? "FULANO")*")
    imprimeMao(pec: jogadores[nome[rodada]!]!)
    print(string0)
    print(string1)
    print(string2)
    print(string3)
    var opcoes = [Int]()
    for i in 0...jogadores[nome[rodada]!]!.count-1{
        if jogadores[nome[rodada]!]![i].lado1 == numeroDireita || jogadores[nome[rodada]!]![i].lado1 == numeroEsquerda || jogadores[nome[rodada]!]![i].lado2 == numeroDireita || jogadores[nome[rodada]!]![i].lado2 == numeroEsquerda {
            opcoes.append(i+1)
        }
    }
    var printa = ""
    for i in 0...jogadores[nome[rodada]!]!.count-1{
        if opcoes.contains(i+1) && jogadores[nome[rodada]!]![i].lado1 == jogadores[nome[rodada]!]![i].lado2{
            printa += "[\(i+1)] "
        }
        else if opcoes.contains(i+1){
            printa += " [\(i+1)]  "
        }
        else if jogadores[nome[rodada]!]![i].lado1 == jogadores[nome[rodada]!]![i].lado2{
            printa += "    "
        }
        else{
            printa += "      "
        }
    }
    print(printa)
    if opcoes.count == 0{
        print("Você passou!")
        jogofechado += 1
        if jogofechado >= 4{
            print("JOGO FECHADO! ")
            teveVencedor = false
            break
        }
        sleep(1)
    }else{
        print("Escolha o numero da peça dentre as opções possíveis \(opcoes) para jogar ⬇️ ")
        var leitura = readLine() ?? "0"
        var opc : Int = 10
        while (!opcoes.contains(opc) || Int(leitura) == nil ){
            do {
                opc = try verificaOpcao(opt: leitura, vetorOpt: opcoes)
            } catch Erros.noInt{
                leitura = "x"
                while(Int(leitura) == nil ){
                    print(Erros.noInt.description)
                    print("Escolha o numero da peça dentre as opções possíveis \(opcoes) para jogar ⬇️ ")
                    leitura = readLine() ?? "X"
                }
                opc = Int(leitura)!
            } catch Erros.opcaoInvalida {
                while(!opcoes.contains(opc)){
                    print(Erros.opcaoInvalida.description)
                    print("Escolha o numero da peça dentre as opções possíveis \(opcoes) para jogar ⬇️ ")
                    let auxi = readLine()
                    if Int(auxi!) == nil {
                        print("Digite apenas numero")
                    } else{
                        opc = Int(auxi!)!
                    }
                }
            } catch {
                print("Erro desconhecido, tente novamente")
            }
            

        }
            jogadores[nome[rodada]!] = jogada(current: jogadores[nome[rodada]!]![opc-1], numDir: numeroDireita, numEsq: numeroEsquerda, arr: jogadores[nome[rodada]!]!)
        atualiza()
        jogofechado = 0
    }
    rodada = (rodada+1) % 4
    sleep(UInt32(2.4))
}



if teveVencedor == true {
    for i in 0...nome.count-1{ //Anuncia o vencedorr
        if jogadores[nome[i]!]?.count == 0{
            print("Parabéns \(nome[i] ?? "x"), você ganhou!")
        }
    }
    
    
    
} else{ //Jogou fechou e haverá desempate pelo menor numero de pontos
    var menosPontos = 100
    var nomeJogador = ""
    var atual = 0
    for i in jogadores.keys{
        for j in jogadores[i]!{
            atual += j.lado1 + j.lado2
        }
        if atual < menosPontos{
            menosPontos = atual
            nomeJogador = i
        }
        atual = 0
    }
    print("Por ter apenas \(menosPontos) pontos em mãos, a menor quantia entre os jogadores, o jogador \(nomeJogador) ganhou!")
}

