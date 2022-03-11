clc

## Código: Método da Bisseção
## Critério de parada: A partir de um valor (chamado de C na função) o algoritmo verifica sec
## o f(x) naquele ponto, vezes 10 elevado a C é menor que 0.999.
## No mais, a variável A e B continuam sendo as variáveis oscilantes do algoritmo, e f_a, f_b e f_c sendo F(a), F(b) e F(c).


##Função dada ao grupo: 4 cos(x) - raiz(x)
function [a, ga] = funcao_da_questao(x)
  a = (4*cos(x)) - sqrt(x);
  ##A Função retorna o valor para um dado X
endfunction

function bissecao(a,b,c)  
   ##Calcula um meio inicial pro algoritmo
   meio = double(0);
   ##Inicia o loop de iterações com o máximo de 50 iterações
   for k = 1:50
       ##Calcula os F(A), F(B) e F((a+b)/2) para ser usado na comparação futura
       f_a = funcao_da_questao(a);
       f_b = funcao_da_questao(b); 
       f_meio = funcao_da_questao(meio);
       ##Regras para atribuição do meio a uma das variáveis
       if ((f_a * f_meio) < 0) #Quando o meio precisa ser o novo B
         b = meio;
       elseif ((f_a * f_meio) > 0) #Quando o meio precisa ser o novo A
          a = meio;
       endif
       ##Atualização do novo meio a partir da reatribuição anterior
       meio = (a + b) / 2;
       ##Critério de parada, a partir do numero de casas decimais fornecidas.
       if abs(funcao_da_questao(meio) * power(10,c)) < 0.999
          #Imprime na tela o valor da ultima iteração após o critério de convergência ser atingido.
          printf("\nBISSECAO:\nX encontrado: %f\nF(x) minimo:%f\nIteracao: %i\n",meio, funcao_da_questao(meio), k);
          break;
       endif
   endfor
endfunction
bissecao(0,8,6);
