/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package miniphp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author ASUS
 */
public class MiniPHPForm extends javax.swing.JFrame {
    String PHP = "";
    String Jflex = ""; 

    /**
     * Creates new form MiniPHPForm
     */
    public MiniPHPForm() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField1 = new javax.swing.JTextField();
        btnJflex = new javax.swing.JButton();
        btnPHP = new javax.swing.JButton();
        txtRutaJFlex = new javax.swing.JTextField();
        txtRutaPHP = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();

        jTextField1.setText("jTextField1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        btnJflex.setText("Subir Archivo JFlex");
        btnJflex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnJflexActionPerformed(evt);
            }
        });

        btnPHP.setText("Subir Archivo PHP");
        btnPHP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPHPActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Rockwell", 1, 24)); // NOI18N
        jLabel1.setText("Analizador lexico PHP");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnJflex, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnPHP, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(32, 32, 32)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtRutaPHP, javax.swing.GroupLayout.DEFAULT_SIZE, 217, Short.MAX_VALUE)
                            .addComponent(txtRutaJFlex)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(72, 72, 72)
                        .addComponent(jLabel1)))
                .addGap(0, 24, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 32, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnJflex)
                    .addComponent(txtRutaJFlex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(31, 31, 31)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtRutaPHP, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnPHP))
                .addGap(46, 46, 46))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnJflexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnJflexActionPerformed
        // TODO add your handling code here:
          JFileChooser dialogo =new JFileChooser();
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("Archivo flex", "flex");
        File ficheroImagen;
        String rutaArchivo;
        dialogo.setFileFilter(filtro);
        int  valor=dialogo.showOpenDialog(this);
        if (valor==JFileChooser.APPROVE_OPTION){
            ficheroImagen = dialogo.getSelectedFile();
            rutaArchivo =ficheroImagen.getPath();
            txtRutaJFlex.setText(rutaArchivo); 
            Jflex = rutaArchivo;
            
            
        }
        jflex.Main.main(new String[] {Jflex});
    }//GEN-LAST:event_btnJflexActionPerformed

    private void btnPHPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPHPActionPerformed
        FileReader objFileReader =null;
        try {
            // TODO add your handling code here:
            JFileChooser dialogo =new JFileChooser();
            FileNameExtensionFilter filtro = new FileNameExtensionFilter("Archivo PHP", "php");
            File ficheroImagen;
            String rutaArchivoPHP;
            dialogo.setFileFilter(filtro);
            int  valor=dialogo.showOpenDialog(this);
            if (valor==JFileChooser.APPROVE_OPTION){
                ficheroImagen = dialogo.getSelectedFile();
                rutaArchivoPHP =ficheroImagen.getPath();
                txtRutaPHP.setText(rutaArchivoPHP);
                PHP = rutaArchivoPHP;
                
                
            }   objFileReader = new FileReader(PHP);
            BufferedReader objBufferedReader = new BufferedReader(objFileReader);
           Yylex objYylex = new Yylex(objFileReader);
           objYylex.ruta = PHP;
           Yytoken mastertoken= null;
           do{
                mastertoken = objYylex.nextToken();
                
            }while(mastertoken!= null);
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(MiniPHPForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MiniPHPForm.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                objFileReader.close();
            } catch (IOException ex) {
                Logger.getLogger(MiniPHPForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }//GEN-LAST:event_btnPHPActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MiniPHPForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MiniPHPForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MiniPHPForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MiniPHPForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MiniPHPForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnJflex;
    private javax.swing.JButton btnPHP;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField txtRutaJFlex;
    private javax.swing.JTextField txtRutaPHP;
    // End of variables declaration//GEN-END:variables
}
