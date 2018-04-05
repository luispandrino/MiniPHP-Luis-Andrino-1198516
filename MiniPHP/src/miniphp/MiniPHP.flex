
package miniphp;
import java.util.ArrayList;

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
%{
ArrayList<String> Tokens = new ArrayList<String>();
    ArrayList<String> TokensError = new ArrayList<String>();
   
    public void CrearToken(String tipo){
        if(tipo == "error")
        {
        Yytoken token = new Yytoken (yytext(),tipo,yyline,yycolumn);
        TokensError.add(token.toString());
        
        }
        else{
        Yytoken token = new Yytoken (yytext(),tipo,yyline,yycolumn);
        Tokens.add(token.toString());
        }
    }


        
        
%}

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
tipoCadena = ('([^'\n\\]|\\.)*')|(\"([^\"\n\\]|\\.)*\")
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
EXP_ESPACIO = \n|\r\n|" "

%%
{commentario} {CrearToken("Comentario");}
{inicioPHP} { CrearToken("Inicio_FinPHP");}
{operandosMatematicas} {CrearToken("Operandos Matematicos");}
{EXP_ESPACIO} {
    //ignorar
}
{coma} 
{
    CrearToken("Coma");
}
{puntoycoma} {CrearToken("Punto y coma");}
{parentesis} {CrearToken("Parentesis");}
{llaves} {CrearToken("Llaves");}
{corchetes} {CrearToken("Corchetes");}
{operandosCompracion} {CrearToken("Operando comparacion");}
{operandosAsignacion} {CrearToken("Operando asignacion");}
{operandoIncrementoDecremento} {CrearToken("Operando IncrementoDecremento");}
{booleanos} {CrearToken("bool");}
{constantesEnTiempoDeCompilacion} {CrearToken("Constantes Compi");}
{tipoEntero} {CrearToken("tipo entero");}
{tipoFlotante} {CrearToken("tipo flotante");}
{tipoCadena} {CrearToken("tipo caadena");}
{operandosLogicos} {CrearToken("Operando Logico");}
{identificadorVariable} {CrearToken("ID var");}
{identificadorConstante} {CrearToken("ID Const");}
{funcion} {CrearToken("funcion");}
{estructurasDeControl} {CrearToken("estructuras de control");}
{superglobal} {CrearToken("superglobal");}
{palabrasReservadas} {CrearToken("palabras reservadas");}
{variablesReservadas}       {CrearToken("variable reservada");}
{otrasVariablesReservadas}   {CrearToken("otras variables reservadas");}
{commentario}    {CrearToken("comentario");}
{recordset}     {CrearToken("recordset");}


//Errores
.   {CrearToken("ERROR");}