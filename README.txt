Name : Subham Subhasis Sahoo
Entry No : 2020CSB1317

========================================

To run the program :

For Sample1.cu : 

flex cucu.l
bison -d cucu.y
gcc cucu.tab.c lex.yy.c -lfl -o cucu
./cucu Sample1.cu

For Sample2.cu : 

flex cucu.l
bison -d cucu.y
gcc cucu.tab.c lex.yy.c -lfl -o cucu
./cucu Sample2.cu



========================================

VARIABLE DECLARATION :

Type of variables allowed :
int , char* 

int a ;
int a = 8 ;
int a = (8+9) ;
int a  = 8+9 ;

char *ch;
char *ch = "string" ;

========================================

FUNCTION_DECLARATION AND DESCRIPTION :

Only functions with return type int and char * are allowed. You can declare a fucntion as follows :

You can pass any function arguement while seprately declaring the function.

int func(int a,int b) ;

int func(int a,int b){
    int c =a+b;
    return c;
}
-------------------------
int func(int a,int b) ;

func(int a,int b){
    int c =a+b;
    return c;
}

-------------------------
You can also describe the function at the time of declaration.

int func(int a , int b){
    int c =a+b;
    return c;
}


========================================


FUNCTION CALL

You can call a function by the following ways :

int x;
x = func(i + 2, s);

----------------------------

int x = func(i+2,s);
========================================

CONDITIONAL STATEMENTS :

if (a<b)
{
    a=6;
}

-------------------------

if(a<b)
{
    a=6;
}
else
{
    a=5;
}

----------------------------

IF statement should have the statements written in curly braces after condition. 
IF statement need not be necessarily followed by ELSE statement.
Nested IFs are also allowed.

========================================

LOOP :

Only while loop is supported by the language. 

while(1<2){
    a = a+1;
}

----------------------------

 while (1)
    {
        if (1 < 2)
        {
            a = 5;
            if (2 < 3)
            {
                b = 5;
            }
        }
    }

============================================

Order in which the Parser.txt is printed is based on the recursion process.
IF-ELSE statements :
While printing if statement , it will print the condition, identifiers and operands etc first, after that it will print "IF" statement.
WHILE LOOP statements :
While printing while loop statements , it will print the condition, identifiers and operands etc. first, after that it will print "WHILE LOOP" statement.

When encountered an error :
"Syntax Error" will be printed in Parser.txt.
Nothing else would be printed in Lexer.txt after error is detected in particular line.

Bitwise operations such as & , | , ^ and others aren't supported.





