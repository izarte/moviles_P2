#!/usr/bin/python3
# -*- coding: utf-8 -*-
import numpy
import math
import random
import copy

from geometry_msgs.msg import Pose, Quaternion
from tf.transformations import euler_from_quaternion, quaternion_from_euler


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
    new_d_rot1 = d_rot1 + random.gauss(
        0,
        (ALPHA1 * abs(d_rot1) + ALPHA2 * d_trans)
    )
    new_d_trans = d_trans + random.gauss(
        0,
        ALPHA3 * d_trans + ALPHA4 * (abs(d_rot1) + abs(d_rot2))
    )
    new_d_rot2 = d_rot2 + random.gauss(
        0,
        ALPHA1 * abs(d_rot2) + ALPHA2 * d_trans
    )
    #TO-DO: cambiar el return para que devuelva lo que toca
    # print(type(sample.orientation))
    _,_,theta = euler_from_quaternion([sample.orientation.x, sample.orientation.y, 
                                    sample.orientation.z, sample.orientation.w])
    # z = sample.orientation.z
    # w = sample.orientation.w
    # theta = get_yaw(z, w)
    
    sample.position.x = sample.position.x + new_d_trans * math.cos(theta + new_d_rot1)
    sample.position.y = sample.position.y + new_d_trans * math.sin(theta + new_d_rot1)
    theta = theta + new_d_rot1 + new_d_rot2

    sample.orientation = quaternion_from_euler(0, 0, theta)
    return sample


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
    theta_old = get_yaw(odom_old.orientation.z, odom_old.orientation.w)
    theta_new = get_yaw(odom_new.orientation.z, odom_new.orientation.w)
    
    d_trans = math.sqrt(
        math.pow((odom_new.position.x - odom_old.position.x), 2) + 
        math.pow((odom_new.position.y - odom_old.position.y), 2)
    )
    d_rot1 = math.atan2(
        odom_new.position.y - odom_old.position.y,
        odom_new.position.x - odom_old.position.x
    )
    d_rot2 = theta_new - theta_old - d_rot1
    #TO-DO: cambiar el return para que devuelva lo que toca
    return (d_trans, d_rot1, d_rot2)

def get_yaw(z, w):
    return math.atan2(2.0 * w * z, 1 - 2.0 * z * z)