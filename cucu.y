%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror(char *error_msg);
    int yylex();    
    FILE *lex_out, *yyout , *yyin;
%}

%token INT_TYPE CHAR_TYPE IF ELSE WHILE RETURN EQUALS EQ NOT_EQ LESS_THAN LESS_THAN_EQ GRTR_THAN GRTR_THAN_EQ LEFT_PAREN RIGHT_PAREN LEFT_CURLY_BRACE RIGHT_CURLY_BRACE PLUS MINUS DIVIDE MULTIPLY COMMA SEMICOLON  
%union{
    int n;
    char *str;
}
%token <str> STR
%token <str> VAR

       
%token <n> INT

%left PLUS MINUS
%left MULTIPLY DIVIDE
%left LEFT_PAREN RIGHT_PAREN

%%

PROGRAM : PROGRAM_BODY  ; 

PROGRAM_BODY : FUNCTION_DECLARATION PROGRAM_BODY| FUNCTIONS PROGRAM_BODY| VAR_DEC PROGRAM_BODY | ;

VAR_DEC : INT_TYPE VAR SEMICOLON { 
                
                fprintf(yyout,"Variable type : int \n");
                fprintf(yyout,"Identifier : %s \n\n",$2);      
          } | 
          INT_TYPE VAR EQUALS EXPR SEMICOLON {
           
              fprintf(yyout,"Variable type : int \n");
              fprintf(yyout,"Identifier : %s \n\n",$2);    
          } |
          VAR EQUALS EXPR SEMICOLON {
     
              fprintf(yyout,"Identifier : %s \n\n",$1);    
          } | 
          CHAR_TYPE VAR SEMICOLON {
            
              fprintf(yyout,"Variable type : int \n");
              fprintf(yyout,"Identifier : %s \n\n",$2);    
          }| 
          CHAR_TYPE VAR EQUALS VAR SEMICOLON {
            
              fprintf(yyout,"Variable type : int \n");
              fprintf(yyout,"Identifier : %s \n\n",$2);    
          }| 
          CHAR_TYPE VAR EQUALS STR SEMICOLON {
       
              fprintf(yyout,"Variable type : char \n");
              fprintf(yyout,"Identifier : %s \n\n",$2);    
          } ;

EXPR :  INT                  {fprintf(yyout,"Integer :  %d \n", $1);}
        | VAR                {fprintf(yyout,"Variable : %s \n", $1);}
        | EXPR PLUS EXPR     {fprintf(yyout,"Arithmetic Operator : + \n");}
        | EXPR MINUS EXPR    {fprintf(yyout,"Arithmetic Operator : - \n");}
        | EXPR MULTIPLY EXPR {fprintf(yyout,"Arithmetic Operator : * \n");}
        | EXPR DIVIDE EXPR   {fprintf(yyout,"Arithmetic Operator : / \n");}
        | LEFT_PAREN EXPR RIGHT_PAREN;

FUNCTION_DECLARATION : INT_TYPE VAR LEFT_PAREN ARGS RIGHT_PAREN SEMICOLON 
                       {
                           fprintf(yyout,"Function Declaration \n");
                           fprintf(yyout,"Return Type : int \n");
                           fprintf(yyout,"Function name : %s \n",$2);
                       }
                       | CHAR_TYPE VAR LEFT_PAREN ARGS RIGHT_PAREN SEMICOLON 
                       {
                           fprintf(yyout,"Function Declaration \n");
                           fprintf(yyout,"Return Type : char \n");
                           fprintf(yyout,"Function name : %s \n",$2);
                       };

FUNCTIONS: INT_TYPE VAR LEFT_PAREN ARGS RIGHT_PAREN LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE
            {
                fprintf(yyout,"Function \n");
                fprintf(yyout,"Return Type : int \n");
                fprintf(yyout,"Function name : %s \n",$2);
            } |
           CHAR_TYPE VAR LEFT_PAREN ARGS RIGHT_PAREN LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE
            {
                fprintf(yyout,"Function \n");
                fprintf(yyout,"Return Type : char \n");
                fprintf(yyout,"Function name : %s \n",$2);
            } |
            VAR LEFT_PAREN ARGS RIGHT_PAREN LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE
            {
                fprintf(yyout,"Function \n");
                fprintf(yyout,"Function name : %s \n",$1);
            }
             ;

FUNC_BODY : VAR_DEC FUNC_BODY | 
            IF LEFT_PAREN CONDITION RIGHT_PAREN LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE ELSE_COND
            {
                fprintf(yyout,"IF statement : \n");
            } |
            WHILE LEFT_PAREN CONDITION RIGHT_PAREN LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE FUNC_BODY 
            {
                fprintf(yyout,"WHILE LOOP  \n");
            } |
            VAR EQUALS VAR LEFT_PAREN CALL_ARGS RIGHT_PAREN SEMICOLON FUNC_BODY 
            {
                fprintf(yyout,"FUNCTION CALL  \n");
                fprintf(yyout,"Return var name : %s \n \n",$1);
                fprintf(yyout,"Function name : %s \n \n",$3);

            }|
            INT_TYPE VAR EQUALS VAR LEFT_PAREN CALL_ARGS RIGHT_PAREN SEMICOLON FUNC_BODY 
            {
                fprintf(yyout,"FUNCTION CALL  \n");
                fprintf(yyout,"Return Type : int \n");

                fprintf(yyout,"Return var name : %s \n \n",$2);
                fprintf(yyout,"Function name : %s \n \n",$4);

            }|
            CHAR_TYPE VAR EQUALS VAR LEFT_PAREN CALL_ARGS RIGHT_PAREN SEMICOLON FUNC_BODY 
            {
                fprintf(yyout,"FUNCTION CALL  \n");
                fprintf(yyout,"Return Type : char \n");
                fprintf(yyout,"Return var name : %s \n \n",$2);
                fprintf(yyout,"Function name : %s \n \n",$4);

            }|
            RETURN INT SEMICOLON |
            RETURN VAR SEMICOLON |
            RETURN STR SEMICOLON | ;

ELSE_COND : ELSE LEFT_CURLY_BRACE FUNC_BODY RIGHT_CURLY_BRACE FUNC_BODY 
            {
                fprintf(yyout,"ELSE statement : \n");
            }| FUNC_BODY ;

CONDITION : INT 
            {
                fprintf(yyout,"CONDITION :  %d > 0 \n",$1);

            }
            | VAR 
            {
                fprintf(yyout,"CONDITION :  %s > 0 \n",$1);

            }
            | INT LOGIK INT 
            {
                
                fprintf(yyout,"First Operand : %d \n",$1);
                fprintf(yyout,"Second Operand : %d \n",$3);
            }|
            VAR LOGIK VAR
            {
               
                fprintf(yyout,"First Operand : %s \n",$1);
                fprintf(yyout,"Second Operand : %s \n",$3);
               
            } ;

LOGIK : EQ 
        {
            fprintf(yyout,"CONDITION : Equals\n");
        }| 
        NOT_EQ 
        {
            fprintf(yyout,"CONDITION : Not Equals\n");
        }| 
        GRTR_THAN 
        {
            fprintf(yyout,"CONDITION : Greater than\n");
        }|
        GRTR_THAN_EQ 
        {
            fprintf(yyout,"CONDITION : Greater than equals\n");
        }|
        LESS_THAN 
        {
            fprintf(yyout,"CONDITION : Less than \n");
        }| 
        LESS_THAN_EQ
        {
            fprintf(yyout,"CONDITION : Less than equals\n");
        } ; 
CALL_ARGS : EXPR CALL_ARGS
        {
            fprintf(yyout,"Function Arguement : \n");
        }| 
        COMMA CALL_ARGS | ;
ARGS :  INT_TYPE VAR ARGS
        {
            fprintf(yyout,"Function Arguement : %s\n",$2);
        }
        | CHAR_TYPE VAR ARGS
        { 
            fprintf(yyout,"Function Arguement : %s\n",$2);
        }
        | COMMA ARGS | ;
%%

int yyerror (char *text){
    fprintf(yyout, "Syntax Error !");
}

int main(int argc , char *argv[])
{
    yyin = fopen(argv[1],"r");
    lex_out = fopen("Lexer.txt","w");
    yyout = fopen("Parser.txt","w");
    yyparse();
    return 0;
}


