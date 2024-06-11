programa {
  //Importando a biblioteca Util
  inclua biblioteca Util --> u
  //Declaração das variaves de escopo global.
  cadeia cartasBaralho[40]
  logico repitacaoCarta[40]
  cadeia maoJogadorA[3], maoJogadorB[3]

  funcao inicio() {
    jogadas(maoJogadorA, maoJogadorB)
  }

  // função para criar lógica de jogadas para os dois jogadores.
  funcao jogadas(cadeia maoJogadorA[], cadeia maoJogadorB[]){
    inteiro escolhaDaCarta
    logico vezDeJogar = verdadeiro
    inteiro cartasRestantesJogadorA = 3
    inteiro cartasRestantesJogadorB = 3

    // laço de repetição para continuar até que ambos os jogadores tenham jogado todas as suas cartas.
    enquanto(cartasRestantesJogadorA > 0 ou cartasRestantesJogadorB > 0){
      se(vezDeJogar e cartasRestantesJogadorA > 0){
        escreva("\nVez do jogador A. Sua mão é essa:\n")
        escreva(maoJogadorA, "\nQual deseja jogar?\nCarta 1, 2 ou 3: ")
        leia(escolhaDaCarta)

        // laço de repetição para garantir que a carta certa seja jogada.
        enquanto(escolhaDaCarta < 1 ou escolhaDaCarta > 3 ou maoJogadorA[escolhaDaCarta - 1] == "      "){
          escreva("Carta inválida! Tente outra:\n")
          leia(escolhaDaCarta)
        }

      escreva("\nA carta ", maoJogadorA[escolhaDaCarta - 1], " está na mesa!\n")
      maoJogadorA[escolhaDaCarta - 1] = "      " // marca a carta como jogada.
      cartasRestantesJogadorA-- // diminui uma carta da mão do jogador A, para garantir que o looping termine quando todos jogadores estiverem sem cartas na mão.

      vezDeJogar = falso
        
      // Vez do outro jogador.   
      }senao se(cartasRestantesJogadorB > 0){
        escreva("\nVez do jogador B. Sua mão é essa:\n")
        escreva(maoJogadorB, "\nQual deseja jogar?\nCarta 1, 2 ou 3: ")
        leia(escolhaDaCarta)

        enquanto(escolhaDaCarta < 1 ou escolhaDaCarta > 3 ou maoJogadorB[escolhaDaCarta - 1] == "      "){
          escreva("Carta inválida! Tente outra:\n")
          leia(escolhaDaCarta)
        }

      escreva("\nA carta ", maoJogadorB[escolhaDaCarta - 1], " está na mesa!\n")
      maoJogadorB[escolhaDaCarta - 1] = "      " // marca a carta como jogada.
      cartasRestantesJogadorB-- // diminui uma carta da mão do jogador A, para garantir que o looping termine quando todos jogadores estiverem sem cartas na mão.

      vezDeJogar = verdadeiro

      }
    }
    escreva("Rodada terminou! Todas as cartas foram jogadas.\n")
  }
}