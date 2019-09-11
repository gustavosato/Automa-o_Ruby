def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Começaremos o jogo com você, #{nome}" 
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Muito difícil"
    puts "Escolha: "
    dificuldade = gets.to_i
end
##
def sorteia_numero(dificuldade)
    # if dificuldade == 1
    #     maximo = 30
    # else
    #     if dificuldade == 2
    #         maximo = 60
    #     else
    #         if dificuldade == 3
    #             maximo = 100
    #         else
    #             if dificuldade == 4
    #                 maximo = 150
    #             else
    #                 maximo = 200
    #             end
    #         end
    #     end
    # end
    case dificuldade 
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
    puts "Escolhendo um número entre 1 e #{maximo}...."
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado
end

def pede_numero (chutes, tentativa, limite_de_tentativas)
    puts "\n\n\n\n" 
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes ate agora: #{chutes}"
    puts "Entre com o numero"
    chute = gets.strip
    puts "Será que esta correto? Você escolheu: #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        ganhou
        return true
    end
    #else
    maior = numero_secreto > chute.to_i
    if maior
        puts "O numero secreto é maior!"
    else
        puts " O numero secreto é menor!"
    end
    false
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def joga (nome, dificuldade)

numero_secreto = sorteia_numero (dificuldade)

pontos_ate_agora = 1000
limite_de_tentativas = 5
chutes = []

# for tentativa in 1..limite_de_tentativas
#     chute = pede_numero(tentativa, limite_de_tentativas)
#     if verifica_se_acertou(numero_secreto, chute)
#         break
#     end
# end


#Early Return
    for tentativa in 1..limite_de_tentativas
        chute = pede_numero chutes, tentativa, limite_de_tentativas
        chutes << chute

        if nome == "gustavo"      CHEAT
            puts "Acertou!!!"
            break
        end

        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder

        # pontos_a_perder = (chute - numero_secreto) / 2.0
        # unless ponto_a_perder > 0       #CONTRARIO DO IF (A NÃO SER QUE), EVITAR USAR
        #     pontos_a_perder *= -1
        # end
        #pontos_ate_agora -= pontos_a_perder


        # chutes[total_de_chutes] = chute
        # total_de_chutes = total_de_chutes + 1

        break if verifica_se_acertou numero_secreto, chute
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

# while quer_jogar
#     joga nome, dificuldade
# end
loop do
    joga nome, dificuldade
    if nao_quer_jogar?
        break
    end
end
