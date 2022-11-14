#!/usr/bin/python3
# -*- coding: utf-8 -*-
import math, numpy
import scipy.stats
from tf.transformations import euler_from_quaternion

#error del sensor en distancia y ángulo
# SIGMA_D = 0.2
# SIGMA_ALFA = 0.1

# SIGMA_D = 0.5
# SIGMA_ALFA = 0.1

SIGMA_D = 0.2
SIGMA_ALFA = 0.2

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
    
    d = math.sqrt(
      pow(m[z[0] - 1].pose.position.x - x.position.x, 2) +
      pow(m[z[0] - 1].pose.position.y - x.position.y, 2)
    )
    _,_,theta = euler_from_quaternion([x.orientation.x, x.orientation.y, 
                                    x.orientation.z, x.orientation.w])
    a = math.atan2(
      m[z[0] - 1].pose.position.y - x.position.y,
      m[z[0] - 1].pose.position.x - x.position.x
    ) - theta

    # p = scipy.stats.norm(d - z[1], SIGMA_D) * scipy.stats.norm(a - z[2], SIGMA_ALFA)
    p1 = scipy.stats.norm(0, SIGMA_D)
    p1 = p1.pdf(d - z[1])

    p2 = scipy.stats.norm(0, SIGMA_ALFA)
    p2 = p2.pdf(a - z[2])

    p = p1 * p2
    # Cambiar el return para que devuelva lo que toca
    return p