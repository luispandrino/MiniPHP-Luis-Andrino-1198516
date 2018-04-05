/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniphp;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class Clase {
LinkedList ListaPHP =new LinkedList();
LinkedList ListaPHPError = new LinkedList();

public String ruta ="";
public void CrearArchivo(){
ruta = ruta.substring(0,ruta.length()-3);
File ArchivoSalida = new File(ruta+"OUT");
BufferedWriter bw;
        try {
            //ArchivoSalida.out
            bw = new BufferedWriter(new FileWriter(ArchivoSalida));
            for(int i = 0; ListaPHP.size()> i; i++ ){
               bw.write(ListaPHP.get(i).toString());
            }
        } catch (IOException ex) {
            Logger.getLogger(Clase.class.getName()).log(Level.SEVERE, null, ex);
        }


}

}
