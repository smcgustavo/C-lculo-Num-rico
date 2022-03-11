clc

## Código: Método da Secante.
## Critério de parada: A partir de um valor (chamado de C na função) o algoritmo verifica sec
## o f(x) naquele ponto, vezes 10 elevado a C é menor que 0.999.
## Foi utilizado x_i, x_ii e x_iii para representar os tais X(k-1), X(k) e X(k+1)
## sendo o x_i e x_ii os chutes iniciais, a partir daí, x_iii será sempre a ultima iteração.


##Função dada ao grupo: 4 cos(x) - raiz(x)
function [a, ga] = funcao_da_questao(x)
  a = (4*cos(x)) - sqrt(x);
  ##A Função retorna o valor para um dado X
endfunction

function metodo_secante(x_i, x_ii, c)
  ##Atribui inicialmente as variáveis com cast para o tipo double, foi encontrado problemas de precisao sem utilizar o cast.
  x_i = double(x_i); ## X(k-1)
  x_ii = double(x_ii); ## X(k)
  x_iii = double(0); ## X(k+1)
  
  #Início do loop do algoritmo, com máximo de 50 iterações.
  for k = 1:50
    #Calcula inicialmente o numerador da fórmula
    x_iii = (x_i * funcao_da_questao(x_ii)) - (x_ii * funcao_da_questao(x_i));
    #Em seguida, o denominador e aplica a divisão
    x_iii = x_iii / (funcao_da_questao(x_ii) - funcao_da_questao(x_i));
    #Aqui, acontece a reatribuição, o X(k+1) se torna o novo X(k) e o antigo X(k) se torna o X(k-1)
    x_i = x_ii;
    x_ii = x_iii;
    ##Critério de parada, a partir do numero de casas decimais fornecidas.
    ##if abs(funcao_da_questao(x_iii) * power(10,c)) < 0.999
          #Imprime na tela o valor da ultima iteração após o critério de convergência ser atingido.
          printf("\nSECANTE:\nX encontrado: %f\nF(x) minimo:%f\nIteracao: %f\n",x_iii, funcao_da_questao(x_iii), k);
          ##break;
    ##endif
  endfor  
  
  endfunction

 metodo_secante(0,2,6);