#!/usr/bin/python
# -*- coding: utf-8 -*-
from tf.transformations import euler_from_quaternion
import math, numpy

#error del sensor en distancia y ángulo
SIGMA_D = 0.2
SIGMA_ALFA = 0.1 

def landmark_detection_model(z, x, m):
    """Modelo de sensor para sensor de landmarks tipo range-bearing
    Parámetros:
      - z: tupla (id, d, alfa) con id del landmark, distancia y ángulo con que lo detectamos
      - x: geometry_msgs/Pose la pose del robot
      - m: el mapa, que no es más que un array de marker_msgs.msg/Marker, pero OJO, aquí
           las coordenadas de las poses son RELATIVAS AL MAPA, no al robot 
    Debe devolver un valor proporcional a la probabilidad de haber obtenido la medida z
    suponiendo que el robot tiene la pose x
    """    
    #TO-DO: implementar el código de esta función
    # Cambiar el return para que devuelva lo que toca
    return 0