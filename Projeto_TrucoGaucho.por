programa {
  funcao inicio() {
    inteiro num, menu

    faca{
      escreva("::::: Jogo de truco :::::\n1. Iniciar partida.\n0. Sair.\n\n")
      leia(num)

      escolha(num){
        caso 1: 
          escreva("Iniciando a partida...\n")

          escreva("1. Receber as cartas.\n2. Ver potuação.\n")
          leia(menu)

          escolha(menu){
            caso 1: 
              escreva("cartas\n\n")
            pare

            caso 2:
              escreva("Pontuação.\n\n")
            pare
          } 
        pare

        caso 0:

        pare
      }

    }enquanto(num != 0)
  }
}
