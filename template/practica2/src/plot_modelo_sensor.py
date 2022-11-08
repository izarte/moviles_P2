#!/usr/bin/python
# -*- coding: utf-8 -*-
# hace un plot del modelo del sensor p(z|x,m) para distintos valores de z=d,alfa
# suponiendo para simplicar al robot en la pose (0,0,0) 
# y que pasamos la (x,y) del landmark por línea de comandos
from __future__ import print_function
import matplotlib.pyplot as plt
import sys, math
import numpy as np
from geometry_msgs.msg import Pose
from marker_msgs.msg import Marker
from modelo_sensor import landmark_detection_model

#por defecto hace una gráfica entre [d-MARGEN_DIST,d+MARGEN_DIST y parecido con el ángulo
MARGEN_DIST = 1
MARGEN_ANG = math.radians(30)

if len(sys.argv) < 3:
	print("Uso: " + sys.argv[0] + " x_landmark y_landmark")
	exit()	
	
#creamos un mapa en el que hay un único landmark con las coords que hemos pasado	
lm = Marker()
lm.ids.append(1)
lm.pose = Pose()
lm.pose.position.x = float(sys.argv[1])
lm.pose.position.y = float(sys.argv[2])
m = []
m.append(lm)
#para simplificar, el robot está en la pose (0,0,0)
robot = Pose()
robot.orientation.w = 1
#distancia y ángulo a las que se debería detectar el landmark
d = math.sqrt(lm.pose.position.x**2+lm.pose.position.y**2)
ang = math.atan2(lm.pose.position.y,lm.pose.position.x)
print("distancia: ", d, " ang: ", ang)
#plot de las probabilidades variando distancia y ángulo
#debería dar un máximo para "d" y "ang"
if (d-MARGEN_DIST<0):
	MARGEN_DIST = d
rango_d = np.linspace(d-MARGEN_DIST, d+MARGEN_DIST, 50)
rango_ang = np.linspace(ang-MARGEN_ANG, ang+MARGEN_ANG, 50)
fila = 0
col = 0
probs = np.zeros((50,50))
for dist in rango_d:
	for alfa in rango_ang:
		z = (1, dist, alfa)
		probs[fila][col] = landmark_detection_model(z, robot, m)
		col+=1
	fila+=1
	col=0
plt.imshow(probs, extent=[d-MARGEN_DIST, d+MARGEN_DIST, ang-MARGEN_ANG, ang+MARGEN_ANG])	
plt.show()  
