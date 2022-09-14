# Arquitectura-de-Computadores
Laboratorios de práctica sobre el diseño de hardware y programación de un procesador y sus componentes.

Este proyecto emula el proceso y funcionalidad de un procesador convencional de 32 bits. consta de dos entregas de laboratorio de práctica para el diseño de *hardware* para la materia de ***Arquitectura de computadores***.

Consta de los siguientes dos laboratorios:

#### 1. [CPU Modules](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2001)

#### 2. [Input/Output Modules](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2002)

## Requerimientos
- Instalar el emulador de Intel Quartus.
- Utilizar un IDE que soporte System/Verilog.

## Cómo usar
Selecciona cualquiera de los dos laboratorios y utilízalo a tu antojo.

## CPU Modules
Este laboratorio consta sobre los módulos de operaciones básicos que maneja un procesador convencional:
- *[ALU (Arithmethic-Logic Unit)](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2001/CPU/ALU):*
Este módulo realiza todo el cálculo y manipulación de datos tanto aritméticos como lógicos dentro de un procesador.
- *[Register Unit](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2001/CPU/Register%20Unit):*
Este módulo es la que maneja todos los registros de alta prioridad para un procesador.
- *Memory Units:*
  - *[Instruction Memory](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2001/CPU/Memory%20Unit/Instruction%20Memory):*
Este módulo maneja la manipulación de instrucciones dadas en lenguaje de máquina.
  - *[Data Memory](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2001/CPU/Memory%20Unit/Data%20Memory):*
Este módulo maneja el resto de memorias de acceso al procesador acorde a la jerarquía de memorias. 

## Input/Output Modules
Este laboratorio constra sobre los módulos de entrada y salida (I/O) del usuario ante el computador:
- *[VGA Monitor](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2002/modules/VGAMonitor):*
Este módulo simula el comportamiento de un monitor VGA monocromático. El comportamiento se evalúa por medio del cambio de valores en el arreglo de colores RGB.
- *[PS2 Keyboard](https://github.com/Sebusa/Arquitectura-de-Computadores/tree/master/Lab%2002/modules/PS2Keyboard):*
Este módulo simula el comportamiento de un monitor PS2. El comportamiento se evalúa obteniendo el valor ASCII de cada tecla.



### Si tienes alguna dudad sobre el proyecto puedes contactarme: 
### ***[s.buitrago2@utp.edu.co](mailto:s.buitrago2@utp.edu.co)***
###### *Este proyecto fue elaborado con propósitos netamente académicos y no comerciales*
