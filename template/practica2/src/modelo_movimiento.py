#!/usr/bin/python
# -*- coding: utf-8 -*-
from geometry_msgs.msg import Pose, Quaternion
import numpy, math
from tf.transformations import euler_from_quaternion, quaternion_from_euler
import copy


#Valores de ejemplo, PROBAD TAMBIÉN CON OTROS DISTINTOS
# ALPHA1=0.005 #influencia de la rotacion en la rotacion
# ALPHA2=0.002 #influencia de la distancia en la rotacion
# ALPHA3=0.002 #influencia de la distancia en la distancia
# ALPHA4=0.005 #influencia de la rotacion en la distancia
ALPHA1=0.01 #influencia de la rotacion en la rotacion
ALPHA2=0.004 #influencia de la distancia en la rotacion
ALPHA3=0.004 #influencia de la distancia en la distancia
ALPHA4=0.01 #influencia de la rotacion en la distancia



def sample_motion_model(d_trans, d_rot1, d_rot2, sample):
    """Modelo de movimiento muestreado basado en odometría relativa
    Aplica el movimiento devuelto por la odometria  en forma relativa
    a una posición, sumándole un error gaussiano 
    Parámetros:
     - d_trans: traslación
     - d_rot1: rotación inicial
     - d_rot2: rotación final
     - sample: geometry_msgs.msg.Pose pose a la que se aplica el movimiento
    Devuelve:
     - geometry_msgs.msg.Pose pose resultante de pose inicial + mov + error
    """
    #TO-DO: implementar el código de esta función
    #TO-DO: cambiar el return para que devuelva lo que toca
    return 0


def odometry_to_relative(odom_old, odom_new):
    """Convierte la odometría a relativa
    Dadas una pose inicial y final calcula el movimiento relativo entre ambas 
    Parámetros:
     - odom_old: geometry_msgs.msg.Pose pose inicial
     - odom_new: geometry_msgs.msg.Pose pose final
    Devuelve:
     - una tupla con mov. relativo en forma de (traslación, rotación1, rotación2)
    """
    #TO-DO: implementar el código de esta función
    #TO-DO: cambiar el return para que devuelva lo que toca
    return 0