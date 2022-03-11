clc

## C�digo: M�todo da Secante.
## Crit�rio de parada: A partir de um valor (chamado de C na fun��o) o algoritmo verifica sec
## o f(x) naquele ponto, vezes 10 elevado a C � menor que 0.999.
## Foi utilizado x_i, x_ii e x_iii para representar os tais X(k-1), X(k) e X(k+1)
## sendo o x_i e x_ii os chutes iniciais, a partir da�, x_iii ser� sempre a ultima itera��o.


##Fun��o dada ao grupo: 4 cos(x) - raiz(x)
function [a, ga] = funcao_da_questao(x)
  a = (4*cos(x)) - sqrt(x);
  ##A Fun��o retorna o valor para um dado X
endfunction

function metodo_secante(x_i, x_ii, c)
  ##Atribui inicialmente as vari�veis com cast para o tipo double, foi encontrado problemas de precisao sem utilizar o cast.
  x_i = double(x_i); ## X(k-1)
  x_ii = double(x_ii); ## X(k)
  x_iii = double(0); ## X(k+1)
  
  #In�cio do loop do algoritmo, com m�ximo de 50 itera��es.
  for k = 1:50
    #Calcula inicialmente o numerador da f�rmula
    x_iii = (x_i * funcao_da_questao(x_ii)) - (x_ii * funcao_da_questao(x_i));
    #Em seguida, o denominador e aplica a divis�o
    x_iii = x_iii / (funcao_da_questao(x_ii) - funcao_da_questao(x_i));
    #Aqui, acontece a reatribui��o, o X(k+1) se torna o novo X(k) e o antigo X(k) se torna o X(k-1)
    x_i = x_ii;
    x_ii = x_iii;
    ##Crit�rio de parada, a partir do numero de casas decimais fornecidas.
    ##if abs(funcao_da_questao(x_iii) * power(10,c)) < 0.999
          #Imprime na tela o valor da ultima itera��o ap�s o crit�rio de converg�ncia ser atingido.
          printf("\nSECANTE:\nX encontrado: %f\nF(x) minimo:%f\nIteracao: %f\n",x_iii, funcao_da_questao(x_iii), k);
          ##break;
    ##endif
  endfor  
  
  endfunction

 metodo_secante(0,2,6);