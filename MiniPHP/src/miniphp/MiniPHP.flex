
package miniphp;

class Yytoken{
    Yytoken (String token, String tipo, int linea, int columna){
        this.token = new String(token);
        this.tipo = tipo;
        this.linea = linea;
        this.columna = columna;
    } 
    public String token;
    public String tipo;
    public int linea;
    public int columna;

    public String toString() {
        return "Token : "+token+" C.Lexico: "+tipo+" ["+linea
        + "," +columna + "]";
    }
    
}








%%

%line
%column
%ignorecase
%function nextToken

a = [Aa]
b = [Bb]
c = [Cc]
d = [Dd]
e = [Ee]
f = [Ff]
g = [gG]
h = [hH]
i = [iI]
j = [jJ]
k = [kK]
l = [lL]
m = [mM]
n = [nN]
o = [oO]
p = [pP]
q = [qQ]
r = [rR]
s = [sS]
t = [tT]
u = [uU]
v = [vV]
w = [wW]
x = [xX]
y = [yY]
z = [zZ]

numerosDecimales = [1-9][0-9]*|0
numerosHexadecimal = 0[xX][0-9a-fA-F]+
numerosOctal = 0[0-7]+
numerosBinarios = 0[bB][01]+
identificador = [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*

inicioPHP = "<?"{p}{h}{p}|"?>"
operandosMatematicas = "+"|"-"|"/"|"*"|"**"
coma = ","
puntoycoma =";"
parentesis = "("|")"
llaves = "{"|"}"
corchetes = "["|"]"
operandosCompracion = "=="|"==="|"!="|"<>"|"!=="|"<"|">"|"<="|">="|"<=>"|"??"
operandosAsignacion = "="|"+="|"-="|"*="|"/="
operandoIncrementoDecremento = "++"|"--"
booleanos = {t}{r}{u}{e}|{f}{a}{l}{s}{e}
constantesEnTiempoDeCompilacion = "__"|"LINE"|"FILE"|"DIR"|"FUNCTION"|"CLASS"|"TRAIT"|"METHOD"|"NAMESPACE"|"__"
tipoEntero = [+-]?({numerosDecimales}|{numerosHexadecimal}|{numerosOctal}|{numerosBinarios})
tipoFlotante = [-+]?[0-9]*\.?[0-9]+([eE]{tipoEntero}.?[0-9]*)?
tipoCadena = '([^'\n]|\\')*'|\"([^\"\n]|\\\")*\"
operandosLogicos = "and"|"or"|"xor"|"!"|"&&"|"||"
identificadorVariable = "$"{identificador}
identificadorConstante = {identificador}
funcion = "function"
case = {c}{a}{s}{e}
include = {i}{n}{c}{l}{u}{d}{e}
continue = {c}{o}{n}{t}{i}{n}{u}{e}
return = {r}{e}{t}{u}{r}{n}
if = {i}{f}|"?"|":"
else = {e}{l}{s}{e}
elseif = {e}{l}{s}{e}{i}{f}
endif =	{e}{n}{d}{i}{f}
while =	{w}{h}{i}{l}{e}
do = {d}{o}
for = {f}{o}{r}
foreach = {f}{o}{r}{e}{a}{c}{h}
break =	{b}{r}{e}{a}{k}
switch = {s}{w}{i}{t}{c}{h}
estructurasDeControl = ({if}|{else}|{elseif}|{endif}|{while}|{do}|{for}|{foreach}|{break}|{switch}|{case}|{continue}|{return}|{include})
superglobal = "$"(GLOBALS|_(SERVER|GET|POST|FILES|COOKIE|SESSION|REQUEST|ENV))
otrasVariablesReservadas = "$"(php_errormsg|HTTP_RAW_POST_DATA|http_response_header|argc|argv|args)
variablesReservadas = {superglobal}|{otrasVariablesReservadas}
comentarioSimple = ("//"|"#")(.)*
comentarioMultiple = "/*"([^*/])*"*/"
commentario = {comentarioSimple}|{comentarioMultiple}
recordset = "$"recordset"["{tipoCadena}"]"
palabrasReservadas = __halt_compiler |break|clone|die|empty|endswitch|final|global|include_once|list|private|return|try|xor|abstract|callable|const|do|enddeclare|endwhile|finally|goto|instanceof|namespace|define|protected|static|unset|yield|and|case|continue|echo|endfor|eval|for|if|insteadof|new|public|switch|use|array|catch|declare|endforeach|exit|foreach|implements|interface|or|require|throw|var|as|class|default|elseif|endif|extends|function|include|isset|print|require_once|trait|while
//dos botones uno es selector de archivo pra el jFlex y otro boton PHP
//File reader del php buffer reader al file reader y luego haces una instancia jlex y le envias 
EXP_ESPACIO = \n|\r\n|" "

%%
{commentario} {System.out.println("comentario");}
{inicioPHP} {System.out.println("Inicio_Fin");}
{operandosMatematicas} {System.out.println("Operando Matematico");}
{EXP_ESPACIO} {
    //ignorar
}
{coma} 
{
    System.out.println("coma");
}
{puntoycoma} {System.out.println("Punto y coma");}
{parentesis} {System.out.println("Parentesis");}
{llaves} {System.out.println("llaves");}
{corchetes} {System.out.println("Corchetes");}
{operandosCompracion} {System.out.println("Operando comparacion");}
{operandosAsignacion} {System.out.println("Operando asignacion");}
{operandoIncrementoDecremento} {System.out.println("Operando IncrementoDecremento");}
{booleanos} {System.out.println("bool");}
{constantesEnTiempoDeCompilacion} {System.out.println("Constantes Compi");}
{tipoEntero} {System.out.println("tipo entero");}
{tipoFlotante} {System.out.println("tipo flotante");}
{tipoCadena} {System.out.println("tipo caadena");}
{operandosLogicos} {System.out.println("Operando Logico");}
{identificadorVariable} {System.out.println("ID var");}
{identificadorConstante} {System.out.println("ID Const");}
{funcion} {System.out.println("funcion");}
{estructurasDeControl} {System.out.println("estructuras de control");}
{superglobal} {System.out.println("superglobal");}
{palabrasReservadas} {System.out.println("palabras reservadas");}
{variablesReservadas}       {System.out.println("variable reservada");}
{otrasVariablesReservadas}   {System.out.println("otras variables reservadas");}
{commentario}    {System.out.println("comentario");}
{recordset}     {System.out.println("recordset");}


//Errores
.   {System.out.println("ERROR");}