programa {
  //Importando a biblioteca Util
  inclua biblioteca Util --> u
  //Declaração das variáveis de escopo global.
  cadeia cartasBaralho[40]
  inteiro pontosCartas[40]
  logico repitacaoCarta[40]
  cadeia maoJogadorA[3], maoJogadorB[3]
  inteiro pontosJogadorA = 0, pontosJogadorB = 0
  inteiro rodadasGanhasJogadorB = 0, rodadasGanhasJogadorA = 0
  inteiro partidasGanhasJogadorA = 0
  inteiro partidasGanhasJogadorB = 0
  logico iniciaJogada = verdadeiro // Definição da variável que determina qual jogador começará jogando na próxima partida.

  funcao inicio() {
    //chamando a função menu incial.
    menuInicial()
  }

  // função para criar lógica de jogadas para os dois jogadores.
  funcao jogadas(){
    atribuirPontos()
    pontosJogadorA = 0
    pontosJogadorB = 0

    para(inteiro rodada=0; rodada<= 2; rodada++){
      escreva("\n--- Partidas ", rodada + 1, " ---\n\n")
 
      destribuirCartas(maoJogadorA)
      destribuirCartas(maoJogadorB)

      inteiro escolhaDaCarta
      logico vezDeJogar = iniciaJogada
      inteiro cartasRestantesJogadorA = 3
      inteiro cartasRestantesJogadorB = 3
      inteiro terminarPartida = 0
      logico jogada = verdadeiro

      enquanto(terminarPartida < 12 e jogada == verdadeiro){
        // laço de repetição para continuar até que ambos os jogadores tenham jogado todas as suas cartas.
        enquanto(cartasRestantesJogadorA > 0 ou cartasRestantesJogadorB > 0){
          se(vezDeJogar e cartasRestantesJogadorA > 0){
            se(partidasGanhasJogadorA >= 0 e rodadasGanhasJogadorA >= 0){
              escreva("Mão Jogador A\n")
              escreva("Partidas ganhas: ",partidasGanhasJogadorA, "\n")
              
              escreva("Mão Jogador B\n")
              escreva("Partidas ganhas: ",partidasGanhasJogadorB, "\n")
              
            }
            escreva("Vez do jogador A. Sua mão é essa:\n")
            escreva(maoJogadorA, "\nQual deseja jogar?\nCarta 1, 2 ou 3: ")
            leia(escolhaDaCarta)

            // laço de repetição para garantir que a carta certa seja jogada.
            enquanto(escolhaDaCarta < 1 ou escolhaDaCarta > 3 ou maoJogadorA[escolhaDaCarta - 1] == "      "){
              escreva("Carta inválida! Tente outra:\n")
              leia(escolhaDaCarta)
            }

          escreva("\nA carta ", maoJogadorA[escolhaDaCarta - 1], " está na mesa!\n")
          pontosJogadorA = pontosJogadorA + obterPontosDaCarta(maoJogadorA[escolhaDaCarta - 1])
          maoJogadorA[escolhaDaCarta - 1] = "      " // marca a carta como jogada.
          cartasRestantesJogadorA-- // diminui uma carta da mão do jogador A, para garantir que o looping termine quando todos jogadores estiverem sem cartas na mão.

          vezDeJogar = falso
          
          // Vez do outro jogador.   
          }senao se(cartasRestantesJogadorB > 0){
            se(partidasGanhasJogadorB >= 0 e rodadasGanhasJogadorB <= 0){
              escreva("Mão Jogador B\n")
              escreva("Partidas ganhas: ",partidasGanhasJogadorB, "\n")
             
              escreva("Mão Jogador A\n")
              escreva("Partidas ganhas: ",partidasGanhasJogadorA, "\n")
             
            }
            escreva("Vez do jogador B. Sua mão é essa:\n")
            escreva(maoJogadorB, "\nQual deseja jogar?\nCarta 1, 2 ou 3: ")
            leia(escolhaDaCarta)

            enquanto(escolhaDaCarta < 1 ou escolhaDaCarta > 3 ou maoJogadorB[escolhaDaCarta - 1] == "      "){
              escreva("Carta inválida! Tente outra:\n")
              leia(escolhaDaCarta)
            }

          escreva("\nA carta ", maoJogadorB[escolhaDaCarta - 1], " está na mesa!\n")
          pontosJogadorB = pontosJogadorB + obterPontosDaCarta(maoJogadorB[escolhaDaCarta - 1])
          maoJogadorB[escolhaDaCarta - 1] = "      " // marca a carta como jogada.
          cartasRestantesJogadorB-- // diminui uma carta da mão do jogador A, para garantir que o looping termine quando todos jogadores estiverem sem cartas na mão.


          vezDeJogar = verdadeiro

          }
        }

        se(pontosJogadorA > pontosJogadorB){
          rodadasGanhasJogadorA ++
          iniciaJogada = verdadeiro // Jogador A ganhou a jogada, começa jogando na próxima Rodada.
        }senao{
          rodadasGanhasJogadorB ++
          iniciaJogada = falso // Jogador B ganhou a jogada, começa jogando na próxima Rodada.
        }

        se(pontosJogadorA > pontosJogadorB){
          escreva("\nO jogador A venceu a Rodada!\n\n")
          terminarPartida++
          jogada = falso
        }senao{
          escreva("\nO jogador B venceu a Rodada!\n\n")
          terminarPartida++
          jogada = falso
        }

        se(partidasGanhasJogadorA >= 2){
          partidasGanhasJogadorA ++
          escreva("Jogador A venceu a Partida!! \n\n")
          //iniciaJogada = verdadeiro // Jogador A ganhou a jogada, começa jogando na próxima Partida.
        }senao{
          partidasGanhasJogadorB ++
          escreva("Jogador B venceu a Partida!! \n\n")
          //iniciaJogada = falso // Jogador B ganhou a jogada, começa jogando na próxima Partida.
        }
      }
    }   
  }

  funcao menuInicial(){
    exibirTituloVisual()
    menu()
  }

  //função do menu para controlar o que o jogador deseja fazer.
  funcao menu(){
    inteiro num, menu

    faca{
      escreva("::::: Jogo de truco :::::\n1. Iniciar partida.\n0. Sair.\n\n")
      leia(num)

      escolha(num){
        caso 1: 
          escreva("Iniciando a partida...\n")

          escreva("1. Receber as cartas.\n2. Ver pontuaÃ§Ã£o.\n")
          leia(menu)

          //Com este escolha o usuÃ¡rio pode escolher entre ver sua mÃ£o de cartas ou ver sua pontuaÃ§Ã£o.
          escolha(menu){
            caso 1: 
             jogadas(maoJogadorA, maoJogadorB)
            pare

            caso 2:
              atribuirPontos()
              escreva("Pontuação final:\n")
              escreva("Jogador A: ", partidasGanhasJogadorA, " rodada(s) vencida(s).\n")
              escreva("Jogador B: ", partidasGanhasJogadorB, " rodada(s) vencida(s).\n\n")
              partidasGanhasJogadorA = 0
              partidasGanhasJogadorB = 0
            pare

            caso contrario:
              escreva("OpÃ§Ã£o invÃ¡lida!\n\n")
          } 
        pare

        caso 0:

        pare

        caso contrario:
          escreva("OpÃ§Ã£o invÃ¡lida!\n\n")
      }
    }enquanto(num != 0)
  }
  
  //FunÃ§Ã£o para exibiÃ§Ã£o do layout do titulo no menu principal.
  funcao exibirTituloVisual(){
    escreva(" ########   ######   ##    ##    ####    #####              ####     ##     ##   ##    ####   ##   ##   #####\n")
    escreva(" #  ##  #   ##  ##   ##    ##   ##  ##  ##   ##            ##  ##   ####    ##   ##   ##  ##  ##   ##  ##   ##\n")
    u.aguarde(500)
    escreva("    ##      ##  ##   ##    ##  ##       ##   ##           ##       ##  ##   ##   ##  ##       ##   ##  ##   ##\n")
    escreva("    ##      #####    ##    ##  ##       ##   ##           ##       ##  ##   ##   ##  ##       #######  ##   ##\n")
    u.aguarde(500)
    escreva("    ##      ## ##    ##    ##  ##       ##   ##           ##  ###  ######   ##   ##  ##       ##   ##  ##   ##\n")
    escreva("    ##      ##  ##   ##    ##   ##  ##  ##   ##            ##  ##  ##  ##   ##   ##   ##  ##  ##   ##  ##   ##\n")
    escreva("  ######    #### ##    #####     ####    #####              #####  ##  ##    #####     ####   ##   ##   #####\n")
    u.aguarde(500)
  }
  
  //funÃ§Ã£o para inicializar o baralho para a distribuiÃ§Ã£o das cartas para os jogadores A e B.
  funcao inicializarBaralho(){
    //DefiniÃ§Ã£o das 40 cartas do baralho com os 4 naipes.
    //DefiniÃ§Ã£o dos espaÃ§os dos vetores para o naipe paus.
    cartasBaralho[0] = "4 de Paus"// - 28 pontos
    cartasBaralho[1] = "5 de Paus"// - 29 pontos
    cartasBaralho[2] = "6 de Paus"// - 30 pontos
    cartasBaralho[3] = "7 de Paus"// - 31 pontos
    cartasBaralho[4] = "11 de Paus"// - 32 pontos
    cartasBaralho[5] = "12 de Paus"// - 33 pontos
    cartasBaralho[6] = "13 de Paus"//- 34 pontos
    cartasBaralho[7] = "1 de Paus"// - 39 pontos
    cartasBaralho[8] = "2 de Paus"// - 36 pontos
    cartasBaralho[9] = "3 de Paus"// - 37 pontos
    //DefiniÃ§Ã£o dos espaÃ§os dos vetores para o naipe Copa.    
    cartasBaralho[10] = "4 de Copa"//- 28 pontos
    cartasBaralho[11] = "5 de Copa"//- 29 pontos
    cartasBaralho[12] = "6 de Copa"//- 30 pontos
    cartasBaralho[13] = "7 de Copa"//- 31 pontos
    cartasBaralho[14] = "11 de Copa"//- 32 pontos
    cartasBaralho[15] = "12 de Copa"// - 33 pontos
    cartasBaralho[16] = "13 de Copa"// - 34 pontos
    cartasBaralho[17] = "1 de Copa"//- 35 pontos
    cartasBaralho[18] = "2 de Copa"//- 36 pontos
    cartasBaralho[19] = "3 de Copa"//- 37 pontos
    //DefiniÃ§Ã£o dos espaÃ§os dos vetores para o naipe Espada.   
    cartasBaralho[20] = "4 de Espada"//- 28 pontos
    cartasBaralho[21] = "5 de Espada"//- 29 pontos
    cartasBaralho[22] = "6 de Espada"//- 30 pontos
    cartasBaralho[23] = "7 de Espada"//- 38 pontos
    cartasBaralho[24] = "11 de Espada"//- 32 pontos
    cartasBaralho[25] = "12 de Espada"//- 33 pontos
    cartasBaralho[26] = "13 de Espada"//- 34 pontos
    cartasBaralho[27] = "1 de Espada"//- 40 pontos
    cartasBaralho[28] = "2 de Espada"//- 36 pontos
    cartasBaralho[29] = "3 de Espada"//- 37 pontos
    //DefiniÃ§Ã£o dos espaÃ§os dos vetores para o naipe Ouro.  
    cartasBaralho[30] = "4 de Ouro"// - 28 pontos
    cartasBaralho[31] = "5 de Ouro"// - 29 pontos
    cartasBaralho[32] = "6 de Ouro"//- 30 pontos
    cartasBaralho[33] = "7 de Ouro"//- 37 pontos
    cartasBaralho[34] = "11 de Ouro"//- 32 pontos
    cartasBaralho[35] = "12 de Ouro"//- 33 pontos
    cartasBaralho[36] = "13 de Ouro"//- 34 pontos
    cartasBaralho[37] = "1 de Ouro"//- 35 pontos
    cartasBaralho[38] = "2 de Ouro"//- 36 pontos
    cartasBaralho[39] = "3 de Ouro"//- 37 pontos
  }

  //funÃ§Ã£o para atribuir valor de tipo inteiro ao vetor de uma string.
  funcao atribuirPontos (){

    pontosCartas[0] = 28
    pontosCartas[1] = 29
    pontosCartas[2] = 30
    pontosCartas[3] = 31
    pontosCartas[4] = 32
    pontosCartas[5] = 33
    pontosCartas[6] = 34
    pontosCartas[7] = 39
    pontosCartas[8] = 36
    pontosCartas[9] = 37
    pontosCartas[10] = 28
    pontosCartas[11] = 29
    pontosCartas[12] = 30
    pontosCartas[13] = 31
    pontosCartas[14] = 32
    pontosCartas[15] = 33
    pontosCartas[16] = 34
    pontosCartas[17] = 35
    pontosCartas[18] = 36
    pontosCartas[19] = 37
    pontosCartas[20] = 28
    pontosCartas[21] = 29
    pontosCartas[22] = 30
    pontosCartas[23] = 38
    pontosCartas[24] = 32
    pontosCartas[25] = 33
    pontosCartas[26] = 34
    pontosCartas[27] = 40
    pontosCartas[28] = 36
    pontosCartas[29] = 37
    pontosCartas[30] = 28
    pontosCartas[31] = 29
    pontosCartas[32] = 30
    pontosCartas[33] = 37
    pontosCartas[34] = 32
    pontosCartas[35] = 33
    pontosCartas[36] = 34
    pontosCartas[37] = 35
    pontosCartas[38] = 36
    pontosCartas[39] = 37
  }

  funcao inteiro obterPontosDaCarta(cadeia carta){
    para(inteiro i=0; i<40; i++){
      se(cartasBaralho[i] == carta){
        retorne pontosCartas[i]
      }
    }
    retorne 0
  }

  //funÃ§Ã£o para distribuiÃ§Ã£o das cartasBaralho para os jogadores, sem destribuir para mÃ£os que jÃ¡ possuem cartas.
 funcao destribuirCartas(cadeia maoJogador[] ){
  inicializarBaralho()
  inteiro carta_sorteada

   
    para(inteiro i=0; i<3; i++){
      carta_sorteada = u.sorteia(0, 39)
      se(repitacaoCarta[carta_sorteada]==verdadeiro){
        // Se a carta jÃ¡ foi sorteada, tenta novamente.
        i--
      }senao{
        // Atribui o nome da carta ao vetor de mÃ£o do jogador.
        maoJogador[i] = cartasBaralho[carta_sorteada]
        repitacaoCarta[carta_sorteada] = verdadeiro
      }
    }

  }

}
