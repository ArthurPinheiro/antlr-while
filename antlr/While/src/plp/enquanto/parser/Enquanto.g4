grammar Enquanto;

programa : seqComando;     // sequência de comandos

seqComando: comando (';' comando)* ;

comando: ID (',' ID)* ':=' expressao (',' expressao)*                                          # atribuicao
       | 'skip'                                                                                # skip
       | 'se' booleano 'entao' comando ('senaose' booleano 'entao' comando)* 'senao' comando   # se
       | 'enquanto' booleano 'faca' comando                                                    # enquanto
       | 'para' ID 'de' expressao 'ate' expressao ('passo' expressao) 'faca' comando           # para
       | 'escolha' expressao ('caso' expressao ':' comando)                                    # escolha
       | 'funcao' '('PARAMETROS')' '=>' expressao
       | 'exiba' TEXTO                                                                         # exiba
       | 'escreva' expressao                                                                   # escreva
       | '{' seqComando '}'                                                                    # bloco
       ;


expressao: INT                                           # inteiro
         | 'leia'                                        # leia
         | ID '=' expressao                              # id
         | expressao '^'                                 # opBin        
         | expressao ('*' | '/') expressao               # opBin
         | expressao ('+' | '-') expressao               # opBin
         | '(' expressao ')'                             # expPar
         ;  

booleano: BOOLEANO                                       # bool
        | expressao 'OR'                                 # bool
        | expressao 'XOR'                                # bool
        | expressao '=' expressao                        # opRel
        | expressao '<=' expressao                       # opRel
        | expressao '>' expressao                        # opRel
        | expressao '<' expressao                        # opRel
        | expressao '>=' expressao                       # opRel
        | expressao '<>' expressao                       # opRel
        | 'nao' booleano                                 # naoLogico
        | booleano 'e' booleano                          # eLogico
        | '(' booleano ')'                               # boolPar
        ;


BOOLEANO: 'verdadeiro' | 'falso';
INT: ('0'..'9')+ ;
ID: ('a'..'z')+;
TEXTO: '"' .*? '"';
COMMA: ',';
PARAMETROS: ID (',' ID)*;

Comentario: '#' .*? '\n' -> skip;
Espaco: [ \t\n\r] -> skip;