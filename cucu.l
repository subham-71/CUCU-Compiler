%{
#include <stdio.h>
#include "cucu.tab.h"
FILE *lex_out ;
%}
%%

int                     fprintf(lex_out, "TYPE : int \n" ) ; return INT_TYPE;
char[ ]\*               fprintf(lex_out, "TYPE : char* \n" ) ; return CHAR_TYPE;
[ \t\n]+                ;
if                      fprintf(lex_out, "CONDITIONAL : if \n" ) ; return IF;
else                    fprintf(lex_out, "ELSE : if \n" ) ; return ELSE;
while                   fprintf(lex_out, "LOOP : while \n") ; return WHILE;
return                  fprintf(lex_out, "RETURN : return \n" ) ; return RETURN;
[a-zA-Z_][a-zA-Z0-9_]*  fprintf(lex_out, "IDENTIFIER : %s \n", yytext ) ; yylval.str=strdup(yytext);return VAR;
[0-9]+                  fprintf( lex_out, "NUMBER : =  %s \n", yytext) ;  yylval.n=atoi(yytext); return INT;
\"[a-zAA-Z_0-9 ]*\"     {  
                            fprintf(lex_out, "STRING : ");
                            for(int i=1;i<yyleng-1;i++)
                            { 
                                fprintf(lex_out, "%c",yytext[i]);
                            }
                            fprintf(lex_out, "\n");
                            yylval.str=strdup(yytext);
                            return STR;
                        }
\/\/.*                  ;

\/\*[^*]*[*]+([^/][^*]*[*]+)*\/  ;

"="                     fprintf(lex_out, "ASSIGN : =  \n") ; return EQUALS;
"=="                    fprintf(lex_out, "RELATION : == \n") ; return EQ;
"!="                    fprintf(lex_out, "RELATION : != \n") ; return NOT_EQ;
"<"                     fprintf(lex_out, "RELATION : < \n") ; return LESS_THAN;
"<="                    fprintf(lex_out, "RELATION : <= \n") ; return LESS_THAN_EQ;
">"                     fprintf(lex_out, "RELATION : > \n") ; return GRTR_THAN;
">="                    fprintf(lex_out, "RELATION : >= \n") ; return GRTR_THAN_EQ;
"("                     fprintf(lex_out, "PARANTHESIS : ( \n") ; return LEFT_PAREN;
")"                     fprintf(lex_out, "PARANTHESIS : ) \n") ; return RIGHT_PAREN;
"{"                     fprintf(lex_out, "PARANTHESIS : { \n") ; return LEFT_CURLY_BRACE;
"}"                     fprintf(lex_out, "PARANTHESIS : } \n") ; return RIGHT_CURLY_BRACE;
","                     fprintf(lex_out, "COMMA : , \n") ; return COMMA;
"+"                     fprintf(lex_out, "PLUS : + \n") ; return PLUS;
"-"                     fprintf(lex_out, "MINUS : - \n") ; return MINUS;
"*"                     fprintf(lex_out, "MULTIPLY : * \n") ; return MULTIPLY;
"/"                     fprintf(lex_out, "DIVIDE : / \n") ; return DIVIDE;
";"                     fprintf(lex_out, "SEMICOLON : ; \n") ; return SEMICOLON;
%%

int yywrap(){
    return 1;
}
