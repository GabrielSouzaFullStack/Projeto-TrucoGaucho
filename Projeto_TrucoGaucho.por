programa {
  funcao inicio() {
    //chamando a função menu incial.
    menuInicial()
  }

  //função para chamar o menu.
  funcao menuInicial(){
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

          escreva("1. Receber as cartas.\n2. Ver pontuação.\n")
          leia(menu)

          //Com este escolha o usuário pode escolher entre ver sua mão de cartas ou ver sua pontuação.
          escolha(menu){
            caso 1: 
              escreva("cartas\n\n")
            pare

            caso 2:
              escreva("Pontuação.\n\n")
            pare

            caso contrario:
              escreva("Opção inválida!\n\n")
          } 
        pare

        caso 0:

        pare

        caso contrario:
          escreva("Opção inválida!\n\n")
      }
    }enquanto(num != 0)
  }
}
