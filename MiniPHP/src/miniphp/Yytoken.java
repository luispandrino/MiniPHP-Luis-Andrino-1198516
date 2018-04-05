/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniphp;

/**
 *
 * @author ASUS
 */
public class Yytoken {
     Yytoken (int numToken,String token, String tipo, int linea, int columna){
        //Contador para el número de tokens reconocidos
        this.numToken = numToken;
        //String del token reconocido
        this.token = new String(token);
        //Tipo de componente léxico encontrado
        this.tipo = tipo;
        //Número de linea
        this.linea = linea;
        //Columna donde empieza el primer carácter del token
        this.columna = columna;
    }
    //Métodos de los atributos de la clase
    public int numToken;
    public String token;
    public String tipo;
    public int linea;
    public int columna;
    //Metodo que devuelve los datos necesarios que escribiremos en un archive de salida
    public String toString() {
        return "Token #"+numToken+": "+token+" C.Lexico: "+tipo+" ["+linea
        + "," +columna + "]";
    }
}
