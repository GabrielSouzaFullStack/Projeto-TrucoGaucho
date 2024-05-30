programa {
  //Importando a biblioteca Util
  inclua biblioteca Util --> u
  //Declaração das variaves de escopo global.
  cadeia cartasBaralho[40]
  logico repitacaoCarta[40]
  cadeia maoJogadorA[3], maoJogadorB[3]

  funcao inicio() {
    inicializarTruco()
  }

  //funcao de inicializar o jogo de truco.
  funcao inicializarTruco(){
    inicializarBaralho()
    destribuirCartas(maoJogadorA, cartasBaralho)
    destribuirCartas(maoJogadorB, cartasBaralho)
    escreva("Mão do Jogador A: ", maoJogadorA, "\nMão do Jogador B: ", maoJogadorB)
  }
  //função para inicializar o baralho para a distribuição das cartas para os jogadores A e B.
  funcao inicializarBaralho(){
    //Definição das 40 cartas do baralho com os 4 naipes.
    //Definição dos espaços dos vetores para o naipe paus.
    cartasBaralho[0] = "4 de Paus"// - 28 pontos
    cartasBaralho[1] = "5 de Paus"// - 29 pontos
    cartasBaralho[2] = "6 de Paus"// - 30 pontos
    cartasBaralho[3] = "7 de Paus"// - 31 pontos
    cartasBaralho[4] = "11 de Paus"//- 32 pontos
    cartasBaralho[5] = "12 de Paus"//- 33 pontos
    cartasBaralho[6] = "13 de Paus"//- 34 pontos
    cartasBaralho[7] = "1 de Paus"// - 39 pontos
    cartasBaralho[8] = "2 de Paus"// - 36 pontos
    cartasBaralho[9] = "3 de Paus"// - 37 pontos
    //Definição dos espaços dos vetores para o naipe Copa.    
    cartasBaralho[10] = "4 de Copa"// - 28 pontos
    cartasBaralho[11] = "5 de Copa"// - 29 pontos
    cartasBaralho[12] = "6 de Copa"// - 30 pontos
    cartasBaralho[13] = "7 de Copa"// - 31 pontos
    cartasBaralho[14] = "11 de Copa"// - 32 pontos
    cartasBaralho[15] = "12 de Copa"// - 33 pontos
    cartasBaralho[16] = "13 de Copa"// - 34 pontos
    cartasBaralho[17] = "1 de Copa"// - 35 pontos
    cartasBaralho[18] = "2 de Copa"// - 36 pontos
    cartasBaralho[19] = "3 de Copa"// - 37 pontos
    //Definição dos espaços dos vetores para o naipe Espada.   
    cartasBaralho[20] = "4 de Espada"// - 28 pontos
    cartasBaralho[21] = "5 de Espada"// - 29 pontos
    cartasBaralho[22] = "6 de Espada"// - 30 pontos
    cartasBaralho[23] = "7 de Espada"// - 38 pontos
    cartasBaralho[24] = "11 de Espada"// - 32 pontos
    cartasBaralho[25] = "12 de Espada"// - 33 pontos
    cartasBaralho[26] = "13 de Espada"// - 34 pontos
    cartasBaralho[27] = "1 de Espada"// - 40 pontos
    cartasBaralho[28] = "2 de Espada"// - 36 pontos
    cartasBaralho[29] = "3 de Espada"// - 37 pontos
    //Definição dos espaços dos vetores para o naipe Ouro.  
    cartasBaralho[30] = "4 de Ouro"// - 28 pontos
    cartasBaralho[31] = "5 de Ouro"// - 29 pontos
    cartasBaralho[32] = "6 de Ouro"// - 30 pontos
    cartasBaralho[33] = "7 de Ouro"// - 37 pontos
    cartasBaralho[34] = "11 de Ouro"//- 32 pontos
    cartasBaralho[35] = "12 de Ouro"//- 33 pontos
    cartasBaralho[36] = "13 de Ouro"//- 34 pontos
    cartasBaralho[37] = "1 de Ouro"// - 35 pontos
    cartasBaralho[38] = "2 de Ouro"// - 36 pontos
    cartasBaralho[39] = "3 de Ouro"// - 37 pontos
  }

  //função para distribuição das cartasBaralho para os jogadores, sem destribuir para mãos que já possuem cartas.
  funcao destribuirCartas(cadeia cartasBaralho[], cadeia maoJogador[]){
    inteiro carta_sorteada
    para(inteiro i=0; i<3; i++){
      carta_sorteada = u.sorteia(0, 39)
      se(repitacaoCarta[carta_sorteada]==verdadeiro){
        // Se a carta já foi sorteada, tenta novamente.
        i--
      }senao{
        // Atribui o nome da carta ao vetor de mão do jogador.
        cartasBaralho[i] = maoJogador[carta_sorteada]
        repitacaoCarta[carta_sorteada] = verdadeiro
      }
    }


  }
}

