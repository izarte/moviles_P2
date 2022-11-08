#!/usr/bin/python3
# -*- coding: utf-8 -*-

from __future__ import print_function
import matplotlib.pyplot as plt
import sys, math, copy
from geometry_msgs.msg import Pose, Point, Quaternion
from tf.transformations import quaternion_from_euler
from modelo_movimiento import sample_motion_model, odometry_to_relative
	


if len(sys.argv) <= 2:
	print("Uso: " + sys.argv[0] + " fich_odometria numero_de_muestras")
	exit()		

N = int(sys.argv[2])

#leemos el fichero con los datos de la odometría
odometria = []
fichero = open(sys.argv[1],"r")
for linea in fichero:
	if linea.startswith('#'):
		continue
	datos = linea.split(" ")
	p = Point(float(datos[0]), float(datos[1]), 0.0)
	q_array = quaternion_from_euler(0,0,math.radians(float(datos[2])))
	q = Quaternion(q_array[0], q_array[1], q_array[2], q_array[3])
	odometria.append(Pose(position=p, orientation=q))		  
print(str(len(odometria)) + " lecturas de odometría")
#todas las muestras son inicialmente iguales, y parten del primer punto de odometría
muestras = []
for i in range(0,N):  
	muestras.append(copy.deepcopy(odometria[0]))

#pinta las muestras en el instante inicial
for i in range(0,N):
	plt.plot(muestras[i].position.x,muestras[i].position.y,"r.")	

#Para cada posición estimada por la odometría 
for it in range(1,len(odometria)):
	#Para cada muestra
	d_trans, d_rot1, d_rot2 = odometry_to_relative(odometria[it-1], odometria[it])
	for index, sample in enumerate(muestras):
		#pasamos la odometría de absoluta a relativa
		#generamos una nueva muestra a partir de esa, la pintamos y sustituimos la antigua por la nueva
		sample = sample_motion_model(d_trans, d_rot1, d_rot2, sample)
		plt.plot(sample.position.x, sample.position.y, "r.")	
		muestras[index] = sample
plt.show()