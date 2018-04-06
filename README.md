# MiniPHP-Luis-Andrino-1198516
Analizador lexico PHP
El proyecto consiste en utilizar los automatas finitos determinísticos y las expreciones regulares como reconocedores de tokens
para el lenguaje de programacion PHP

Utilización del programa
El proyecto se puede ejecutar por medio del icono de la plicacion en la carpeta:

\MiniPHP-Luis-Andrino-1198516\MiniPHP\dist

Luego de abrir el programa se podra observar dos botones con sus respectivas areas de texto. Los cuales sus funciones son

- Subir Archivo JFlex: el cual su funcion es recibir el archivo .flex creado el cual contiene las expresiones reguales y los
retornos de cada una este archivo se encuentra en la siguiente ruta: 

\MiniPHP-Luis-Andrino-1198516\MiniPHP\src\miniphp


- Subir Archivo PHP:  el cual su funcion es subir cualquier archivo programado en PHP el cual quiere que sea analizado lexicamente
y en este mismo moento que suba el archivo el programa pasara a realizar su trabajo cuando termine mostrara los errores en 
una ventana emergente y asi mismo el programa podra crear dos tipos de archivos:

- Archivo PHP.OUT: el cual muestra que el archivo en formato PHP no muestra ningun tipo de error y lo devuelve ya corregido.

- Archivo PHP.ERR: en este se muestra con detalle todos los errores lexicos que posea el programa la manera que controla los
errores son los que no pertenecen a ninguna de las expreciones regulares detalladas asi como hay casos especiales los cuales
se les toma en cuenta para el buen funcionamiento del programa.

El programa es funcional ya que se comprobo con varios archivos en los cuales las palabras pertenecientes a las expreciones regulaes 
los arregla de tal manera que devuelve un archivo funcional para el lenguaje de programación PHP y asi mismo el programa es robusto
ya que es capaz de manejar razonablemente situaciones inesperadas.

## Autor

Luis Pedro Andrino Menéndez
