# Importan las librerias necesarias
import base64
import numpy as np
import sympy as sp
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from scipy import interpolate as numint
from st_cytoscape import cytoscape
from PIL import Image, ImageOps

# Configuracion de la pagina
st.set_page_config(page_title = "Tesis de bachillerato", page_icon = "🦅", layout = "wide", initial_sidebar_state = "collapsed")

# Funciones 
def f0_mar(im, mar):
     image = ImageOps.expand(im, border = mar, fill = "black")
     return image

def f1_rpm(ne, tpo):
     if tpo == 'Escalonado':
          x1 = np.array([0, 300, 300, 700, 700, 800, 800, 700, 700, 300, 300, 0, 0])
          y1 = np.array([-50, -50, -125/2, -125/2, -50, -50, 50, 50, 125/2, 125/2, 50, 50, -50])
          x3 = np.array([0,0.0222,0.0444,0.0667,0.0889,0.1111,0.1333,0.1556,0.1778,0.2,0.2,0.2111,0.2222,0.2333,0.2444,0.2556,0.2667,0.2778,0.2889,0.3,0.3,0.3222,0.3444,0.3667,0.3889,0.4111,0.4333,0.4556,0.4778,0.5,0.5,0.5222,0.5444,0.5667,0.5889,0.6111,0.6333,0.6556,0.6778,0.7,0.7,0.7111,0.7222,0.7333,0.7444,0.7556,0.7667,0.7778,0.7889,0.8]) * 1000
          y3 = np.array([0,-0.000015454,-0.000030746,-0.000045714,-0.000060195,-0.000074029,-0.000087053,-0.000099105,-0.00011002,-0.00011964,-0.00011964,-0.00012392,-0.00012783,-0.00013135,-0.0001345,-0.00013725,-0.0001396,-0.00014155,-0.00014308,-0.0001442,-0.0001442,-0.00014566,-0.0001464,-0.0001464,-0.00014564,-0.00014409,-0.00014174,-0.00013855,-0.00013452,-0.00012961,-0.00012961,-0.00012382,-0.00011719,-0.00010981,-0.00010173,-0.00009302,-0.000083746,-0.000073973,-0.00006377,-0.000053201,-0.000053201,-0.000047749,-0.000042135,-0.000036379,-0.000030501,-0.000024522,-0.000018463,-0.000012342,-0.0000061812,-1.5847e-19]) * 1000 * 300 
          dt = np.array([100, 125, 100])
          lt = np.array([300, 400, 100])
          ls = np.array([0, 300, 700])
          nt = np.array([0, 300, 700, 800])

          x  = sp.symbols('x')
          f1 = (10737418240000 * x ** 3) / 4364154382556341 - (76005888753664 * x) / 109103859563908525;
          f2 = (10737418240000 * x ** 3) / 13092463147669023 + (4294967296000 * x ** 2) / 4364154382556341 - (97480725233664 * x) / 109103859563908525 + 171798691840 / 13092463147669023;
          f3 = (536870912000 * x ** 3) / 1598201067830691 + (214748364800 * x ** 2) / 532733689276897 - (220609904640 * x) / 532733689276897 - 5701196854941011 / 87283087651126804480;
          f4 = - (536870912000 * x ** 3) / 532733689276897 + (1288490188800 * x ** 2) / 532733689276897 - (757480816640 * x) / 532733689276897 + 54681141248 / 532733689276897;
          f5 = - (10737418240000 * x ** 3) / 4364154382556341 + (25769803776000 * x ** 2) / 4364154382556341 - (2327897013443625 * x) / 558611760967211648 + 7279083635225919/8937788175475386368;
          f  = [f1, f2, f3, f4, f5]
          p  = 7830.992242436808
          a  = np.pi * np.array([0.05, 0.05, 0.0625, 0.0625, 0.05]) ** 2
          li = np.array([0, 200, 300, 500, 700, 800]) / 1000
     else:
          x5 = np.array([0, 1500, 1500, 0, 0])
          y5 = np.array([-15, -15, 15, 15, -15])
          x1 = np.array([0, 1500, 1500, 0, 0])
          y1 = np.array([-25, -25, 25, 25, -25])
          x3 = np.array([0,0.0455,0.0909,0.1364,0.1818,0.2273,0.2727,0.3182,0.3636,0.4091,0.4545,0.5,0.5545,0.6091,0.6636,0.7182,0.7727,0.8273,0.8818,0.9364,0.9909,1.0455,1.1,1.1364,1.1727,1.2091,1.2455,1.2818,1.3182,1.3545,1.3909,1.4273,1.4636,1.5]) * 1000
          y3 = np.array([0,0.000046398,0.000092427,0.00013772,0.00018191,0.00022463,0.00026551,0.00030417,0.00034027,0.00037342,0.00040325,0.00042941,0.00045552,0.00047577,0.0004901,0.00049849,0.00050088,0.00049725,0.00048755,0.00047175,0.00044979,0.00042165,0.00038729,0.00036094,0.00033206,0.00030091,0.00026772,0.00023277,0.00019629,0.00015855,0.0001198,0.00008029,0.000040272,4.2574e-20]) * 1000 * 40 * -1
          dt = np.array([50, 50, 50])
          lt = np.array([500, 500, 500])
          ls = np.array([0, 500, 1000])
          nt = np.array([0, 500, 1000, 1500])

          x  = sp.symbols('x')
          f  = -0.0003041661947726438 * x ** 4 + 0.0009774450338568947 * x ** 3 - 0.00010769849260722366 * x ** 2 - 0.001009531675784642 * x - 3.392350409868671e-7
          p  = 7830.992242436808
          a  = np.pi * ((0.05 * 0.03) / 2) ** 2
          li = np.array([0, 500, 1100, 1500]) / 1000

     nc = ne - 1
     tc = np.array([])
     dc = np.array([])
     tp = np.array([])
     x2 = np.zeros((2, nc * 3))
     y2 = np.zeros((2, nc * 3))
     y4 = np.zeros((4, ne * 3))
     tv = np.array([])
     for i in range(3):
          nl = lt[i] / (nc + 1)
          lc = np.arange(1, nc + 1) * nl + ls[i]
          pe = np.arange(0, nc + 1) * nl + np.repeat(nl / 2, nc + 1) + ls[i]
          tc = np.concatenate((tc, lc))
          tp = np.concatenate((tp, pe))
          dc = np.concatenate((dc, np.repeat(dt[i] / 2, nc)))
          vo = np.repeat((np.pi * nl * dt[i] ** 2) / 4, ne)
          tv = np.concatenate((tv, vo))
     x2[0, :] = tc; x2[1, :] = tc
     y2[0, :] = dc; y2[1, :] = -dc
     x4 = np.repeat(np.sort(np.concatenate((tc, nt))), 4)[2:-2].reshape((4, ne * 3), order = 'F')
     y4[1, :] = np.interp(tp, x3, y3); y4[2, :] = np.interp(tp, x3, y3)
     centro_masa = tp / 1000
     volumen     = tv / 1e9
     peso        = 7830.992242436808 * volumen * 9.81
     sum1 = 0
     sum2 = 0

     if tpo == 'Escalonado':
          for i in range(5):
               sum1 += p * a[i] * abs(sp.integrate(f[i], (x, li[i], li[i + 1])))
               sum2 += p * a[i] * abs(sp.integrate(f[i] ** 2, (x, li[i], li[i + 1])))
          deflexion   = np.interp(tp, x3, y3 / 300) / 1000
          vel_dun_cla = (30 / np.pi) * np.sqrt(9.81 / max(abs(y3 / 300000)))
     else:
          for i in range(3):
               sum1 += p * a * abs(sp.integrate(f, (x, li[i], li[i + 1])))
               sum2 += p * a * abs(sp.integrate(f ** 2, (x, li[i], li[i + 1])))
          deflexion   = np.interp(tp, x3, y3 / 40) / 1000
          vel_dun_cla = (30 / np.pi) * np.sqrt(9.81 / max(abs(y3 / 40000)))

     vel_ray_cla = (30 / np.pi) * np.sqrt(9.81 * (np.sum(peso * abs(deflexion)) / np.sum(peso * deflexion ** 2)))
     vel_ray_mod = (30 / np.pi) * sp.sqrt(9.81 * (sum1 / sum2))
     table_data  = np.zeros((ne * 3, 4)); table_data[:, 0] = centro_masa * 1000; table_data[:, 1] = volumen * 1000000000; table_data[:, 2] = peso; table_data[:, 3] = deflexion * 1000
     data_frame  = pd.DataFrame(table_data, columns = ["Centro de masa (mm)", "Volumen (mm3)", "Peso (N)", "Deflexión (mm)"])
     
     fig, axs = plt.subplots(figsize = (8, 4))
     axs.plot(x1, y1, color = 'black', linestyle = 'solid', linewidth = 3)
     axs.plot(x2, y2, color = 'red', linestyle = 'dashed', linewidth = 1)
     axs.plot(x3, y3, color = 'green', linestyle = 'solid', linewidth = 2)
     axs.fill(x4, y4, color = 'blue', alpha = 0.3)
     axs.set_xlabel('x (mm)')
     axs.set_yticks([])
     axs.set_ylabel('')
     axs.spines['top'].set_visible(False)
     axs.spines['bottom'].set_visible(False)
     axs.spines['left'].set_visible(False)
     axs.spines['right'].set_visible(False)

     if tpo == 'Escalonado':
          axs.plot(np.array([[300, 700], [300, 700]]), np.array([[50, 50], [-50, -50]]), color = 'red', linestyle = 'dashed', linewidth = 1)
          axs.text(30, 20, r'$\frac{30}{\pi}\sqrt{\frac{g}{max(\delta_R)}}=$' + str(round(vel_dun_cla, 2)), fontsize = 11)
          axs.text(500, 30, r'$\frac{30}{\pi}\sqrt{g\frac{\sum m_i y_i}{\sum m_i y_{i}^{2}}}=$' + str(round(vel_ray_cla, 2)), fontsize = 11)
          axs.text(500, 10, r'$\frac{30}{\pi}\sqrt{g\frac{\sum \rho A\int y_{(x)}dx}{\sum \rho A\int y_{(x)}^{2}dx}}=$' + str(round(vel_ray_mod, 2)), fontsize = 11)
          axs.text(270, 20, r'$<V.C.R.<$', fontsize = 20)
     else:
          axs.plot(x5, y5, color = 'black', linestyle = 'dashed', linewidth = 1)
          axs.plot(np.array([[500, 1000], [500, 1000]]), np.array([[25, 25], [-25, -25]]), color = 'red', linestyle = 'dashed', linewidth = 1)
          axs.text(50, 6, r'$\frac{30}{\pi}\sqrt{\frac{g}{max(\delta_R)}}=$' + str(round(vel_dun_cla, 2)), fontsize = 11)
          axs.text(1000, 10, r'$\frac{30}{\pi}\sqrt{g\frac{\sum m_i y_i}{\sum m_i y_{i}^{2}}}=$' + str(round(vel_ray_cla, 2)), fontsize = 11)
          axs.text(1000, 3, r'$\frac{30}{\pi}\sqrt{g\frac{\sum \rho A\int y_{(x)}dx}{\sum \rho A\int y_{(x)}^{2}dx}}=$' + str(round(vel_ray_mod, 2)), fontsize = 11)
          axs.text(550, 6, r'$<V.C.R.<$', fontsize = 20)

     return fig, data_frame

def f2_img(x1, y1, img1):
     x  = np.array([5, 15, 25, 35])
     y  = np.array([20, 30, 50, 70, 100, 120, 150, 200, 300])
     z  = np.array([[0.1100, 0.1110, 0.1120, 0.1160],
                    [0.1140, 0.1158, 0.1190, 0.1240],
                    [0.1240, 0.1255, 0.1280, 0.1315],
                    [0.1300, 0.1310, 0.1330, 0.1355],
                    [0.1350, 0.1358, 0.1375, 0.1389],
                    [0.1370, 0.1379, 0.1390, 0.1405],
                    [0.1400, 0.1407, 0.1415, 0.1424],
                    [0.1420, 0.1425, 0.1430, 0.1435],
                    [0.1449, 0.1450, 0.1452, 0.1450]])
     fx = numint.interp1d([5, 35], [50, 550])
     fy = numint.interp1d([0.11, 0.148], [650, 20])
     fz = numint.interp2d(x, y, z)
     fg = np.round(fz(x1, y1)[0], 5)

     fig1, axe1 = plt.subplots()
     axe1.imshow(img1)
     axe1.plot([fx(x1), fx(x1)], [650, 20], 'red', linestyle = 'dashed')
     axe1.plot([50, 550], [fy(fz(x1, y1)), fy(fz(x1, y1))], 'red', linestyle = 'dashed')
     axe1.scatter(fx(x1), fy(fz(x1, y1)), 25, 'red')
     axe1.axis('off')

     return fg, fig1

def f3_des(rme, rma, lon, phi, giro):
     tetha = np.linspace(0, 2 * np.pi, 50)
     x1 = 0
     y1 = 0
     x2 = lon * np.cos(phi * (np.pi / 180)) + x1
     y2 = lon * np.sin(phi * (np.pi / 180)) + y1
     d1 = np.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
     l1 = np.sqrt(d1 ** 2 - (rme - rma) ** 2)
     r1 = np.sqrt(l1 ** 2 + rma ** 2)
     s1 = 0.25 * np.sqrt((d1 + rme + r1) * (d1 + rme - r1) * (d1 - rme + r1) * (-d1 + rme + r1))
     r2 = np.sqrt(l1 ** 2 + rme ** 2)
     s2 = 0.25 * np.sqrt((d1 + rma + r1) * (d1 + rma - r1) * (d1 - rma + r1) * (-d1 + rma + r1))
     x3 = (x1 + x2) / 2 + ((x2 - x1) * (rme ** 2 - r1 ** 2)) / (2 * d1 ** 2) + 2 * ((y1 - y2) / d1 ** 2) * s1
     y3 = (y1 + y2) / 2 + ((y2 - y1) * (rme ** 2 - r1 ** 2)) / (2 * d1 ** 2) - 2 * ((x1 - x2) / d1 ** 2) * s1
     x4 = (x2 + x1) / 2 + ((x1 - x2) * (rma ** 2 - r2 ** 2)) / (2 * d1 ** 2) - 2 * ((y2 - y1) / d1 ** 2) * s2
     y4 = (y2 + y1) / 2 + ((y1 - y2) * (rma ** 2 - r2 ** 2)) / (2 * d1 ** 2) + 2 * ((x2 - x1) / d1 ** 2) * s2
     x5 = (x1 + x2) / 2 + ((x2 - x1) * (rme ** 2 - r1 ** 2)) / (2 * d1 ** 2) - 2 * ((y1 - y2) / d1 ** 2) * s1
     y5 = (y1 + y2) / 2 + ((y2 - y1) * (rme ** 2 - r1 ** 2)) / (2 * d1 ** 2) + 2 * ((x1 - x2) / d1 ** 2) * s1
     x6 = (x2 + x1) / 2 + ((x1 - x2) * (rma ** 2 - r2 ** 2)) / (2 * d1 ** 2) + 2 * ((y2 - y1) / d1 ** 2) * s2
     y6 = (y2 + y1) / 2 + ((y1 - y2) * (rma ** 2 - r2 ** 2)) / (2 * d1 ** 2) - 2 * ((x2 - x1) / d1 ** 2) * s2
     m1 = ((y4 - y3) / (x4 - x3))
     if phi >=0 and phi < 80:
          x7 = x2 - rma / (np.sqrt(m1 ** 2 + 1))
          y7 = y2 - (m1 * rma) / np.sqrt(m1 ** 2 + 1)
     elif phi >= 80 and phi <= 260:
          x7 = x2 + rma / (np.sqrt(m1 ** 2 + 1))
          y7 = y2 + (m1 * rma) / np.sqrt(m1 ** 2 + 1)
     else:
          x7 = x2 - rma / (np.sqrt(m1 ** 2 + 1))
          y7 = y2 - (m1 * rma) / np.sqrt(m1 ** 2 + 1)
     m2 = ((y6 - y5) / (x6 - x5))
     if phi >=0 and phi < 100:
          x8 = x2 - rma / (np.sqrt(m2 ** 2 + 1))
          y8 = y2 - (m2 * rma) / np.sqrt(m2 ** 2 + 1)
     elif phi >= 100 and phi <= 279:
          x8 = x2 + rma / (np.sqrt(m2 ** 2 + 1))
          y8 = y2 + (m2 * rma) / np.sqrt(m2 ** 2 + 1)
     else:
          x8 = x2 - rma / (np.sqrt(m2 ** 2 + 1))
          y8 = y2 - (m2 * rma) / np.sqrt(m2 ** 2 + 1)
     beta = np.round(np.arctan(m1) * (180 / np.pi), 2)
     alpa = np.round(np.arctan(m2) * (180 / np.pi), 2)
     x9 = np.tan(np.deg2rad(phi)) * np.array([-lon - 1.35 * rma, lon + 1.35 * rma])
     y9 = (-1 / np.tan(np.deg2rad(phi))) * np.array([-lon - 1.35 * rma, lon + 1.35 * rma]) + (y2 - (-1 / np.tan(np.deg2rad(phi))) * x2)

     fig2, axe2 = plt.subplots()
     axe2.plot(x1 + rme * np.cos(tetha), y1 + rme * np.sin(tetha), 'black')
     axe2.plot(x2 + rma * np.cos(tetha), y2 + rma * np.sin(tetha), 'black')
     if giro == 'Giro antihorario':
          axe2.plot([x3, x4], [y3, y4], 'red')
          axe2.plot([x5, x6], [y5, y6], 'blue')
     else:
          axe2.plot([x3, x4], [y3, y4], 'blue')
          axe2.plot([x5, x6], [y5, y6], 'red')
     axe2.arrow(x2, y2, x7 - x2, y7 - y2, color = 'green', head_width = 0.02, width = 0.0025)
     axe2.arrow(x2, y2, x8 - x2, y8 - y2, color = 'orange', head_width = 0.02, width = 0.0025)
     axe2.plot([-50 * rma + x2, 50 * rma + x2], [y2, y2], color = 'black', linestyle = 'solid')
     axe2.plot([x2, x2], [-50 * rma + y2, 50 * rma + y2], color = 'black', linestyle = 'solid')
     axe2.plot([-lon - 1.35 * rma, lon + 1.35 * rma], x9, color = 'black', linestyle = 'dotted')
     axe2.plot([-lon - 1.35 * rma, lon + 1.35 * rma], y9, color = 'black', linestyle = 'dotted')

     axe2.set_xlim([-lon - 1.35 * rma, lon + 1.35 * rma])
     axe2.set_ylim([-lon - 1.35 * rma, lon + 1.35 * rma])
     axe2.set_aspect('equal', adjustable = 'box')
     axe2.axis('off')
     
     return fig2, beta, alpa
@st.cache_data
def f4_loa(resources):
     file_1   = open(r'Imagenes/Logo.gif', "rb")
     content1 = file_1.read()
     gif1     = base64.b64encode(content1).decode("utf-8")
     file_1.close()
     file_2   = open(r'ReadmeRSC/belt.gif', "rb")
     content2 = file_2.read()
     gif2     = base64.b64encode(content2).decode("utf-8")
     file_1.close()
     file_3   = open(r'ReadmeRSC/gear.gif', "rb")
     content3 = file_3.read()
     gif3     = base64.b64encode(content3).decode("utf-8")
     file_3.close()
     file_4   = open(r'Imagenes/pstc.gif', "rb")
     content4 = file_4.read()
     gif4     = base64.b64encode(content4).decode("utf-8")
     file_4.close()
     file_5   = open(r'Imagenes/shaftanim.gif', "rb")
     content5 = file_5.read()
     gif5     = base64.b64encode(content5).decode("utf-8")
     file_5.close()
     file_6   = open(r'ReadmeRSC/animation.gif', "rb")
     content6 = file_6.read()
     gif6     = base64.b64encode(content6).decode("utf-8")
     file_6.close()
     file_7   = open(r'ReadmeRSC/DeflectionAnsys.gif', "rb")
     content7 = file_7.read()
     gif7     = base64.b64encode(content7).decode("utf-8")
     file_7.close()

     img1  = f0_mar(Image.open(r'Imagenes/forbo.png'), 5).resize((600, 870))
     img2  = f0_mar(Image.open(r'Imagenes/optibelt.png'), 5).resize((600, 870))
     img3  = f0_mar(Image.open(r'Imagenes/renold.png'), 5).resize((600, 870))
     img4  = f0_mar(Image.open(r'Imagenes/agma.png'), 5).resize((600, 870))
     img5  = f0_mar(Image.open(r'Imagenes/jack.png'), 5).resize((600, 870))
     img6  = f0_mar(Image.open(r'Imagenes/bandari.png'), 5).resize((600, 870))
     img38 = f0_mar(Image.open(r'Imagenes/skf.png'), 5).resize((600, 870))
     img7  = f0_mar(Image.open(r'Imagenes/logan.png'), 5).resize((600, 870))
     img8  = Image.open(r'Imagenes/maxelem.jpg').resize((600, 230))
     img9  = Image.open(r'Imagenes/maxelem1.jpg').resize((400, 400))
     img10 = Image.open(r'Imagenes/esfuerzoscf.jpg').resize((600, 300))
     img11 = Image.open(r'Imagenes/elem4.png').resize((600, 230))
     img12 = Image.open(r'Imagenes/FotografiaJR.png')

     img13 = f0_mar(Image.open(r'Imagenes/tesis1a.png'), 5).resize((600, 870))
     img14 = f0_mar(Image.open(r'Imagenes/tesis1b.png'), 5).resize((600, 870))
     img15 = f0_mar(Image.open(r'Imagenes/tesis2a.png'), 5).resize((600, 870))
     img16 = f0_mar(Image.open(r'Imagenes/tesis2b.png'), 5).resize((600, 870))
     img17 = f0_mar(Image.open(r'Imagenes/tesis3a.png'), 5).resize((600, 870))
     img18 = f0_mar(Image.open(r'Imagenes/tesis3b.png'), 5).resize((600, 870))
     img19 = f0_mar(Image.open(r'Imagenes/tesis4a.png'), 5).resize((600, 870))
     img20 = f0_mar(Image.open(r'Imagenes/tesis4b.png'), 5).resize((600, 870))
     img21 = f0_mar(Image.open(r'Imagenes/tesis5a.png'), 5).resize((600, 870))
     img22 = f0_mar(Image.open(r'Imagenes/tesis5b.png'), 5).resize((600, 870))
     img23 = f0_mar(Image.open(r'Imagenes/tesis6a.png'), 5).resize((600, 870))
     img24 = f0_mar(Image.open(r'Imagenes/tesis6b.png'), 5).resize((600, 870))
     img25 = f0_mar(Image.open(r'Imagenes/tesis7a.png'), 5).resize((600, 870))
     img26 = f0_mar(Image.open(r'Imagenes/tesis7b.png'), 5).resize((600, 870))
     img27 = f0_mar(Image.open(r'Imagenes/tesis8a.png'), 5).resize((600, 870))
     img28 = f0_mar(Image.open(r'Imagenes/tesis8b.png'), 5).resize((600, 870))

     img29 = f0_mar(Image.open(r'Imagenes/mod_planas.png'), 5).resize((1000, 550))
     img30 = f0_mar(Image.open(r'Imagenes/mod_trapezoidales.png'), 5).resize((1000, 550))
     img31 = f0_mar(Image.open(r'Imagenes/mod_cadenas.png'), 5).resize((1000, 550))
     img32 = f0_mar(Image.open(r'Imagenes/mod_engranajes.png'), 5).resize((1000, 550))
     img33 = f0_mar(Image.open(r'Imagenes/mod_ejes1.png'), 5).resize((1000, 550))
     img34 = f0_mar(Image.open(r'Imagenes/mod_ejes2.png'), 5).resize((1000, 550))
     img35 = f0_mar(Image.open(r'Imagenes/mod_ejes3.png'), 5).resize((1000, 550))
     img36 = f0_mar(Image.open(r'Imagenes/mod_ejes4.png'), 5).resize((1000, 550))
     img37 = f0_mar(Image.open(r'Imagenes/mod_plano.png'), 5).resize((1000, 550))
     
     img39 = Image.open(r'Imagenes/cortanteshi.png').resize((1000, 550))
     img40 = Image.open(r'Imagenes/cortantesxz.png').resize((1000, 550))
     img41 = Image.open(r'Imagenes/pendienteshi.png').resize((1000, 550))
     img42 = Image.open(r'Imagenes/pendientesxy.png').resize((1000, 550))
     img43 = Image.open(r'Imagenes/esfuerzosvmb.png').resize((1000, 550))
     img44 = Image.open(r'Imagenes/ansysdin.png').resize((1000, 550))
     img45 = Image.open(r'Imagenes/dinamicospstc.png').resize((1000, 550))
     img46 = Image.open(r'Imagenes/ansysvida.png').resize((1000, 550))
     img47 = Image.open(r'Imagenes/vidapstc.png').resize((1000, 550))
     img48 = Image.open(r'Imagenes/simcritica.png').resize((1000, 550))
     img49 = Image.open(r'Imagenes/criticapstc.png').resize((1000, 550))

     img50 = Image.open(r'Imagenes/ml.png').resize((290, 290))
     img51 = Image.open(r'Imagenes/gh.png').resize((290, 290))
     img52 = Image.open(r'Imagenes/st.png').resize((290, 290))

     imgn  = mpimg.imread(f'Imagenes/carta1.png')

     return gif1, gif2, gif3, gif4, gif5, gif6, gif7, img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, \
            img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, \
            img25, img26, img27, img28, img29, img30, img31, img32, img33, img34, img35, img36, \
            img37, img38, img39, img40, img41, img42, img43, img44, img45, img46, img47, img48, \
            img49, img50, img51, img52, imgn
@st.cache_data
def f5_cyt(resources):
     elements1 = [
     {"data": {"id": "n1", "label": "•Potencia\n•R.P.M\n•Diametros de las poleas\n•Distancia entre las poleas"}, "selectable": False},
     {"data": {"id": "n2", "label": "•Angulos de contacto\n•Velocidad de la correa\n•Fuerza tangencial a transmitir\n•Factores\n•Perfil"}, "selectable": False},
     {"data": {"id": "n3", "label": "•Dimensiones de\nla correa"}, "selectable": False},
     {"data": {"id": "n4", "label": "•Fuerzas y momentos\nsobre el eje"}, "selectable": False},
     {"data": {"source": "n1", "target": "n2"}},
     {"data": {"source": "n2", "target": "n3"}},
     {"data": {"source": "n2", "target": "n4"}},
     ]
     layout1 = {
     "name": "preset",
     "positions": {  
          "n1": {"x": -500, "y": 50},
          "n2": {"x": -200, "y": 50},
          "n3": {"x": 100, "y": 0},
          "n4": {"x": 100, "y": 100},
     }
     }
     stylesheet1 = [
     {"selector": "node", "style": {"label": "data(label)", "text-wrap": "wrap", "width": 10, "height": 10, "shape": "circle"}},
     {"selector": "edge", "style": {"width": 2, "curve-style": "bezier", "target-arrow-shape": "triangle"}},
     ]
     elements2 = [
     {"data": {"id": "n1", "label": "•Potencia\n•R.P.M\n•Diametros de las poleas\n•Distancia entre las poleas"}, "selectable": False},
     {"data": {"id": "n2", "label": "•Angulos de contacto\n•Velocidad de la correa\n•Fuerza tangencial a transmitir\n•Factores\n•Perfil"}, "selectable": False},
     {"data": {"id": "n3", "label": "•Dimensiones de\nla correa"}, "selectable": False},
     {"data": {"id": "n4", "label": "•Número de\ncorreas"}, "selectable": False},
     {"data": {"id": "n5", "label": "•Fuerzas y momentos\nsobre el eje"}, "selectable": False},
     {"data": {"source": "n1", "target": "n2"}},
     {"data": {"source": "n2", "target": "n3"}},
     {"data": {"source": "n2", "target": "n4"}},
     {"data": {"source": "n2", "target": "n5"}},
     ]
     layout2 = {
     "name": "preset",
     "positions": {  
          "n1": {"x": -500, "y": 50},
          "n2": {"x": -200, "y": 50},
          "n3": {"x": 100, "y": 0},
          "n4": {"x": 100, "y": 50},
          "n5": {"x": 100, "y": 100},
     }
     }
     stylesheet2 = [
     {"selector": "node", "style": {"label": "data(label)", "text-wrap": "wrap", "width": 10, "height": 10, "shape": "circle"}},
     {"selector": "edge", "style": {"width": 2, "curve-style": "bezier", "target-arrow-shape": "triangle"}},
     ]
     elements3 = [
     {"data": {"id": "n1", "label": "•Potencia\n•R.P.M\n•Dientes de los sprockets\n•Distancia entre los sprockets"}, "selectable": False},
     {"data": {"id": "n2", "label": "•Angulos de contacto\n•Velocidad de la cadena\n•Fuerza tangencial a transmitir\n•Factores\n•Perfil"}, "selectable": False},
     {"data": {"id": "n3", "label": "•Dimensiones de\nla cadena"}, "selectable": False},
     {"data": {"id": "n4", "label": "•Número de\ncadenas"}, "selectable": False},
     {"data": {"id": "n5", "label": "•Fuerzas y momentos\nsobre el eje"}, "selectable": False},
     {"data": {"source": "n1", "target": "n2"}},
     {"data": {"source": "n2", "target": "n3"}},
     {"data": {"source": "n2", "target": "n4"}},
     {"data": {"source": "n2", "target": "n5"}},
     ]
     layout3 = {
     "name": "preset",
     "positions": {  
          "n1": {"x": -500, "y": 50},
          "n2": {"x": -200, "y": 50},
          "n3": {"x": 100, "y": 0},
          "n4": {"x": 100, "y": 50},
          "n5": {"x": 100, "y": 100},
     }
     }
     stylesheet3 = [
     {"selector": "node", "style": {"label": "data(label)", "text-wrap": "wrap", "width": 10, "height": 10, "shape": "circle"}},
     {"selector": "edge", "style": {"width": 2, "curve-style": "bezier", "target-arrow-shape": "triangle"}},
     ]
     elements4 = [
     {"data": {"id": "n1", "label": "Tratamiento superficial"}, "selectable": False},
     {"data": {"id": "n2", "label": "Condiciones de operación"}, "selectable": False},
     {"data": {"id": "n3", "label": "Número de nodos"}, "selectable": False},
     {"data": {"id": "n4", "label": "Momentos"}, "selectable": False},
     {"data": {"id": "n5", "label": "Fuerzas"}, "selectable": False},
     {"data": {"id": "n6", "label": "Tipos de apoyo"}, "selectable": False},
     {"data": {"id": "n7", "label": "Densidad"}, "selectable": False},
     {"data": {"id": "n8", "label": "Esfuerzo de rotura"}, "selectable": False},
     {"data": {"id": "n9", "label": "Esfuerzo de fluencia"}, "selectable": False},
     {"data": {"id": "n10", "label": "Módulo de rigidez"}, "selectable": False},
     {"data": {"id": "n11", "label": "Módulo de elasticidad"}, "selectable": False},
     {"data": {"id": "n12", "label": "Redondeos y similares"}, "selectable": False},
     {"data": {"id": "n13", "label": "Longitud"}, "selectable": False},
     {"data": {"id": "n14", "label": "Diámetro externo"}, "selectable": False},
     {"data": {"id": "n15", "label": "Diámetro interno"}, "selectable": False},
     {"data": {"id": "n16", "label": "Area"}, "selectable": False},
     {"data": {"id": "n17", "label": "Momento polar de inercia"}, "selectable": False},
     {"data": {"id": "n18", "label": "Segundo momento de área"}, "selectable": False},
     {"data": {"id": "n19", "label": "Primer momento de área"}, "selectable": False},
     {"data": {"id": "n20", "label": "Esfuerzos dinámicos máximos"}, "selectable": False},
     {"data": {"id": "n21", "label": "Esfuerzos dinámicos"}, "selectable": False},
     {"data": {"id": "n22", "label": "Esfuerzos estáticos máximos"}, "selectable": False},
     {"data": {"id": "n23", "label": "Esfuerzos estáticos"}, "selectable": False},
     {"data": {"id": "n24", "label": "Desplazamientos"}, "selectable": False},
     {"data": {"id": "n25", "label": "Reacciones"}, "selectable": False},
     {"data": {"id": "n26", "label": "Velocidades Críticas"}, "selectable": False},
     {"data": {"id": "n27", "label": "F.S. dinamicos mínimos"}, "selectable": False},
     {"data": {"id": "n28", "label": "F.S. dinámicos"}, "selectable": False},
     {"data": {"id": "n29", "label": "F.S. estáticos mínimos"}, "selectable": False},
     {"data": {"id": "n30", "label": "F.S. estáticos"}, "selectable": False},
     {"data": {"source": "n6", "target": "n24"}},
     {"data": {"source": "n7", "target": "n24"}},
     {"data": {"source": "n10", "target": "n24"}},
     {"data": {"source": "n11", "target": "n24"}},
     {"data": {"source": "n13", "target": "n24"}},
     {"data": {"source": "n14", "target": "n24"}},
     {"data": {"source": "n16", "target": "n24"}},
     {"data": {"source": "n17", "target": "n24"}},
     {"data": {"source": "n25", "target": "n24"}},
     {"data": {"source": "n24", "target": "n25"}},
     {"data": {"source": "n24", "target": "n26"}},
     {"data": {"source": "n4", "target": "n25"}},
     {"data": {"source": "n5", "target": "n25"}},
     {"data": {"source": "n13", "target": "n25"}},
     {"data": {"source": "n25", "target": "n20"}},
     {"data": {"source": "n25", "target": "n21"}},
     {"data": {"source": "n25", "target": "n22"}},
     {"data": {"source": "n25", "target": "n23"}},
     {"data": {"source": "n25", "target": "n27"}},
     {"data": {"source": "n25", "target": "n28"}},
     {"data": {"source": "n25", "target": "n29"}},
     {"data": {"source": "n25", "target": "n30"}},
     {"data": {"source": "n1", "target": "n21"}},
     {"data": {"source": "n2", "target": "n21"}},
     {"data": {"source": "n8", "target": "n27"}},
     {"data": {"source": "n8", "target": "n28"}},
     {"data": {"source": "n9", "target": "n27"}},
     {"data": {"source": "n9", "target": "n28"}},
     {"data": {"source": "n9", "target": "n29"}},
     {"data": {"source": "n9", "target": "n30"}},
     {"data": {"source": "n12", "target": "n20"}},
     {"data": {"source": "n12", "target": "n22"}},
     {"data": {"source": "n12", "target": "n27"}},
     {"data": {"source": "n12", "target": "n29"}},
     {"data": {"source": "n14", "target": "n16"}},
     {"data": {"source": "n14", "target": "n17"}},
     {"data": {"source": "n14", "target": "n18"}},
     {"data": {"source": "n14", "target": "n19"}},
     {"data": {"source": "n15", "target": "n16"}},
     {"data": {"source": "n15", "target": "n17"}},
     {"data": {"source": "n15", "target": "n18"}},
     {"data": {"source": "n15", "target": "n19"}},
     {"data": {"source": "n18", "target": "n21"}},
     {"data": {"source": "n18", "target": "n23"}},
     {"data": {"source": "n19", "target": "n21"}},
     {"data": {"source": "n19", "target": "n23"}},
     ]
     layout4 = {
     "name": "preset",
     "positions": {  
          "n1": {"x": -500, "y": 0},
          "n2": {"x": -500, "y": 80},
          "n3": {"x": -500, "y": 160},
          "n4": {"x": -500, "y": 240},
          "n5": {"x": -500, "y": 320},
          "n6": {"x": -500, "y": 400},
          "n7": {"x": -200, "y": 40},
          "n8": {"x": -200, "y": 120},
          "n9": {"x": -200, "y": 200},
          "n10": {"x": -200, "y": 280},
          "n11": {"x": -200, "y": 360},
          "n12": {"x": 100, "y": 80},
          "n13": {"x": 100, "y": 160},
          "n14": {"x": 100, "y": 240},
          "n15": {"x": 100, "y": 320},
          "n16": {"x": 400, "y": 80},
          "n17": {"x": 400, "y": 160},
          "n18": {"x": 400, "y": 240},
          "n19": {"x": 400, "y": 320},
          "n20": {"x": 700, "y": 0},
          "n21": {"x": 700, "y": 80},
          "n22": {"x": 700, "y": 160},
          "n23": {"x": 700, "y": 240},
          "n24": {"x": 700, "y": 320},
          "n25": {"x": 700, "y": 400},
          "n26": {"x": 1000, "y": 40},
          "n27": {"x": 1000, "y": 120},
          "n28": {"x": 1000, "y": 200},
          "n29": {"x": 1000, "y": 280},
          "n30": {"x": 1000, "y": 360},
     }
     }
     stylesheet4 = [
     {"selector": "node", "style": {"label": "data(label)", "text-wrap": "wrap", "width": 220, "height": 30, "shape": "round-rectangle", "text-valign": "center", "text-halign": "center"}},
     {"selector": "edge", "style": {"width": 2, "curve-style": "unbundled-bezier", "target-arrow-shape": "triangle"}},
     ]
     return elements1, layout1, stylesheet1, elements2, layout2, stylesheet2, elements3, layout3, stylesheet3, elements4, layout4, stylesheet4

# Se cargan las imagenes y los datos para los diagramas
gif1, gif2, gif3, gif4, gif5, gif6, gif7, img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, \
img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, \
img25, img26, img27, img28, img29, img30, img31, img32, img33, img34, img35, img36, \
img37, img38, img39, img40, img41, img42, img43, img44, img45, img46, img47, img48, \
img49, img50, img51, img52, imgn = f4_loa('resources')
elements1, layout1, stylesheet1, elements2, layout2, stylesheet2, elements3, layout3, stylesheet3, elements4, layout4, stylesheet4 = f5_cyt('resoruces')

# Titulo y encabezado
st.markdown("<h1 style='text-align: center; color: black;'>Power System Transmission Calculator</h1>", unsafe_allow_html = True)
st.markdown("<h6 style='text-align: center; color: black;'>Proyecto de tesis para obtener el grado de Ingeniero Mecánico</h1>", unsafe_allow_html = True)
st.markdown("<h6 style='text-align: center; color: black;'>Universidad Nacional de San Agustin</h1>", unsafe_allow_html = True)
st.markdown("<h6 style='text-align: center; color: black;'>Arequipa - 2023</h1>", unsafe_allow_html = True)
st.divider()

# Resumen
st.header('1. Resumen')
col1, col2 = st.columns([1.8, 1], gap = 'large')
with col1:
     st.markdown('''<div style="text-align: justify;">
          El presente proyecto de investigación se realizo con la finalidad de optimizar el proceso de diseño de un
          sistema de transmisión de potencia como el que se muestra en la imagen. Para ello se analizaron los
          componentes principales de dichos sistemas, siendo estos: las correas planas, las correas trapezoidales, las cadenas, los engranajes y los ejes de tranmsión,
          en base a las distintas metodologias, criterios y normativas que existen en la actualidad. Una vez establecido 
          el proceso de cálculo para cada uno de ellos, se programaron los algoritmos respectivos y se desarrollo una interfaz gráfica para que el usuario pueda
          mejorar su diseño mediante la variación de los parametros iniciales del sistema. Posteriormente, gracias a la integración entre Matlab y GitHub, 
          se subió todo el codigo y la documentación a un repositorio virtual en la nube. Como resultado final se
          creó Power System Transmission Calculator, una aplicación informática amigable, accesible, actualizable y gratuita, que permite cálcular y diseñar los componentes previamente
          mencionados, de manera rapida, precisa y optima, cumpliendo asi con el proposito establecido en el proyecto de investigación.
     </div>''', unsafe_allow_html = True)
with col2:
     st.markdown(f'<img src = "data:image/gif;base64,{gif1}" width = "410">', unsafe_allow_html = True)

# Introducción
st.header('2. Introducción')
st.subheader('2.1 Problemática')
st.markdown('''<div style="text-align: justify;">
     En general, los sistemas industrializados disponen de motores eléctricos o de combustión interna para alimentarlos con la potencia necesaria para su 
     funcionamiento, lo cual significa que, el cálculo y diseño de un sistema de transmisión de potencia es un proceso frecuente a nivel industrial, y que, 
     si se realiza adecuadamente, permite reducir costos y mejorar el rendimiento general del sistema. El cálculo y diseño óptimo de estos sistemas está en función 
     a los requerimientos de las máquinas que lo conforman, y a las condiciones de trabajo de las mismas, por lo que esto será un proceso largo e iterativo 
     que demandará una considerable cantidad de tiempo y esfuerzo humano. En la actualidad existen soluciones que abordan este problema, siendo este el 
     caso de los programas de ingeniería asistida por computadora desarrollados por grandes empresas o de manera individual, sin embargo, en el primero 
     de estos casos, la solución resulta muy compleja y costosa, mientras que, en el segundo, la solución suele ser muy específica y de difícil acceso.
     En base a lo expuesto, desarrollar una aplicación computacional que permita el cálculo de los componentes principales de un sistema de transmisión de 
     potencia, haciendo uso de distintas metodologías que permitan abarcar mayores casuísticas de diseño y que, además, sea gratuita, sencilla y de fácil 
     acceso para cualquier tipo de usuario, supone una solución óptima para la problemática descrita, en comparación con las ya existentes.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.subheader('2.2 Antecendentes')
tab8, tab9, tab10, tab11, tab12, tab13, tab14, tab15 = st.tabs(['Tesis I', 'Tesis II', 'Tesis III', 'Tesis IV', 'Tesis V', 'Tesis VI', 'Tesis VII', 'Tesis VIII'])
with tab8:
     col47, col48, col49 = st.columns([1, 2, 1], gap = 'medium')
     with col47:
          st.image(img13)
     with col48:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de un programa para el diseño y verificación de ejes sometidos a fatiga
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Francisco Jose Mata Aroco
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Universidad Carlos III de Madrid - 2011
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar un programa que permita calcular y diseñar ejes sometidos a esfuerzos estáticos y dinámicos. El tesista 
               logró el objetivo planteado mediante el desarrollo del programa DICAVE.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Permite la selección de las unidades métricas a utilizar.
               <br>• Considera mayores teorias de cálculo en el diseño estático.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No permite analizar el eje de transmisión en cuanto a las deformaciones y vibraciones.
               <br>• Ignora a los esfuerzos generados por las fuerzas axiales y cortantes.
               <br>• No considera el modelo de Timoshenko para el diseño de ejes cortos.
               <br>• Limitada a analizar unicamente configuraciones de ejes con dos apoyos.
          </div>''', unsafe_allow_html = True)
     with col49:
          st.image(img14)
with tab9:
     col50, col51, col52 = st.columns([1, 2, 1], gap = 'medium')
     with col50:
          st.image(img15)
     with col51:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de un algoritmo para el diseño de árboles de transmisión de cajas reductoras de engranajes cilíndricos
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Jean Carlos Soto Jaimes
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Pontificia Universidad Católica del Perú - 2015
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar un algoritmo que permita diseñar arboles de transmisión de cajas reductoras mecánicas de engranajes 
               cilíndricos con distribución uniforme. El tesista logró el objetivo planteado mediante el desarrollo del programa PRODIAT.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Optimizado para el diseño de ejes de transmisión utilizados en cajas reductoras.
               <br>• Cuenta con las propiedades de los materiales mas usados para ejes de transmisión.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No permite analizar el eje de transmisión en cuanto a las deformaciones y vibraciones.
               <br>• Limitada a analizar unicamente cuatro configuraciones distintas para ejes.
               <br>• Ignora a los esfuerzos generados por las fuerzas axiales y cortantes.
               <br>• No considera el modelo de Timoshenko para el diseño de ejes cortos.
          </div>''', unsafe_allow_html = True)
     with col52:
          st.image(img16)
with tab10:
     col53, col54, col55 = st.columns([1, 2, 1], gap = 'medium')
     with col53:
          st.image(img17)
     with col54:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de aplicación para el diseño estocástico de ejes de transmisión de potencia
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Ana Margarita Buelvas Hernandez, Arturo Fabio Olier Arroyo y Jorge Andrés Carazo Tordecilla
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Universidad Tecnológica de Bolívar - 2016
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar una herramienta computacional que permita diseñar ejes de potencia sometidos a fatiga mediante un 
               análisis estocástico. Los tesistas lograron el objetivo planteado mediante el desarrollo del programa ScilabPrincipal.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Tiene en cuenta la variabilidad en las propiedades del material utilizado en la fabricación de ejes de transmisión de potencia.
               <br>• Tiene en cuenta las incertidumbres asociadas a las cargas aplicadas en los ejes.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No cuenta con una interfaz gráfica amigable con el usuario.
               <br>• No permite analizar a los ejes en cuanto a las vibraciones.
               <br>• No permite una simulación de los resultados.
          </div>''', unsafe_allow_html = True)
     with col55:
          st.image(img18)
with tab11:
     col56, col57, col58 = st.columns([1, 2, 1], gap = 'medium')
     with col56:
          st.image(img19)
     with col57:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de un software para el diseño asistido de ejes sometidos a cargas estáticas y dinámicas
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Edgar Alexis Martinez Sarmiento
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Escuela Politécnica Nacional - 2016
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar un software para el diseño asistido de ejes. El tesista logró el objetivo planteado mediante el 
               desarrollo del programa EJESDIM.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Permite el modelado 3D del eje en el software FreeCAD.
               <br>• Considera mayores teorias de cálculo en el diseño dinámico.
               <br>• El programa desarrollado se puede compartir con facilidad.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No permite analizar el eje de transmisión en cuanto a las deformaciones y vibraciones.
               <br>• Ignora a los esfuerzos generados por las fuerzas axiales y cortantes.
               <br>• No considera el modelo de Timoshenko para el diseño de ejes cortos.
               <br>• Limitada a analizar unicamente configuraciones de ejes con dos apoyos.
          </div>''', unsafe_allow_html = True)
     with col58:
          st.image(img20)
with tab12:
     col59, col60, col61 = st.columns([1, 2, 1], gap = 'medium')
     with col59:
          st.image(img21)
     with col60:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de un algoritmo para el diseño de árboles en cajas reductoras de velocidad con engranajes cilíndricos y ejes horizontales paralelos considerando resistencia a la fluencia, resistencia a la fatiga y deflexiones
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Alexander Richard López Ochoa
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Pontificia Universidad Católica del Perú - 2018
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar e implementar un algoritmo que permita diseñar árboles en cajas reductoras de velocidad con engranajes 
               cilíndricos y ejes horizontales paralelos. El tesista logró el objetivo planteado mediante el desarrollo del programa ADAR.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Optimizado para el diseño de ejes de transmisión utilizados en cajas reductoras.
               <br>• Permite el modelado 3D del eje en el software Inventor.
               <br>• El programa desarrollado se puede compartir con facilidad.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• Limitada a analizar unicamente configuraciones de ejes con dos apoyos.
               <br>• No permite analizar a los ejes en cuanto a las vibraciones.
               <br>• No considera el modelo de Timoshenko para el diseño de ejes cortos.
          </div>''', unsafe_allow_html = True)
     with col61:
          st.image(img22)
with tab13:
     col62, col63, col64 = st.columns([1, 2, 1], gap = 'medium')
     with col62:
          st.image(img23)
     with col63:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Diseño y desarrollo de una herramienta computacional para el cálculo del diámetro mínimo de ejes de transmisión, bajo la acción de cargas cíclicas
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Oscar Geovanny Rivera Estupiñan
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Universidad Nacional de Loja - 2020
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar y diseñar una herramienta computacional que permita calcular el diámetro mínimo de ejes sometidos a 
               cargas cíclicas. El tesista logró el objetivo planteado mediante el desarrollo del programa SHAFT DESING.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Permite el modelado 3D del eje en el software Inventor.
               <br>• Cuenta con las propiedades de los materiales mas usados para ejes de transmisión.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No permite analizar el eje de transmisión en cuanto a las vibraciones.
               <br>• Limitada a analizar unicamente cuatro configuraciones distintas para ejes.
               <br>• Ignora a los esfuerzos generados por las fuerzas axiales y cortantes.
               <br>• No considera el modelo de Timoshenko para el diseño de ejes cortos.
               <br>• No permite la simulación de los resultados.
          </div>''', unsafe_allow_html = True)
     with col64:
          st.image(img24)
with tab14:
     col65, col66, col67 = st.columns([1, 2, 1], gap = 'medium')
     with col65:
          st.image(img25)
     with col66:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Cálculo y diseño de engranajes conforme a la norma  ANSI  / AGMA  2101  -  04
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Juan Manuel Regalado Gonzales
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Universidad Carlos III de Madrid - 2015
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar una herramienta computacional que permita calcular y diseñar engranajes bajo la normativa ANSI/AGMA 
               2101-04. El tesista logró el objetivo planteado mediante el desarrollo del programa CYDE.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Permite guardar y cargar los archivos de cálculo.
               <br>• El programa desarrollado se puede compartir con facilidad.
               <br>• Toma en cuenta otras consideraciones relevantes en la operatividad de los engranajes. 
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• Varios de los factores necesarios para el diseño de los engranajes, necesitan ser ingresados manualmente por el usuario.
               <br>• No se toma en cuenta el tipo de engranaje a cálcular.
               <br>• Las cargas transmitidas no forman parte de los resultados.
          </div>''', unsafe_allow_html = True)
     with col67:
          st.image(img26)
with tab15:
     col68, col69, col70 = st.columns([1, 2, 1], gap = 'medium')
     with col68:
          st.image(img27)
     with col69:
          st.markdown('''<div style="text-align: justify;">
               <b>Título:</b> Desarrollo de software para el cálculo y selección de poleas trapezoidales para correas de alta capacidad y métricas
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Autor(es):</b> Juan Sebastian Ortiz Cadena y Gilbert Nicolas Marroquin Cifuentes
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Universidad y año:</b> Universidad Distrital Francisco José de Caldas - 2016
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Objetivo:</b> Desarrollar un software para el cálculo, selección y modelamiento gráfico de poleas trapezoidales para correas 
               de alta capacidad y métricas. Los tesistas lograron el objetivo planteado mediante el desarrollo del programa PulleysMHCalc.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos a favor:</b>
               <br>• Metodología de cálculo basada en la norma BS 3790 e ISO 4184.
               <br>• El programa desarrollado se puede compartir con facilidad.
               <br>• Permite el modelado 3D del eje en el software Solid Works.
               <br>• Cuenta con una base de datos mas amplia.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Puntos en contra:</b>
               <br>• No permite la optimización del diseño.
               <br>• Las cargas resultantes producto de la transmisión no forman parte de los resultados.
               <br>• No considera el desnivel entre el eje del motor y el eje de transmisión.
          </div>''', unsafe_allow_html = True)
     with col70:
          st.image(img28)
st.subheader('2.3 Objetivos')
with st.expander('#### 2.3.1 General', expanded = True):
     st.markdown('''<div style="text-align: justify;">
          ✅ Desarrollar una aplicación computacional que permita el cálculo y diseño óptimo de los componentes principales de un sistema de transmisión de potencia, haciendo 
          uso de distintas metodologías que permitan abarcar una gran cantidad de casuísticas y que, además, sea gratuita, sencilla y de fácil acceso 
          para cualquier tipo de usuario
     </div>''', unsafe_allow_html = True)
with st.expander('#### 2.3.2 Específicos', expanded = False):
     st.markdown('''<div style="text-align: justify;">
          <br>✅ Desarrollar el algoritmo para el cálculo de los factores necesarios para el diseño de los componentes de transmisión de potencia, haciendo uso del procesamiento de imagenes.
          <br>✅ Desarrollar el algoritmo de cálculo para el diseño de transmisiones de potencia por correas planas, correas trapezoidales, cadenas y engranajes (cilíndricos rectos, cilíndricos helicoidales, cilíndricos bihelicoidales y cónicos rectos).
          <br>✅ Desarrollar el algoritmo de cálculo para las reacciones y deformaciones presentes en los ejes de transmisión bajo cualquier configuración geométrica o mecánica, considerando la teoría de Euler-Bernoulli y Timoshenko.
          <br>✅ Desarrollar el algoritmo de cálculo para el diseño de ejes de transmisión bajo un enfoque estático, dinámico, vibracional, de vida y de rigidez, considerando a los efectos de las cargas axiales y cortantes.
          <br>✅ Desarrollar el algoritmo de cálculo para el analisis de los esfuerzos y deformaciones en elementos de espesor constante, mediante el método de los elementos finitos.
          <br>✅ Implementar los algoritmos desarrollados en una interfaz gráfica amigable con el usuario final.
          <br>✅ Validar los resultados obtenidos a travez de la aplicación desarrollada.
          <br>✅ Ejemplificar el uso de la aplicación desarrollada.
          <br>✅ Hacer accesible la aplicación desarrollada para cualquier usuario.
          <br>✅ Elaborar la documentación y tutoriales de uso de la aplicación desarrollada.
     </div>''', unsafe_allow_html = True)

# Marco Teorico
st.header('3. Marco Teórico')
tab1, tab2, tab3, tab4, tab5, tab6, tab7 = st.tabs(['Correas planas', 'Correas trapezoidales', 'Cadenas', 'Engranajes', 'Ejes de transmisión', 'Chavetas y rodamientos', 'Elementos finitos'])
# Correas planas
with tab1:
     col7, col8 = st.columns([1, 3], gap = 'medium')
     with col7:
          st.image(img1)
     with col8:
          st.markdown('''<div style="text-align: justify;">
               Se analizan bajo la metodología desarrollada por la empresa Forbo, la cual, mediante datos de entrada 
               conocidos como la potencia y revoluciones del motor, los diámetros de las poleas y la distancia entre 
               las mismas, permite calcular las dimensiones del tipo de correa elegida junto con las fuerzas que se 
               transmitirán al eje de transmisión de potencia.
          </div>''', unsafe_allow_html = True)
          st.markdown('#####')
          with st.expander("Diagrama", expanded = True):
               cytoscape(elements = elements1, stylesheet = stylesheet1, layout = layout1, selection_type = "single", key = "cyto1", 
               user_panning_enabled = True, user_zooming_enabled = True, min_zoom = 1, max_zoom = 1.75, width = "100%", height = "245px")
# Correas trapezoidales
with tab2:
     col9, col10 = st.columns([1, 3], gap = 'medium')
     with col9:
          st.image(img2)
     with col10:
          st.markdown('''<div style="text-align: justify;">
               Se analizan bajo la metodología desarrollada por la empresa Optibelt, la cual, mediante datos de 
               entrada conocidos como la potencia y revoluciones del motor, los diámetros de las poleas y la distancia 
               entre las mismas, permite calcular el número de correas a emplear, las dimensiones del tipo de correa 
               elegida junto con las fuerzas que se transmitirán al eje de transmisión de potencia.
          </div>''', unsafe_allow_html = True)
          st.markdown('#####')
          with st.expander("Diagrama"):
               cytoscape(elements = elements2, stylesheet = stylesheet2, layout = layout2, selection_type = "single", key = "cyto2", 
               user_panning_enabled = True, user_zooming_enabled = True, min_zoom = 1, max_zoom = 1.75, width = "100%", height = "245px")
# Cadenas
with tab3:
     col11, col12 = st.columns([1, 3], gap = 'medium')
     with col11:
          st.image(img3)
     with col12:
          st.markdown('''<div style="text-align: justify;">
               Se analizan bajo la metodología desarrollada por la empresa Renold, la cual, mediante datos de entrada 
               conocidos como la potencia y revoluciones del motor, el número de dientes de los sprokets y la distancia 
               entre los mismos, permite calcular el número de cadenas a emplear, las dimensiones del tipo de cadena 
               elegida junto con las fuerzas que se transmitirán al eje de transmisión de potencia.
          </div>''', unsafe_allow_html = True)
          st.markdown('#####')
          with st.expander("Diagrama"):
               cytoscape(elements = elements3, stylesheet = stylesheet3, layout = layout3, selection_type = "single", key = "cyto3", 
               user_panning_enabled = True, user_zooming_enabled = True, min_zoom = 1, max_zoom = 1.75, width = "100%", height = "220px")
# Engranajes
with tab4:
     col13, col14 = st.columns([1, 3], gap = 'medium')
     with col13:
          st.image(img4)
     with col14:
          st.markdown('''
               Se analizan bajo la norma ANSI / AGMA 2101-D04, en la cual se definen cuatro tipos de fallas, 
               de las cuales las más importantes son la falla por picadura y la falla por flexión. La aplicación permite el cálculo 
               de los siguientes tipos de engranajes:

               + Engranajes rectos
               + Engranajes helicoidales y bihelicoidales
               + Engranajes conicos rectos

               Los cálculos se realizan aplicando las siguientes ecuaciones:
          ''')
          st.latex(r'\begin{array}{c|cc} & \text{Falla por picadura} & \text{Falla por flexión} \\ \\ \hline \\ \text{Esfuerzo} & \sigma_h = Z_e\sqrt{\frac{F_t K_o K_v K_s K_h Z_r}{d_{w1}bZ_i}} & \sigma_f = \frac{F_t K_o K_v K_s K_h K_b}{bm_t Y_j} \\ \text{Esfuerzo admisible} & \sigma_{ha} = \frac{\sigma_{hp}Z_n Z_w}{S_h Y_\theta Y_z} & \sigma_{fa} = \frac{\sigma_{fp}Y_n}{S_f Y_\theta Y_z} \\ \text{Potencia} & P_{az} = \frac{\pi \omega_1 bZ_i}{6.10^7 K_o K_v K_s K_h Z_r}\left(\frac{d_{w1} \sigma_{hp} Z_n Z_w}{Z_e S_h Y_\theta Y_z}\right)^2 & P_{ay} = \frac{\pi \omega_1 d_{w1} b m_t Y_j \sigma_{fp} Y_n}{6.10^7 K_o K_v K_s K_h K_b S_f Y_\theta Y_z} \end{array}')
# Ejes
with tab5:
     col15, col16 = st.columns([1, 3], gap = 'medium')
     with col15:
          st.image(img5)
     with col16:
          with st.expander('Teorías', expanded = True):
               st.markdown('''
                    + Euler-Bernoulli: No toma en cuenta los efectos de las fuerzas cortantes 
                    en la deformación del eje, por lo que resulta adecuada para ejes largos ($L/D>10$).
                    + Timoshenko: Toma en cuenta los efectos de las fuerzas cortantes 
                    en la deformación del eje, por lo que resulta adecuada para ejes cortos ($L/D<10$). 
               ''')
               st.latex(r'\small \begin{array}{ccccc} \text{Análisis estático} & \text{Análisis dinámico} & \text{Análisis vibracional} & \text{Análisis de rigidez} & \text{Análisis de vida}\\ \hline \\ \text{Von Misses} & \text{Soderberg} & \text{Dunkerley} & \text{Pendientes} & \text{Wohler}\\\\ \text{Tresca} & \text{Goodman} & \text{Rayleigh} & \text{Deflexiones} \\\\ \text{Rankine} & \text{ASME} & & \\ \end{array}')               
          with st.expander('Diagrama'):
               cytoscape(elements = elements4, stylesheet = stylesheet4, layout = layout4, selection_type = "single", key = "cyto4", 
               user_panning_enabled = True, user_zooming_enabled = True, min_zoom = 0.5, max_zoom = 0.75, width = "100%", height = "275px")               
# Chavetas y rodamientos
with tab6:
     col17, col18, col74 = st.columns([1, 2, 1], gap = 'medium')
     with col17:
          st.image(img6)
     with col18:
          st.markdown('''<div style="text-align: justify;">
               Se analizan bajo la metodología desarrollada en el libro "Diseño de elementos de máquinas" de Bhandari y unicamente se 
               computan las chavetas del tipo cuadradas. Sus dimensiones (b x h x l) se calculan mediante las siguientes expresiones:
          </div>''', unsafe_allow_html = True)
          st.markdown('######')
          st.latex(r'l=\frac{4Tn}{\sigma _{fluencia}R^2} \hspace{2cm} b=h=\frac{R}{2}')
          st.markdown(r'''
               Donde:

               • $T$ : Torque

               • $n$ : Factor de seguridad

               • $R$ : Radio del eje
          ''')
          st.write('''     
               Por otra parte, los rodamientos se pueden diseñar por medio de una 
               herramienta gratuita proporcionada por la empresa [SKF](https://www.skfbearingselect.com/#/bearing-selection-start):
          ''')
     with col74:
          st.image(img38)
# Elementos finitos
with tab7:
     col19, col20 = st.columns([1, 3], gap = 'medium')
     with col19:
          st.image(img7)
     with col20:
          st.markdown('''<div style="text-align: justify;">
               La idea básica del método de los elementos finitos consiste en discretizar el dominio del problema en sub-regiones, en las cuales, 
               las ecuaciones en derivadas parciales siguen siendo totalmente válidas y calculables, empleando para ello una aproximación polinomial.
               La discretizacion consiste en convertir las ecuaciones de derivadas parciales complejas en sistemas de ecuaciones lineales que 
               pueden ser resueltas por medios computacionales. Una parte de esos sistemas de ecuaciones se denomina matriz de rigidez, la cual 
               contiene las propiedades físicas de los elementos que conforman el fenómeno físico. La forma de la matriz de rigidez 
               depende del tipo de elemento a analizar y pueden ser del tipo local y global. De manera general, la matriz de rigidez local se puede 
               escribir como:
          </div>''', unsafe_allow_html = True)
          st.latex(r'[f]=[k][d]')
          st.markdown('''<div style="text-align: justify;">
               La matriz de rigidez global, la cual representa el conjunto ensamblado de todas las matrices de rigidez local, se define como:
          </div>''', unsafe_allow_html = True)
          st.latex(r'[F]=[K][d]')
          st.markdown('''<div style="text-align: justify;">
               Esta última, sin importar el tipo de elemento a analizar, presenta las siguientes propiedades:</br>
               • Es cuadrada, ya que relaciona un número equivalente tanto de fuerzas como de desplazamientos.</br>
               • Es simétrica, para todos los elementos que comprende.</br>
               • Es singular, por lo que no posee inversa hasta que se le aplique las suficientes condiciones de frontera. </br>
          </div>''', unsafe_allow_html = True)
st.markdown('#####')
col102, col103, col104, col105, col106 = st.columns([2, 1, 2, 1, 2], gap = 'small')
with col102:
     st.markdown('''<div style="text-align: center;"><span style="font-size: 25px;">
          Matlab - App Designer
     </span></div>''', unsafe_allow_html = True)
     st.image(img50, use_column_width = True)
     st.markdown('''<div style="text-align: justify;">
          Matlab es un entorno de programación y software de alto rendimiento utilizado en matemáticas y ciencias de la ingeniería. Ofrece una amplia 
          gama de herramientas para análisis numérico, visualización de datos y desarrollo de algoritmos. Los usuarios pueden resolver 
          ecuaciones, realizar análisis estadísticos, crear gráficos personalizados y desarrollar aplicaciones interactivas.
     </div>''', unsafe_allow_html = True)
with col104:
     st.markdown('''<div style="text-align: center;"><span style="font-size: 25px;">
          GitHub
     </span></div>''', unsafe_allow_html = True)
     st.image(img51, use_column_width = True)
     st.markdown('''<div style="text-align: justify;">
          GitHub es una plataforma de desarrollo colaborativo que ofrece control de versiones, seguimiento de problemas, entorno de programación y alojamiento de proyectos de 
          software. Facilita la colaboración entre programadores y equipos de desarrollo, permitiendo el seguimiento de cambios, la gestión de 
          problemas y el alojamiento de repositorios de código.
     </div>''', unsafe_allow_html = True)
with col106:
     st.markdown('''<div style="text-align: center;"><span style="font-size: 25px;">
          Python - Streamlit
     </span></div>''', unsafe_allow_html = True)
     st.image(img52, use_column_width = True)
     st.markdown('''<div style="text-align: justify;">
          Streamlit es una biblioteca de Python que simplifica la creación de aplicaciones web interactivas para visualización de datos y prototipado 
          rápido. Permite a los desarrolladores convertir fácilmente scripts de datos en aplicaciones web dinámicas con widgets interactivos 
          para gráficos, tablas y más. Es una herramienta valiosa para la creación rápida de aplicaciones basadas en datos.
     </div>''', unsafe_allow_html = True)
     
# Marco Metodologico
st.header('4. Marco Metodológico')
# Calculo de factores
st.subheader('4.1 Correas planas, correas trapezoidales, cadenas y engranajes')
col3, col4 = st.columns([1, 1], gap = 'medium')
with col3:
     with st.form('form1'):
          st.markdown('''<div style="text-align: justify;">
               En el proceso de cálculo de estos componentes resulta 
               indispensable hacer uso de parámetros numéricos exclusivos de cada uno de estos, los cuales por lo general, se representan y determinan 
               mediante el uso de gráficos y tablas. En línea con lo anterior, resulta pertinente señalar que, mediante el procesamiento de imágenes se han extraido los datos de las gráficas 
               correspondientes a cada uno de estos parametros numéricos, para poder representarlos mediante tablas y, posteriormente, mediante 
               interpolaciones (unidimensionales o bidimensionales), poder calcular el parámetro numérico deseado de manera rapida y precisa. Para el citado procesamiento, se hacen uso de las siguientes ecuaciones
          </div>''', unsafe_allow_html = True)
          st.markdown('#####')
          st.latex(r'{x_{{n_{a,b}}}} = \frac{{{x_{{n_{b,a}}}} - {x_{{1_{b,a}}}}}}{{{x_{{2_{b,a}}}} - {x_{{1_{b,a}}}}}}\left( {{x_{{2_{a,b}}}} - {x_{{1_{a,b}}}}} \right) + {x_{{1_{a,b}}}}')
          st.latex(r'{y_{{n_{a,b}}}} = \frac{{{y_{{n_{b,a}}}} - {y_{{1_{b,a}}}}}}{{{y_{{2_{b,a}}}} - {y_{{1_{b,a}}}}}}\left( {{y_{{2_{a,b}}}} - {y_{{1_{a,b}}}}} \right) + {y_{{1_{a,b}}}}')
          st.markdown('#####')
          st.write('Con los parametros numéricos ya tabulados, el cálculo se efectúa como sigue:')
          col93, col94 = st.columns([1, 1])
          with col93:
               slider_1 = st.slider('Ángulo', 5, 35, 5, 1)
          with col94:
               slider_2 = st.slider('Dientes', 20, 300, 20, 1)
          submitted1 = st.form_submit_button("Cálcular factor geométrico", use_container_width = True)
          fg, fig1 = f2_img(slider_1, slider_2, imgn)
          st.info('El factor geometrico es: ' + str(fg))
with col4:
     st.pyplot(fig1, use_container_width = True)
# Calculo de los angulos de descomposicion
col25, col26 = st.columns([1, 1], gap = 'medium')
with col26:
     with st.form('form2'):
          st.markdown('''<div style="text-align: justify;">
               Por otra parte, en la mayoría de casos, la trasmisión de potencia hacia el eje se dará de manera indirecta, es decir, 
               por medio de corras o cadenas, las cuales podrian ubicarse en distintas configuraciones geométricas.
               En concecuencia, para efectos de un análisis más realista, las fuerzas que actúan en el eje producto de la transmisión de 
               potencia, deben de descomponerse en ejes alineados en las direcciones paralela y perpendicular a la gravedad. Los ángulos 
               de descomposición son:
          </div>''', unsafe_allow_html = True)
          st.latex(r'\beta = 90 + \varphi  - \phi \hspace{3mm} \text{y} \hspace{3mm} \alpha = 2\varphi - \beta')
          st.latex(r'\text{donde} \hspace{10mm} \phi = \cos^{-1} \left( \frac{R - r}{a} \right)')
          col27, col28 = st.columns([1,1])
          with col27:
               number_input_1 = st.number_input('Radio menor (r)', 0.0, 1.05, 0.1, 0.05)
               number_input_2 = st.number_input('Radio mayor (R)', 0.0, 1.05, 0.2, 0.05)
          with col28:
               number_input_3 = st.number_input('Distancia entre centros (a)', 0.0, 1.05, 0.4, 0.05)
               number_input_4 = st.number_input('Angulo de desfase (𝜑)', 0, 360, 0, 1)
          submitted2     = st.form_submit_button('Cálcular ángulos', use_container_width = True)
          st.markdown('''<div style="text-align: justify;">
               Al momento de efectuar la descomposición de las fuerzas sobre el eje debe de tenerse en cuenta el sentido de giro del motor.
          </div>''', unsafe_allow_html = True)
          st.markdown('#')
          select_slider1 = st.select_slider('Sentido de giro del motor', options = ['Giro antihorario', 'Giro horario'], value = 'Giro horario', label_visibility = 'collapsed')
with col25:
     fig2, beta, alpa = f3_des(number_input_1, number_input_2, number_input_3, number_input_4, select_slider1)
     st.pyplot(fig2, use_container_width = True)
     fmax = 65
     fmin = 35
     st.markdown(f'$\quad$ :green[$\large β = {beta}$] $\quad \quad$ :orange[$\large α = {alpa}$]  $\quad \quad \quad$ :red[$\large F_+ = {fmax}$] $\quad \quad$ :blue[$\large F_- = {fmin}$]')
     if select_slider1 == 'Giro antihorario':
          FMcos = np.round(fmax * np.cos(np.deg2rad(beta)), 2)
          Fmcos = np.round(fmin * np.cos(np.deg2rad(alpa)), 2)
          FMsin = np.round(fmax * np.sin(np.deg2rad(beta)), 2)
          Fmsin = np.round(fmin * np.sin(np.deg2rad(alpa)), 2)
          fxpr  = np.round(FMcos + Fmcos, 2)
          fypr  = np.round(FMsin + Fmsin, 2)
          st.markdown(f'$\quad F_x = F_+\cos β + F_-\cos α = ({FMcos}) + ({Fmcos}) = {fxpr} → {abs(fxpr)}$')
          st.markdown(f'$\quad F_y = F_+\sin β + F_-\sin α = ({FMsin}) + ({Fmsin}) = {fypr} → {abs(fypr)}$')
     else:
          FMcos = np.round(fmax * np.cos(np.deg2rad(alpa)), 2)
          Fmcos = np.round(fmin * np.cos(np.deg2rad(beta)), 2)
          FMsin = np.round(fmax * np.sin(np.deg2rad(alpa)), 2)
          Fmsin = np.round(fmin * np.sin(np.deg2rad(beta)), 2)
          fxpr  = np.round(Fmcos + FMcos, 2)
          fypr  = np.round(Fmsin + FMsin, 2)
          st.markdown(f'$\quad F_x = F_-\cos β + F_+\cos α = ({Fmcos}) + ({FMcos}) = {fxpr} → {abs(fxpr)}$')
          st.markdown(f'$\quad F_y = F_-\sin β + F_+\sin α = ({Fmsin}) + ({FMsin}) = {fypr} → {abs(fypr)}$')
# Calculo de ejes
st.subheader('4.2 Ejes de transmisión')
# Calculo de ejes - Analítico
st.markdown('#### 4.2.1 Cálculo general de las reacciones y desplazamientos mediante ecuaciones análiticas (Euler - Bernoulli)')
st.markdown('''<div style="text-align: justify;">
     Mediante el uso del método de las integraciones concecutivas se pueden cálcular las reacciones y desplazamientos correspondientes a un eje 
     con propiedades geométricas y mecánicas no constantes, sometido a cualquier cantidad de fuerzas, momentos y apoyos. El procedimiento de
     cálculo inicia con la formulación de la ecuación analítica de las fuerzas cortantes (fuerzas puntuales y distribuidas en el diagrama de cuerpo libre), 
     para posteriormente realizar integraciones concecutivas de dicha ecuacíon, con lo cual se obtienen las siguientes ecuaciones: 
</div>''', unsafe_allow_html = True)
st.latex(r'''  
     \begin{array}{|c | c |c |}\hline\\
     \text{ Ecuación } & \text{ Representativa } & \text{ Aplicativa:}\hspace{5mm} para\;k = 1\; \to \;T\hspace{5mm}\text{ donde T es el numero de tramos del eje} \\\\\hline\\
     \text{Cortantes}       & {{V_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{W_T}(x)dx} }           & {V_k}(x) =  - \sum\limits_{i = 1}^k {{F_i}}  - {w_k}(x - {x_k}) - \sum\limits_{i = 1}^{k} {{w_{i-1}}({x_{i}} - {x_{i-1}})}\\\\\hline\\
     \text{Momentos}      & {{M_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{V_T}(x)dx} }              & {M_k}(x) =  - x\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{2}{w_k}{(x - {x_k})^2} - x\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + {C_{{1_k}}} + {M_k} \\\\\hline\\
     \text{Pendientes}     & {{\theta _T} = \frac{{\int\limits_{{x_T}}^{{x_{T + 1}}} {{M_T}(x)dx} }}{{{E_T}{I_T}}}}             & {E_k}{I_k}{\theta _k}(x) = { - \frac{{{x^2}}}{2}\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{6}{w_k}{{(x - {x_k})}^3} - \frac{{{x^2}}}{2}\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + {C_{{1_k}}}x + {M_k}x + {C_{{2_k}}}} \\\\\hline\\
     \hspace{2mm}\text{Deflexiones}\hspace{2mm}     & \hspace{4mm} {{y_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{\theta _T}(x)dx} } \hspace{4mm} & \hspace{5mm} {E_k}{I_k}{y_k}(x) = { - \frac{{{x^3}}}{6}\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{{24}}{w_k}{{(x - {x_k})}^4} - \frac{{{x^3}}}{6}\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + \frac{{{C_{{1_k}}}{x^2}}}{2} + \frac{{{M_k}{x^2}}}{2} + {C_{{2_k}}}x + {C_{{3_k}}}} \hspace{5mm}\;\\\\\hline
     \end{array}
''')
col21, col22 = st.columns([2, 1], gap = 'large')
with col21:
     st.latex(r'''
          {\begin{array}{|c | c |c |c |c |}\hline
          \\\text{Tramo} & \text{Cortantes} & \text{Momentos} & \text{Sustitucion} & \text{Resultados} \\\\\hline\\
          {{x_1} \to {x_2}}& {{V_1}(x) = \int {{w_1}(x)} } & {{M_0}({x_1}) = \int {{V_1}(x) + {C_{{1_1}}} + {M_1}} } & {x = {x_1}} & {{C_{{1_1}}}} \\
          &   & {{M_1}(x) = \int {{V_1}(x) + {C_{{1_1}}} + {M_1}} } & {x = {x_2}} & {{M_1}({x_2})} \\\\\hline\\
          {{x_2} \to {x_3}} & {{V_2}(x) = \int {{w_2}(x)} } & {{M_1}({x_2}) = \int {{V_2}(x) + {C_{{1_2}}} + {M_2}} } & {x = {x_2}} & {{C_{{1_2}}}} \\              
          &   & {{M_2}(x) = \int {{V_2}(x) + {C_{{1_2}}} + {M_2}} } & {x = {x_3}} & {{M_2}({x_3})} \\\\\hline \\
          \vdots & \vdots & \vdots & \vdots & \vdots \\ 
          {{x_T} \to {x_{T + 1}}} & {{V_T}(x) = \int {{w_T}(x)} } & {{M_{T - 1}}({x_T}) = \int {{V_T}(x) + {C_{{1_T}}} + {M_T}} } & {x = {x_T}} & {{C_{{1_T}}}} \\          
          &  & {{M_T}(x) = \int {{V_T}(x) + {C_{{1_T}}} + {M_T}} } & {x = {x_{T + 1}}} & {{M_T}({x_{T + 1}})} \\\\\hline
          \end{array}}
     ''')
with col22:
     st.markdown('#####')
     st.markdown('####')
     st.markdown('''<div style="text-align: justify;">
          En las ecuaciones planteadas se observa que existen tres constantes de integración, las cuales junto con las reacciones en los apoyos, 
          actuan como incognitas a despejar; no obstante, 
          la primera de estas constantes de integración, se computa de manera simultanea con la integración de la ecuación de cortantes 
          para el cálculo de la ecuación de momentos, seguiendo el procedimiento que se describe en el cuadro de la izquierda.
          En concecuencia, el valor de dicha constante se cálcula mediante la siguiente expresión: 
     </div>''', unsafe_allow_html = True)
     st.markdown('#####')
     st.latex(r'''
          {{C_{{1_k}}} = {M_{k - 1}}({x_k}) - \int {{V_k}({x_k}) - {M_k}}}
     ''')
col23, col24 = st.columns([2.1, 1], gap = 'medium')
with col23:
     st.markdown('#')
     st.markdown('''<div style="text-align: justify;">
          Dado que las reacciones a cálcular dependen del tipo de apoyos presentes en el eje, se puede definir el número de incógnitas por 
          reacciones, en función al número y tipo de apoyos; mientras que el número de constantes de integración a cálcular se puede definir
          a partir del número de tramos del eje. Entonces, si [AS] representa el número de apoyos simples, [AE] representa el número de apoyos 
          elásticos, [AF] representa el número de apoyos fijos y [T] representa el número de tramos del eje, se concluye que:
     </div>''', unsafe_allow_html = True)
     st.markdown('#####')
     st.markdown('+ Número de reacciones a cálcular: $2AS + 3AE + 6AF$')
     st.markdown('+ Número de constantes de integración a cálcular: $4T$')
     st.markdown('+ Número total de incognitas a cálcular: $4T + 2AS + 3AE + 6AF$')
with col24:
     st.latex(r'''
          \begin{array}{|c | c |c |c |}\hline
          \hspace{2mm} \text{Apoyo} \hspace{2mm}& \hspace{2mm}\text{Simple} \hspace{2mm}& \text{Elastico} &\hspace{3mm} \text{Fijo} \hspace{3mm}\\\hline
          F_z & \checkmark & \checkmark & \checkmark \\\hline
          F_y & \checkmark & \checkmark & \checkmark \\\hline
          F_x & \times & \checkmark & \checkmark \\\hline
          M_z & \times & \times & \checkmark \\\hline
          M_y & \times & \times & \checkmark \\\hline
          M_x & \times & \times & \checkmark \\\hline
          \delta_z & \times & \times & \times \\\hline
          \delta_y & \times & \times & \times \\\hline
          \delta_x & \checkmark & \times & \times \\\hline
          \theta_z & \checkmark & \checkmark & \times \\\hline
          \theta_y & \checkmark & \checkmark & \times \\\hline
          \theta_x & \checkmark & \checkmark & \times \\\hline
          \end{array}
     ''')
st.markdown('''<div style="text-align: justify;">
     En línea con lo anterior, es necesario establecer un sistema de ecuaciones con dimensión igual al numero de incognitas calculado. 
     Las ecuaciones para dicho sistema, se formulan a partir de las condiciones de frontera presentes en cada uno de los apoyos, de las condiciones 
     de continuidad en las ecuaciones analíticas de pendientes y deflexiones, y de las condiciones que establece el equilibrio 
     estático paras las fuerzas y momentos. El sistema de ecuaciones es el siguiente:
</div>''', unsafe_allow_html = True)
st.latex(r'''\large
     \begin{array}{|c | c |c |}\hline\\
     \text{Condición} & \text{Ecuación} & \text{Número de ecuaciones} \\\\\hline\\ 
     \delta_x=0 & \sum_{i=1}^{T}\frac{F_{x_i}(x_{i+1}-x_i)}{E_iA_i}=0 & AE+AF-1 \\\\\hline\\ 
     \delta_y=0 & y_{(x)_T}=0 & AS+AE+AF \\\\\hline\\ 
     \delta_z=0 & z_{(x)_T}=0 & AS+AE+AF\\\\\hline\\ 
     \theta_x=0 & \sum_{i=1}^{T}\frac{M_{x_i}(x_{i+1}-x_i)}{J_iG_i}=0 & AF-1 \\\\\hline\\ 
     \theta_y=0 & \alpha_{(x)_T}=0 & AF \\\\\hline\\ 
     \theta_z=0 & \beta_{(x)_T}=0 & AF \\\\\hline\\ 
     \delta_{T_2}=\delta_{T+1_1} & y_{(x_2)_T}=y_{(x_1)_{T+1}} & T-1 \\ 
     & z_{(x_2)_T}=z_{(x_1)_{T+1}} & T-1 \\\\\hline\\ 
     \theta_{T_2}=\theta_{T+1_1} & \alpha_{(x_2)_T}=\alpha_{(x_1)_{T+1}} & T-1 \\ 
     & \beta_{(x_2)_T}=\beta_{(x_1)_{T+1}} & T-1 \\\\\hline\\ 
     \sum F_x=0 & \sum_{i=1}^TF_{x_i}=0 & 1\\\\\hline\\ 
     \sum F_y=0 & \sum_{i=1}^{T+1} F_{y_i}+\sum_{i=1}^T w_{y_i}(x_{i+1}-x_i)=0 & 1\\\\\hline\\ 
     \sum F_z=0 & \sum_{i=1}^{T+1} F_{z_i}+\sum_{i=1}^T w_{z_i}(x_{i+1}-x_i)=0 & 1\\\\\hline\\ 
     \sum M_x=0 & \sum_{i=1}^TM_{x_i}=0 & 1\\\\\hline\\ 
     \sum M_y=0 & \sum_{i=1}^{T+1} M_{y_i}+ \sum_{i=1}^{T} x_{i+1}F_{y_{i+1}} + \sum_{i=1}^{T}\frac{w_{y_i}(x_{i+1}-x_i)(x_{i+1}+x_i)}{2}=0& 1\\\\\hline\\ 
     \hspace{10.5mm} \sum M_z=0 \hspace{10.5mm} & \hspace{10mm} \sum_{i=1}^{T+1} M_{z_i}+ \sum_{i=1}^{T} x_{i+1}F_{z_{i+1}} + \sum_{i=1}^{T}\frac{w_{z_i}(x_{i+1}-x_i)(x_{i+1}+x_i)}{2}=0 \hspace{10mm} & 1\\\\\hline\\  
     & \text{Número total de ecuaciones } & 4T+2AS+3AE+6AF\\\\\hline
     \end{array}
''')
st.markdown('''<div style="text-align: justify;">
     Dado que el número de ecuaciones que se pueden establecer es igual al número de incógnitas que se deben de calcular, se infiere 
     que, sin importar el tipo o la cantidad de apoyos y cargas presentes, o que las propiedades geométricas y mecánicas varien, 
     siempre será posible calcular todas las reacciones y desplazamientos a los que se encuentre sometido un eje de transmisión de 
     potencia, lo cual valida la metodología de cálculo general de ejes, desarrollada para el modelo de Euler y Bernoully.
</div>''', unsafe_allow_html = True)
st.markdown('#### 4.2.2 Cálculo general de las reacciones y desplazamientos mediante elementos finitos (Timoshenko)')
# Calculo de ejes - Numerico
st.markdown('''<div style="text-align: justify;">
     Mediante el uso de matrices se pueden cálcular las reacciones y desplazamientos correspondientes a un eje 
     con propiedades geométricas y mecánicas no constantes, sometido a cualquier cantidad de fuerzas, momentos y apoyos. 
     El procedimiento de cálculo inicia con la formulación de la matriz de rigidez local para cada elemento del eje, para posteriormente 
     ensamblarlas y establecer la matriz de rigidez global, la cual junto con las matrices de cargas y deformaciones, permiten cálcular 
     todas las incognitas, siempre y cuando se hayan pre establecido las condiciones de frontera de manera apropiada, en cada una de las 
     matrices previamente mencionadas.  
</div>''', unsafe_allow_html = True)
st.markdown('#####')
col29, col30 = st.columns([2, 1], gap = 'large')
with col29:
     equation = r"""
     $$
     \large \begin{matrix} 
     \text{Matriz de } f \text{ y } m & \text{Matriz de rigidez local } k & \text{Matriz de } \delta \text{ y } \theta \\ \hline \\
     \begin{bmatrix} \hspace{0.85mm} F_{{1_X}} \hspace{0.85mm} \\ F_{{2_X}} \\ \vdots \end{bmatrix} & \frac{{AE}}{{L}}\begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} & \begin{bmatrix} \hspace{0.25mm} \delta _{{1_X}} \hspace{0.25mm} \\ \delta _{{2_X}} \\ \vdots \end{bmatrix} \\ \\
     \begin{bmatrix} M_{{1_X}} \\ M_{{2_X}} \\ \vdots \end{bmatrix} & \frac{{JG}}{{L}}\begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} & \begin{bmatrix} \theta _{{1_X}} \\ \theta _{{2_X}} \\ \vdots \end{bmatrix} \\ \\
     \begin{bmatrix} \hspace{1.6mm} F_1 \hspace{1.6mm} \\ M_1 \\ F_2 \\ M_2 \\ \vdots \end{bmatrix} & \frac{{EI}}{{L^3(1 + \varphi)}}\begin{bmatrix} 12 & 6L & -12 & 6L \\ 6L & (4 + \varphi)L^2 & -6L & (2 - \varphi)L^2 \\ -12 & -6L & 12 & -6L \\ 6L & (2 - \varphi)L^2 & -6L & (4 + \varphi)L^2 \end{bmatrix} & \begin{bmatrix} \hspace{1mm} \delta _1 \hspace{1mm} \\ \theta _1 \\ \delta _2 \\ \theta _2 \\ \vdots \end{bmatrix} \\
     \end{matrix}
     $$
     """
     st.markdown(equation, unsafe_allow_html = True)
with col30:
     st.markdown('''<div style="text-align: justify;">
          A diferencia de la teoría de Euler y Bernoulli, la teoría de Timoshenko toma en cuenta los efectos de las cargas cortantes 
          por medio del coeficiente 𝜑, el cual se cálcula con:  
     </div>''', unsafe_allow_html = True)
     st.latex(r'\varphi=\frac{12EI}{K_sAGL^2}')
     st.markdown('''<div style="text-align: justify;">
          En esta ecuacíon aparece un nuevo termino conocido como factor de area, el cual depende del area de la sección del eje de transmisión y se computa 
          mediante la siguiente expresión: 
     </div>''', unsafe_allow_html = True)
     st.latex(r'K_s=\frac{6(1+\nu)(1+m^2)^2}{(7+6\nu)(1+m^2)^2+(20+12\nu)m^2}')
     st.write('Donde:')
     st.latex(r'm = \frac{r}{R} \quad v = \text{Coeficiente de Poisson (0.3)}')
# url10 = 'https://junior19a2000.github.io/Jupywidgets/lab?path=ShaftDemo.ipynb'
# st.markdown(f'<iframe src={url10} height="760" width="100%"></iframe>', unsafe_allow_html = True)
# Analisis estatico de ejes
st.markdown('#### 4.2.3 Análisis estático')
col31, col32 = st.columns([1, 1], gap = 'medium')
with col31:
     st.markdown('''<div style="text-align: justify;">
          El módulo de ejes tiene como objetivo calcular los resultados mas críticos en todo el dominio del eje, por lo que resulta 
          necesario, establecer un elemento en específico para cada punto de análisis, en el cual estén presentes dichos resultados. 
          A priori, teniendo en cuenta las ecuaciones para el cálculo de los esfuerzos, se infiere que tal elemento 
          se encontrara en el contorno de la sección que se analice, no obstante, analizar todos los elementos del contorno de la 
          sección para determinar cual es el más crítico, se traduce en un elevado costo computacional y tiempo; por lo que es 
          imprescindible definir con antelación cual será el elemento a analizar, lo cual no implica necesariamente 
          que se deba conocer su posición exacta. 
     </div>''', unsafe_allow_html = True)
with col32:
     st.image(img8)
col33, col34 = st.columns([1, 2.3], gap = 'medium')
with col33:
     st.markdown('##')
     st.markdown('#####')
     st.image(img9)
with col34:
     st.write('Los esfuerzos que se analizaran en dicho elemento son:')
     st.latex(r'\small \sigma_x=\frac{F_x}{A} \quad \sigma_y=\frac{M_yc}{I} \quad \sigma_z=\frac{M_zc}{I} \quad \tau_x=\frac{M_xc}{J} \quad \tau_y=\frac{F_yQ}{It} \quad \tau_z=\frac{F_zQ}{It}')
     st.write('Las propiedades geómetricas para un eje de transmisión hueco se calculan con:')
     st.latex(r'\small A=\pi (R^2-r^2) \quad J = \frac{\pi (R^4 - r^4)}{2} \quad I = \frac{\pi (R^4 - r^4)}{4} \quad Q=\frac{2(R^3 - r^3)\sin^3\alpha}{3} \quad t = 2(R - r)\sin\alpha')
     st.write('Particularmente, los esfuerzos flexionantes correspondientes a un elemento en el contorno de la sección se computan con:')
     st.latex(r'\small \sigma_y=\frac{4M_yR\cos\alpha}{\pi (R^4-r^4)} \quad \sigma_z=\frac{4M_zR\cos\beta}{\pi (R^4-r^4)} \quad \sigma_{yz}=\frac{4R(M_y\sin\beta + M_z\cos\beta)}{\pi (R^4-r^4)}')
     st.write('Asi mismo, los esfuerzos cortantes correspondientes a un elemento en el contorno de la sección se computan con:')
     st.latex(r'\small \tau_y=\frac{4F_y(R^2+Rr+r^2)\sin^2\beta}{3\pi (R^4-r^4)} \quad \tau_z=\frac{4F_z(R^2+Rr+r^2)\sin^2\alpha}{3\pi (R^4-r^4)} \quad \tau_{yz}=\frac{4(R^2+Rr+r^2)(F_y\sin^2\beta +F_z\cos^2\beta)}{3\pi (R^4-r^4)}')
     st.markdown('#####')
col35, col36 = st.columns([1, 1], gap = 'medium')
with col35:
     st.markdown('''<div style="text-align: justify;">
          Si bien, en el presente proyecto de investigación no se esta ignorando a los esfuerzos cortantes, esto no altera el 
          hecho de que no sean tan relevantes en comparación con los otros esfuerzos, por lo que para determinar la ubicación 
          del elemento a analizar, se hará mayor énfasis en los esfuerzos flectores.
          En consecuencia, el elemento a analizar sera aquel en el cual este presente el esfuerzo flector máximo: 
     </div>''', unsafe_allow_html = True)
     st.latex(r'\frac{d\sigma_{yz}}{d\beta}=0 \hspace{5mm} M_y\cos\beta-M_z\sin\beta = 0 \hspace{5mm} \beta=\arctan \frac{M_y}{M_z}')
     st.write('Finalmente, los esfuerzos que se analizaran en dicho elemento se establecen como:')
     st.latex(r'\sigma_{\text{flexionante}} = \sigma_{yz} \quad \tau_{\text{cortante}} = \tau_{yz} \quad \sigma_{\text{axial}} = \sigma_x \quad \tau_{\text{torsional}} = \tau_x')
     st.markdown('''<div style="text-align: justify;">
          Ahora bien, para determinar el valor del esfuerzo máximo al cual estará sometido el elemento seleccionado, es necesario tomar en 
          cuenta el sentido de los esfuerzos previamente establecidos de manera conjunta. Al respecto, se puede afirmar que, 
          siempre existirá un caso en el cual los esfuerzos normales y transversales tendrán la misma orientación, aunque no 
          necesariamente de manera simultánea.
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
          \begin{array}{ccc}
          \sigma_{\text{n}}=\sigma_{\text{flexionante}}+\sigma_{\text{axial}} & \sigma_{\text{n}}=\sigma_{\text{flexionante}}\pm\sigma_{\text{axial}}\\
          \tau_{\text{t}}=\tau_{\text{torsional}}\pm\tau_{\text{cortante}} & \tau_{\text{t}}=\tau_{\text{torsional}}+\tau_{\text{cortante}}\\
          \end{array}
     ''')
     st.markdown('''<div style="text-align: justify;">
          Considerando un enfoque conservador, los esfuerzos normales y transversales combinados se calcularán con las siguientes ecuaciones:.
     </div>''', unsafe_allow_html = True)
     st.latex(r'''\sigma_{\text{n}}=\sigma_{\text{flexionante}}+\sigma_{\text{axial}} \quad \tau_{\text{t}}=\tau_{\text{torsional}}+\tau_{\text{cortante}}''')
     st.markdown('''<div style="text-align: justify;">
          Dado que se está incurriendo en un error voluntario, se ha comparado el error de considerar al esfuerzo cortante con el 
          error de ignorarlo, en el cálculo de los esfuerzos combinados bajo el criterio de Von Mises, al ser dicho criterio el más 
          usado para el diseño de ejes. De las gráficas de la derecha, se aprecia que, en promedio, para ambos casos previamente 
          descritos, el error es muy similar, es decir, que a pesar de estar considerando a los esfuerzos cortantes en el cálculo 
          del esfuerzo de Von Mises, esto no ha significado un incremento considerable en el error en el que se incurría al 
          ignorarlos para dicho cálculo. Por otra parte, se advierte que cuando la relación entre el esfuerzo torsional y el 
          esfuerzo cortante es mayor a 20 (lo cual sucede casi siempre), el error en el cálculo del esfuerzo de Von Mises 
          disminuye por debajo del 10% a medida que dicha relación se incrementa.
     </div>''', unsafe_allow_html = True)
     st.markdown('#####')
     st.markdown('''<div style="text-align: justify;">
          En línea con lo anterior y considerando 
          a los factores de concentración de esfuerzos, el cálculo del esfuerzo máximo 
          combinado (esfuerzos normales y transversales), bajo tres tipos de criterios de falla, se realizará mediante las siguientes expresiones:
     </div>''', unsafe_allow_html = True)
     st.latex(r'\sigma_{k}=K_{a}\sigma_{\text{axial}}+K_{f}\sigma_{\text{flexionante}}\quad\tau_{k}=K_{t}\tau_{\text{torsional}}+\tau_{\text{cortante}}')
     st.latex(r'\text{Criterio de falla según Von Mises}=\sqrt{\sigma_{\text{k}}^{2}+3\tau_{\text{k}}^{2}}')
     st.latex(r'\text{Criterio de falla según Tresca}=\sqrt{\sigma_{\text{k}}^{2}+4\tau_{\text{k}}^{2}}')
     st.latex(r'\text{Criterio de falla según Rankine}=\frac{1}{2}(\sigma_{\text{k}}+\sqrt{\sigma_{\text{k}}^{2}+4\tau_{\text{k}}^{2}})')
with col36:
     st.image(img10)
     st.markdown('#####')
     st.image(img11)
     st.markdown('#####')
     url1 = 'https://junior19.starboard.host/v1/embed/0.15.3/cbljq1i23akg00a8j9b0/nCzetdj/'
     st.markdown(f'<iframe src={url1} height="655" width="100%"></iframe>', unsafe_allow_html = True)
# Analisis dinamico de ejes
st.markdown('#### 4.2.4 Análisis dinámico')
col37, col38 = st.columns([1, 1], gap = 'medium')
with col37:
     st.markdown('''<div style="text-align: justify;">
          En los ejes de transmisión de potencia, algunos de los esfuerzos que actúan sobre este fluctúan en relación al tiempo, 
          debido al comportamiento de las cargas que los generan. Si se analiza al elemento seleccionado, en su recorrido alrededor 
          del contorno circular del eje, se entiende que, 
          para el caso de los esfuerzos axiales y torsionales, estos presentan un comportamiento constante, es decir que, tanto 
          su magnitud como sentido no se alteran a medida que el eje da un giro entero. En contraste, 
          para el caso de los esfuerzos flexionantes y cortantes, estos presentan un comportamiento fluctuante, dado que tanto 
          su magnitud como sentido se alteran a medida que el eje de un giro entero.
     </div>''', unsafe_allow_html = True)
     st.markdown('#####')
     st.markdown('''<div style="text-align: justify;">
          Considerando lo previamente expuesto, 
          se establecen las siguientes ecuaciones en relación a los componentes medio y alternante de cada uno de los esfuerzos 
          presentes en el eje:
     </div>''', unsafe_allow_html = True)
     equation = r"""
     $$
     \begin{array}{|c|c|c|} \hline \\
     \text{Esfuerzo} & \text{Medio} & \text{Alternante}  \\ \\\hline\\
     \text{Axial} & \sigma_{\text{axial}} & 0  \\ \\\hline\\
     \text{Torsional} & \tau_{\text{torsional}} & 0  \\ \\\hline\\
     \text{Flexionante} & 0 & \sigma_{\text{flexionante}}  \\ \\\hline\\
     \text{Cortante} & \hspace{3.5mm} \frac{{\tau_{\text{cortante máximo}} + \tau_{\text{cortante mínimo}}}}{2} \hspace{3mm} & \hspace{3mm} \left| \frac{{\tau_{\text{cortante máximo}} - \tau_{\text{cortante mínimo}}}}{2} \right| \hspace{3.5mm} \\ \\\hline
     \end{array}
     $$
     """
     st.markdown(equation, unsafe_allow_html = True)
     st.markdown('''<div style="text-align: justify;">
          A diferencia de los esfuerzos flexionantes, los esfuerzos cortantes no presentan un comportamiento sinusoidal completamente 
          invertido, lo cual conlleva a que para este caso, se deban cálcular los valores máximos y mínimos para dicha función:
     </div>''', unsafe_allow_html = True)
     st.latex(r'\frac{{d{\tau _{yz}}}}{{d\beta }} = 0 \quad 2\sin \beta \cos \beta ({F_y} - {F_z}) \quad \beta = \frac{{k\pi }}{2} \rightarrow k = \mathbb{N}')
     st.markdown('''<div style="text-align: justify;">
          De conformidad con el resultado anterior, se obtiene que los valores máximo y mínimo de la función del esfuerzo cortante son:
     </div>''', unsafe_allow_html = True)
     st.latex(r'{\tau _{{\text{cortante m\'a ximo}}}} = \frac{{4({R^2} + Rr + {r^2})\max ([{F_y},{F_z}])}}{{3\pi ({R^4} - {r^4})}}')
     st.latex(r'{\tau _{{\text{cortante m\'a ximo}}}} = \frac{{4({R^2} + Rr + {r^2})\min ([{F_y},{F_z}])}}{{3\pi ({R^4} - {r^4})}}')
     st.markdown('''<div style="text-align: justify;">
          En consecuencia, los componentes de los esfuerzos medio y alternante de los esfuerzos cortantes se establecen como:
     </div>''', unsafe_allow_html = True)
     st.latex(r'{\tau _{{\text{medio cortante}}}} = \frac{{2({R^2} + Rr + {r^2})({F_y} + {F_z})}}{{3\pi ({R^4} - {r^4})}}')
     st.latex(r'{\tau _{{\text{alternante cortante}}}} = \frac{{2({R^2} + Rr + {r^2})\left| {{F_y} - {F_z}} \right|}}{{3\pi ({R^4} - {r^4})}}')
     st.markdown('''<div style="text-align: justify;">
          Por lo expuesto, los esfuerzos medio y alternante para cada uno de los esfuerzos analizados se definen mediante las 
          siguientes expresiones:
     </div>''', unsafe_allow_html = True)
     equation = r"""
     $$
     \begin{array}{|c|c|c|} \hline \\
     \text{Esfuerzo} & \text{Medio} & \text{Alternante} \\ \\\hline\\
     \text{Axial} & \sigma _{{m_a}} = \sigma _{{\text{axial}}} & \sigma _{{a_a}} = 0 \\ \\\hline\\
     \text{Torsional} & \tau _{{m_t}} = \tau _{{\text{torsional}}} & \tau _{{a_t}} = 0 \\ \\\hline\\
     \text{Flexionante} & \sigma _{{m_f}} = 0 & \sigma _{{a_f}} = \sigma _{{\text{flexionante}}} \\ \\\hline\\
     \hspace{4.5mm} \text{Cortante} \hspace{4mm} & \hspace{3.5mm} \tau _{{m_c}} = \tau _{{\text{medio cortante}}} \hspace{3.5mm} & \hspace{3.5mm} \tau _{{a_c}} = \tau _{{\text{alternante cortante}}} \hspace{4mm} \\ \\\hline
     \end{array}
     $$
     """
     st.markdown(equation, unsafe_allow_html = True)
with col38:
     url2 = 'https://junior19.starboard.host/v1/embed/0.15.3/cbljq1i23akg00a8j9b0/n4za9UC/'
     st.markdown(f'<iframe src={url2} height="925" width="100%"></iframe>', unsafe_allow_html = True)
     st.markdown('''<div style="text-align: justify;">
          Con los valores de los esfuerzos medios y alternante ya calculados para cada uno de los esfuerzos presentes en el eje de 
          manera individual, se pueden calcular los esfuerzos medio y alternante de los esfuerzos combinados bajo los criterios de 
          falla utilizados en el análisis estático. Considerando a los factores de concentración de los esfuerzos dinámicos, dichos esfuerzos son:
     </div>''', unsafe_allow_html = True)
     equation = r"""
     $$
     \text{Von Mises}\left\{ \begin{array}{c}
     \sigma_a = \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 3\tau_{a_c}^2 \right]^{\frac{1}{2}} \\
     \sigma_m = \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 3{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}}
     \end{array} \right.
     $$
     """
     st.markdown(equation, unsafe_allow_html=True)
     equation = r"""
     $$
     \text{Tresca}\left\{ \begin{array}{c}
     \sigma_a = \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 4\tau_{a_c}^2 \right]^{\frac{1}{2}} \\
     \sigma_m = \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 4{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}}
     \end{array} \right.
     $$
     """
     st.markdown(equation, unsafe_allow_html=True)
     equation = r"""
     $$
     \text{Rankine}\left\{ \begin{matrix}
     \sigma_a = 0.5\left\{ ({K_{f_f}}\sigma_{a_f}) + \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 4\tau_{a_c}^2 \right]^{\frac{1}{2}} \right\}  \\
     \sigma_m = 0.5\left\{ ({K_{f_a}}\sigma_{m_a}) + \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 4{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}} \right\}
     \end{matrix} \right.
     $$
     """
     st.markdown(equation, unsafe_allow_html=True)
     st.markdown('''<div style="text-align: justify;">
          Finalmente, los esfuerzos dinámicos se calculan en base al criterio de falla estático que se considere conveniente y 
          bajo los siguientes criterios de falla dinámicos:
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
     {\text{Soderberg}}:\quad \frac{{{\sigma _a}}}{{{{\text{S}}_e}}}{\text{ + }}\frac{{{\sigma _m}}}{{{{\text{S}}_y}}}{\text{ = }}\frac{{\text{1}}}{n}
     ''')
     st.latex(r'''
     {\text{Goodman}}:\quad \frac{{{\sigma _a}}}{{{{\text{S}}_e}}}{\text{ + }}\frac{{{\sigma _m}}}{{{{\text{S}}_u}}}{\text{ = }}\frac{{\text{1}}}{n}
     ''')
     st.latex(r'''
     {\text{ASME}}:\quad {\left( {\frac{{{\sigma _a}}}{{{{\text{S}}_e}}}} \right)^2}{\text{ + }}{\left( {\frac{{{\sigma _m}}}{{{{\text{S}}_y}}}} \right)^2}{\text{ = }}\frac{{\text{1}}}{{{n^{\text{2}}}}}
     ''')
# Analisis de rigidez de ejes
st.markdown('#### 4.2.5 Análisis de rigidez')
col39, col40 = st.columns([1, 1], gap = 'medium')
with col39:
     st.markdown('''<div style="text-align: justify;">
          Las deformaciones lineales y angulares resultantes, se calculan haciendo uso de las deflexiones y pendientes ya 
          calculadas, por medio de las siguientes ecuaciones:
     </div>''', unsafe_allow_html = True)
with col40:
     st.latex(r'\delta_R = \sqrt{\delta _x^2 + \delta _y^2 + \delta _z^2} \quad\quad \theta_R = \sqrt {\theta _x^2 + \theta _y^2 + \theta _z^2}')
# Analisis de vida de ejes
st.markdown('#### 4.2.6 Análisis de vida')
col98, col99 = st.columns([1, 1], gap = 'medium')
with col98:
     st.markdown('''<div style="text-align: justify;">
          Para determinar si el eje de transmisión es de vida infinita o en su defecto, cálcular el número de ciclos a los cuales este fallara, 
          se hace uso de la Curva de Wöhler. Para este último caso, el tiempo de vida se calcula con:
     </div>''', unsafe_allow_html = True)
     st.latex(r'\text{Horas de vida} = \frac{N}{\text{Revoluciones por minuto x 60}}')
with col99:
     st.latex(r'\Large \displaystyle N=\left\{\frac{\sigma _{dinamico_{max}}}{10^{\left[\log( 0.9S_{u}) -\frac{3}{3-\log( N_{2})}\log\left(\frac{0.9S_{u}}{S_{e}}\right)\right]}}\right\}^{\left[\frac{1}{\frac{1}{3-\log( N_{2})}\log\left(\frac{0.9S_{u}}{S_{e}}\right)}\right]}')
# Analisis vibracional de ejes
st.markdown('#### 4.2.7 Análisis vibracional')
col41, col42 = st.columns([1, 1], gap = 'medium')
with col41:
     st.markdown('''<div style="text-align: justify;">
          El cálculo de los límites del rango de operación en el cual estará situada la velocidad critica fundamental del eje de transmisión 
          de potencia, se efectúa siguiendo las ecuaciones de Rayleigh y Ritz:
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
     \begin{array}{|c|c|}
     \hline \\
     \hspace{1.31cm} \text{Límite inferior} \hspace{1.31cm} & \hspace{1.31cm} \text{Límite superior} \hspace{1.31cm} \\ \\
     \hline \\
     \text{RPM} = \frac{30}{\pi}\sqrt{\frac{g}{\max(\delta_R)}} & \text{RPM} = \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T {m_i y_i}}{\sum\limits_{i = 1}^T {m_i y_i^2}}} \\ \\
     \hline
     \end{array}
     ''')
     col43, col44 = st.columns([1, 1])
     with col43:
          number_input_5 = st.number_input('Número de elementos en cada tramo:', 1, 100, 1, 1, label_visibility = 'visible')
     with col44:
          selectbox_1 = st.selectbox('Tipo de eje a analizar:', ('Escalonado', 'Hueco'), label_visibility = 'visible')
     fig3, df = f1_rpm(number_input_5, selectbox_1)
     st.pyplot(fig3)
     st.dataframe(df, use_container_width = True, height = 150, hide_index = True)
with col42:
     st.markdown('''<div style="text-align: justify;">
          Para el cálculo del límite superior, resulta necesario primeramente dividir al eje en sectores, luego calcular la masa de cada uno 
          de ellos y finalmente determinar la deflexión en el punto medio de cada uno de estos sectores. Una vez calculados estos valores, 
          recién se puede hallar el valor deseado, sin embargo, la precisión de este resultado depende del número de divisiones del eje, lo 
          cual significa que, a mayor número de divisiones, mayor precisión en el resultado, sin embargo, esto a su vez implica mayores cálculos 
          debido a los pasos comentados previamente. Teniendo en cuenta lo anterior, se ha visto por conveniente modificar la ecuación en cuestión, 
          de la siguiente manera:
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
     \text{Límite superior:}\quad \text{RPM} = \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T {\sum\limits_{j = 1}^n {m_{i_j} y_{i_j}} }}{\sum\limits_{i = 1}^T {\sum\limits_{j = 1}^n {m_{i_j} y_{i_j}^2} } }}
     ''')
     st.markdown('''<div style="text-align: justify;">
          Llevando al límite el número de divisiones del eje y reemplazando el valor de la masa correspondiente a cada una de estas divisiones:
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
     \sum\limits_{j = 1}^n {m_j y_j} = \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta m_j \cdot y_j = \rho A \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta x_j \cdot y_j = \rho_T A_T \int y_T dx
     ''')
     st.latex(r'''
     \sum\limits_{j = 1}^n {m_j y_j^2} = \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta m_j \cdot y_j^2 = \rho A \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta x_j \cdot y_j^2 = \rho_T A_T \int y_T^2 dx
     ''')
     st.markdown('''<div style="text-align: justify;">
          Finalmente, reemplazando en la ecuación inicial, el limite superior se computa con:
     </div>''', unsafe_allow_html = True)
     st.latex(r'''
     \text{Límite superior:}\quad \text{RPM} = \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T \rho_i A_i \int y_i dx}{\sum\limits_{i = 1}^T \rho_i A_i \int y_i^2 dx}}
     ''')
     st.markdown('''<div style="text-align: justify;">
          Esta ecuación ofrece un resultado más preciso, dado que el número de divisiones se ha elevado al infinito, lo cual ha 
          permitido convertir las sumatorias en integrales, y que, por otra parte, resulta conveniente en este caso, toda vez que las deflexiones 
          en el eje han sido calculadas mediante funciones analíticas y numéricas que se pueden integrar de manera rápida y precisa.
     </div>''', unsafe_allow_html = True)
# Elementos finitos
st.subheader('4.3 Elementos bidimensionales')
col45, col46 = st.columns([1, 1], gap = 'medium')
with col45:
     st.markdown('''<div style="text-align: justify;">
          Se utilzan elementos triangulares de deformación constante (CST), donde cada uno de estos estará definido geométricamente por tres pares 
          de coordenadas, a partir de los cuales se pueden establecer las siguientes expresiones:
     </div>''', unsafe_allow_html = True)
     st.latex(r'\begin{align*} \beta_i=y_j-y_m \hspace{0.6cm}& \beta_j=y_m-y_i \hspace{0.3cm}& \beta_m=y_i-y_j\\ \gamma_i=x_m-x_j \hspace{0.6cm}& \gamma_j=x_i-x_m \hspace{0.3cm}& \gamma_m=x_j-x_i\\ \end{align*}')
     st.markdown('''<div style="text-align: justify;">
          Ahora bien, considerando estas expresiones junto con el área, el módulo de elasticidad y el coeficiente de Poisson correspondientes a 
          cada uno de los elementos, se describen las siguientes matrices:
     </div>''', unsafe_allow_html = True)
     st.latex(r'[B]=\frac{1}{2A}\begin{bmatrix} \beta_i & 0 & \beta_j & 0 & \beta_m & 0 \\ 0 & \gamma_i & 0 & \gamma_j & 0 & \gamma_m \\ \gamma_i & \beta_i & \gamma_j & \beta_j & \gamma_m & \beta_m \\ \end{bmatrix} \quad [D] = \frac{E}{1-v^2}\begin{bmatrix} 1 & v & 0 \\ v & 1 & 0 \\ 0 & 0 & \frac{1-v}{2} \\ \end{bmatrix}')
     st.markdown('''<div style="text-align: justify;">
          A partir de estas y considerando el espesor de cada elemento, se puede formular la matriz de rigidez respectiva mediante la siguiente ecuación:
     </div>''', unsafe_allow_html = True)
     st.latex(r'[k]=tA[B]^T[D][B]')
     st.markdown('''<div style="text-align: justify;">
          Con las matrices de rigidez individuales se plantea la matriz de rigidez global, la cual, junto con las matrices de fuerzas y desplazamientos, 
          se redimensionan en base a las condiciones de frontera, para posteriormente resolver el sistema general y determinar asi, las reacciones y desplazamientos 
          en cada nodo de la malla, lo cual asu vez, permite calcular los esfuerzos en cada elemento de la malla, mediante las siguientes expresiones:
     </div>''', unsafe_allow_html = True)
     st.latex(r'[F]=[K][d] → [\sigma_x, \sigma_y, \tau_{xy}] = [D][B][d]')
with col46:
     url3 = 'https://junior19.starboard.host/v1/embed/0.15.3/cbljq1i23akg00a8j9b0/n529MY4/'
     st.markdown(f'<iframe src={url3} height="655" width="100%"></iframe>', unsafe_allow_html = True)

# Resultados
st.header('5. Resultados')
st.subheader('5.1 Algoritmos desarrollados')
url8 = 'https://viewer.diagrams.net/?nav=1&title=#R7V1bl5u4sv41%2FZhegLj50el2snNW31Z3z%2BzJfqMxdjPB4AGcSfLrjyQQF0nY2AgEdmatSdviYih9Vaoq1eUK3Gx%2BfI6d7ft9tPSCK01Z%2FrgCt1eapuqKAv%2BgkZ%2F5yMxSs5F17C%2FzsXLgxf%2Fl5YP5heudv%2FSS2olpFAWpv60PulEYem5aG3PiOPq3ftoqCuq%2FunXW%2BS8q5cCL6wQec9p%2F%2FWX6no0aNijH%2F%2BP56%2Ff8l3U1P7BxyLn5fZN3Zxn9WxkCiytwE0dRmn3a%2FLjxAkQ8Qpbsuk8NR4vnir0wbXWBrmWXfHeCXf5yT4%2F%2FXTzDoZevL6%2BLe%2Fjh9Xn%2B8HL%2F5eXly%2BMD%2FHozv7v5427%2B%2Bvicv0P6k9Al%2BdffBE4Iv3103%2F1geef8jHboQZLUcb%2BRbx9jL4FT%2BkSeUqWG7h2EFAWOvkex%2FysKUyfIT4P3idMcD6pSP%2BUF%2FQa5MN2QS1bwYH6FgQ6xJMqp9t2LU%2B9HZSgn2Wcv2nhp%2FBOekh%2FV89nL4ftBs%2FOBf0swaMrMzgbfq0jQrPxUJ4fgurh7OU3wQz5TTbNmMbN2f3UDrmbg9o%2B7R3jgdoEm6vH5eTF%2FgZ%2Be7uYP%2BMOV8fHT4%2FPHxyvjdt%2FkVclsMhPRTGDQQOACZYdJTESC0pakpiGAopqtMhRlCLSOo92W93ZWw9sVAsh5C6rypBFYtlUDlgrUa81g6KDOVIOlA7Cta0MAtgyWEpAtHXSjKEEnhr7rQ0mYMPSB5AmX3jKHxb%2Fvfuq9bB0XHf0XLgR11LjRxndzMLE0LeejNVMaFksowqhVOllCiMSKzSvNDJBwW%2Frfa2Qx%2F9khaf6x9mmd%2F8VXJFsn5F7yBgXaGlP1gxsFUXwF5tkEpD5iRM4tPyBmj1IvhFOEFli88G6iFF6rmc4GzUH4lmzxFcpIh5jvQfaGnzI61WkHhzHB66PS5%2BD56X6q5P89lfWpvPXRyjpXsQDEkwr%2FCRB3baPAQ383Xih0gs%2BUSlD765kNpkk4qGzl4houf7FHSJaMgYHHORWIbp%2BdjYM1JU2JPXf3FvsbH9Kvjj03imMEvsan6%2FwYr%2F42yh8jgT%2FvL4sHWPs5I%2FSxBrR7IVrBf3e26CNUtJwg8IJoDdU6eOLWg8TzUi%2Bmjz2VBw6pcyv%2Fh0cMdfTdCfx1CD%2B7kCj4%2Bm46HlGItULHrdoFhs6qeYXu10nPs0yGit5y7b3kX8MIm0sVOiAW%2FvkX0mvhg%2BZfv%2BZqLv5y%2B6P27edhFTiJdrFLHA9EO4cG2tojr0q0UfRoe8kYe4GT%2Bt%2FrXoxuijBgFWG4ENhquN4FBS%2B4yHR0MXMSGRcgAVdIOsxANZZVttAWdfbYGMphUAqxK4AFakaZzYMgIA6dmmUqBIGzvQiM4vQ9WkehEyzK0Rogf%2FjpX5XPX0tswm8lGtGXn1Vo%2FlX98rWO6K4g1nggBvJArDMg%2FhOKQNdfOkvuepINpbETJhs%2FwarPRxCOEKyqOTBarWPl5WTgqcuDp8HA89POi385%2BBnDNbb2gwmhUtOHRSVxz56%2FDDWkgdS2JdJY7YnG%2BiA0xpfO49j5WTlhG%2FlhmlTu%2FIQGSp6yDErSzwhPfWp5hWZRV8AP2VOUM168TktJxe5L3ETeyneRaYY8xk0iKrNf3mJiuyTeeheSVXedmXrlMsyef0BrHNLyESIxbZWaXa7E1Hj%2B7WLnpBs771%2FIpykyAY%2BdLXnrus1wy10Urv1016B1jsUkUlWzDs%2BBl3PtDLFp8bBpy8PmjMHmPHTf%2Be618QJzYGPd1i8FmTNpyDRZZH5CHuByzxM9F6SQ447IBGKQObRlbu%2F3ZJ4PNE1p0ATafl8d6%2F1o%2B6IkaKj2opY8hxl5Hp5HgrM8eEiVx%2FsgULXGngo3CjM7wB01kw7uqDAuhEkJgGRgl41vOg67iT8J7IKhtXJwKdhV5WFXa8Zu7CW7IHXC1MNv8YZ32TBwvb%2B9q0bPSwXg2Xn%2FGwOYjZlBaUvmoGCenaHHmK9EaPLAzG4dCwfz1zGCWdMHBrPKUGH6YObFQcjUiNkt5Ht4mywgSRSa%2FxojmoE2MJrP0JDli2Z5O86zM%2FT%2B8yWGPBrrJisx9uXwvD7Pnxb%2Fe%2FxyO79b5Kk8j0%2BvXz4u7l5Hn81jkRydg9k8tiZARkDpw9B2%2BByWcobbC1fdvqZ0BdXkpgD1ldmiAU5A31hipX9ntsifg9%2BZLWc3lVe5z2vj%2FLPzQ064%2FCgofjnz8p8odqqxMm%2FO39EYaPt7Nn8n%2BJwyFYgKN1D9clMvhsTwXXYBF034MVCoB4iXAW%2FHw7thFmQL%2F%2F5Ss14GzMeSyH8Tyvg6wSKaqZRBBHRwbQ2ZAwZ%2Fca8zpM8csIJgVU9GYd1WPRmF3Ta8J0MDbH6CoBywQRIaTkClbuo0LBUuLHtzg2pg0m7QBmBzAnQLdMkANhvOPoa8MDGAtYcG7P4EkbGlhh2DUGkh5BrgBEPKSw0TAkzdHBiYREk4f0kqLTJS02VuQXfODmugMSc4qAca40uPzQ6zdYat1IKtmhLEOBfN6Is654hpZsdEwbbTQ3apatNjyhPVnEqLeE%2FDi1d%2BIaHr2gSU11vvVwTVjaB3i7t0LRxV9EhBR0lpH86N9ic09fOCnCGJdrGQZXKmsAaHzqyR3HxAMWvkpIM7G%2BS3wREQhEslCAiT3Xl1a8mznAm4c968oE5qxg%2BDUOa7TjDPD2z85RLPD665mpemRITLFxV4c%2BMjCingkbJAQvdilx%2BUa9XQcxQftxwyS5dKXRGtVgmcU5r8Ry5VOhvUxcqzpBBoSV2i7Y0uGEq%2FVjWDlhwQ%2BQMr2JPOajhCu9ClRRNpnGii6sYTRCcOI%2BQ63sYI0sH9afqkQ96OAakpD6RswvsDdkXMN15ccRRPSJgO7kbTJ10P7BicSkt%2B14wz9AjxCgcWiJRAY6urUiCDXvIKMmgHKlGOk17ywqs1Thn7zDOeYD0IKUE4FBhndZaliSaozw%2FuMCelx85JPHKXIIIhGfBlTc%2BnOFpBuFU3H9%2FR90rd40qa8hiRavBjN3pE6qVYnvKqU2oGa3mOPyf5FDybtinbSDXO0EjlK1ryjFROVbbxpyULwvPQxiy5SZ%2B0Fp40K4bWg2ttJhvM9OJlb%2BGvsmhgvDn3vRLh9JPd1MPnrJiCW6sACo1yEtjrDu3%2B0XP0Hm3edslA8zNTlTaMAAU%2BOzligkynmT8uhhWGVgtVsiFxIPV2frsouuY9Lx4e725Hn2irGiSV%2FGCmrSFEqtjspqWMTFujNaEaM23tYRNtgbp%2FS31fWHl3RYzYRVVFzOZUuwZqDkEJipjNisTRJHVNPRO5W0LXaKbhdzLyOc0mZy9wWSkcjyZ5m2k3KiofebkppQcIVVG0o5YZfVOkAi%2BxNtnGkfvNS8eaW9t7W7wxZnj2%2BXLnIfl%2FJ8FeUhLs0cYKkwSrqUMnwR6oTNxvEizXWuFluNjytkFmrE%2BBH%2FvuLD3xvRJOsYDZ%2FbnZwC7JaZfyK2hegyDBgeAEIE7EM2ACeyteS3KjjGfya6mpOTIaesY6kHkqWBZWgQRg5gFaloMV7WyM8FetofEvs2daX%2FgXnmE1GvyzubZ%2FOtxs8BGLeM0YFuNAO11xEAbQquIAFM5%2BM1Ck5QUWz8NN4c72dKAGn6XexVOAGAADQ0zRzk6MFqg4OzEKFE7Zd1QXJiYyFPV%2BjMsNaIh1COFJCVmdb571yAGT7jvWwAHCCxqNhgP29HMeccTc8ZzBbvVrhjYwZ5yHidlCg5FWJqlQniYWMScCzwAMjWfWCJlEnJAIYuvqwMQmUWHnLzykVQYC2unVFfshEIl4qRFI06QRiDxPLW4z8KrN51qoxV3CKY%2FmXUOjVn3F4m5XKBzGVQ0hXof99aaai82V7Pm1cuQQq%2FayxQFUm4NEeQFZxfNQFYxe%2FM02gMDgFxLaNR97jf3mgzc7ZxnnF1MzKbt6z9H8oJttQg2565iQUENt%2FzrWfvNOFYXs2ciQzWpVCIMowsZ3cWtzHkQXuzjaeqywnTw%2BdWVogE6tNigP1ERHqG%2BHSNSsWMXhyUnq1dyIuoAdbam%2FLY%2Fu3hD0e%2Btwe1IURD1Jo2Erg5ukISZtgJOjwaYNLB4%2BP88f5v9HmnTNP9%2FPcd7AoZp0Y8oj0FRCxcN5BJYIhY30Ie1qasnS34gVUxUIgKe%2FySvCWjyP5FwNwkWdcjUYcPaXqMGpsXxaLN6rt4EqgJPu4iIwM0IDFSE7tvDBZwhCxtBkPUjTjI288d2gDFH5jjdZ5cc0jmJIHJFfK0qFF0JtN3SQj1H%2BK46TXJzGGVtUp3MQVjszwr17ge%2BeHdaGFZFQdcmC%2B9A%2F5xE0Lo%2BA0%2Byy2B9xzjCLclD63WerwhLLPPkv%2BntI%2FBTvS%2FWT%2F56TIeM8dN%2FLxKeMgmN4w1EMCTQXUT62%2FBf6PTSaFcpB6Zp9d%2Ff4PTSW%2BX6NndQpClLCud%2F47iXoJv1R9HYXe78mZC1c6FCPa6qX%2BElhJzlL5HhFHVbg5yvSk8l3nSX2Kg%2F6s%2FWab1KJdOMEWYaAfCT8HpKlfd5E4cp33vzfUJjk9C2SrZecn%2FvnEoamWYfj6I1otg4HSS85VISjCJ3qFiQhKM1LuZ7Zs6tq5BRqf9RH7BS6SWUajwuf4AUJyuvPBzp34JAcs8ajMa%2BYPJDXIQpYEy9w3p7G8hLOrYlXnWhPY3kpcdbEu3S1p7G0ikvAVi6FxvJCBm2ZfdsHpbG0zl7AFhT6OnoaG8LlMb4060dfnpC3MS7vTCf8F3lnRbp%2FrcV9iwsUg5rh7BlOrghg768Ffj4QEN9wUBIEgCkYAkWMfhllfIN8q3M1cCsxbVnA6goXTMHlfrdxtPWjeuHf0h%2BsJDtoXq9wXPdVluVRnlb334rO7zjauqazkKBNej1kEhJJPK3FeVNUQVWKt8e87dFd0eksF5IYcSjDRddE0ICT4rJIVqiYA0JgVoCqRJdYyJQT0L7dhc7xv%2FSV%2FwM4bUMqxGmxRSKdXhYYklxsY7hD5BoDtIahDVsypRIMWSv9FheMNzIwkSVwIIpxkpcYilEEGwOcyGI2aynHxRCLTVlixPjI0KSRHOxBCGSwory5CB3alOhbQp2SFle0Ny3q1%2BptFSYxROR0%2FmxFxJEpngwhKxX9BiEkpw1iRbZtURRVdamsLg3jIx4AAxOPNZymUE3veEKbtiWV3c0zdFIQwtSdFDmiJPgCTdb%2BmkIpve5gHlrkGl03waQAU95mi8lRmCbQqbc7MIdezqbe4rs9mOXtzpqs4jqJIprd0ayrA6O56z64FGRKi39RdbY4Oq%2FEUFZcCH9%2BfZ4%2FvNx%2FefmSnfZAxp8eXxcPN1%2FmDP3HVWfIIvsqB%2BsM2YoAQLK2gowKOKA1mX5Q4M3JxvG89Vf%2FhiEZJyc1jJYRSzTZhfA607moqn2I0ELqiwmKGRqiBFYCGeabd5M167xdeitnF6T7Z6HWvY0jdWXJXNbiesGOFjfdOYH%2FC7csNfHDvgVOQhb61S6s1kXCu6thI1%2BgOnAPuAhcVmgPQr0c1hQU%2Fa7yest31hiO5gCgHuYArS91gdx3CrpvRw7gdC%2BUZtyxpt0rwvpVUX8o2vre0lnieAP0AzguYZaiApFJDumN52bRCmE2eEOudlEBFBye4EOS%2BW87f1lclGXjc9jGCzysjrNLCoRxWp%2F0%2BkTkpUJXfhBQQ0xKAGIK%2BLDBPD%2Bw8ZdLjCgen9U5UfgCb9izGtupusqwHeCVyxZRLZuw%2FAWwnc6ynTQzlDVCa2yHt%2BsIK20iwg%2BYcZxt9BN9oasSXyq7aKSBwSDssr%2Bj3ZmzizTbmCiNUsiuDkp2Tjss4WTHlx4bNzlT6tqhmrtKmsIm6fM1oFNT3i1qko2iqYvQMkwy00WiEPelZUuaenl0BNbvkzRTZaC4KyTu0g%2BzwU02eKFyluRnDSJnJ5RvJ17OSssPI6bJBchZcwCyC5GzlNw8eD5piSpKzrKxd01y9p%2Bdh9XVpb9CnTOwLQf%2FCbDwhLIsLbZQskggSMQ1G0x1IeK0iCgeRJxOKHxDvDiVlt6lydzPHVacWgOQXYg4pcTj4fPzFheixCkbnVsTp7HnuK4P5VmhuBa%2BgMzXVjgDCi%2FbXv0189epP%2FxNqc7y1ONquGbDTW7D7CaXKa91IkMHkdcTCgQRL6%2BlpTyT9Ksm5oQvF8Ubp%2BDPwA%2B9bMc488yhCvTwfZMm7qQNyZO4s%2BEmF86d9pA%2B8wkV0RDPnYRJJKhTHFPEg%2B%2BF4U%2BYlHaLOzm3BH7ic0I72vZGrceACMfzTKfSOQxO8AFxitRapoqIjJEbd3itQHrVQX2o1yT%2B1qa2VDsH61hUVe1IDyt1PqlIJkpV7Rwn3REWYDYgLDj%2BoJHC4qBDqGdYADZq5qMXh9EuCHxWwB4TxSJerBqgzlEKqyaoPDWB1J%2FrJFU1MexTj%2BlS2rJP5%2Ba9vNgtXldDeYkJnOAVpAS%2Fe%2BG3aORI1Cw29rU3JAJBuylTiC7kIVRamIfU8k5HOgD%2F3m225MGc2CUjWZStdoyCNYRJf9JKqgJAaVhA3buUMhfoeR9VYSoWu5ZyK%2F9g%2F1%2FdE7jHGTFAOsrx4dUqHT%2FAWYsL41J0dKk5oejSDpLOkLYWc4oqNJewoiLaaCQXfrTJQJnXirwvKHdOq5oIlOUt2hMKghC3aHPsX%2FGePjGrtpZX2G29ahuiHSNs%2BG6LVbsey3uzfwmv7ScQOZhJzyKTH5%2FUQ3mK7gJRI0WIBlnbJ16ntq1AlBZ9a7J%2B95vYR83dCNSn6XRXAV1EaVCvu3V%2BuOWZfqa08BtL5kLeE4F54eHyCCzTvdETgTl6kDwCm2y0EMoX%2FTNC2sC9nyQeJxEo68XoJa7DP%2FbshN%2BgotFNb%2BhBGJMaU7kw5uW58xykIvLcTUEboCNy1ZscFYLASYKkYCNrcGvml%2FsFH6Qv0dKL37x4zT%2F8OYqWG6djAcH%2BMdzayy8ExJfj5eeB25IWl2KxTtxFx5wiCTacodaVYV6F375MuKm3JWoLUWnuWYt1z96VaRlZ%2BZsVMujiHJ%2B4d4BflnPFQZDfvSBy8zBEN4%2B7QiGBY4Qv6eowDH6bquG2DLCehkRQ882vYUh6fm5urkiQ5tWZCZK5yngIbHGyUCzh%2BwinObH1Ge0i1aqzdfgCoIrtOmOxCdS37f3RZaXEUYoqTdWGE1VTb0bXVlRJS0tWlVMcTYf3xjpKs5a0tIVrfa2DVSirMpvN%2FLKS%2FMfLMqpQmG4eCKNhLtDEyjKbtcA661%2F782pGION0MGAAjX1%2B6hhHxPXEqkczmGJTa389CfXwBRRHdmcw1n7kVAJ1fTco29F9h9w2Rr4xeGUN%2B%2BKb2fnpBjy%2BGYmS3ZlvDCB2YZrJFJtHxhK1nX7ODtlY5KZFOoWR%2Bbft%2FfNPXyBabhZBrtPUXPupPDYizfUgQA5ori1eRbSq29xZsfVmA5V3Pr4lumjRMsgSfX5xOLxqLCOpIkglJx4sx0KfDw7wHx2KePwFttgUj9mEwonbwotXZGkc%2BGJW9NmB6T%2BgMgjQAIg4bIyeVGJ%2F7S%2B9XwxOKu06DoYyhKnjh22Sno8QyxalHfO2hDWtH6msKuxCV%2Finywqe2EUd5%2BscLxAVu6xrS16bknPti5%2FEXuL%2Fyht8I8rnAIX3NT6isv7wXrs0SspmFW3rr3CmUDl6Ckm%2FCuIW15gJVLkNxUVMoHaK7XOS6jumlZez9BbzJsFzru6N3a5pi6MXP9w0K678ERBNVfDFRcHX5qzsBYYkwJfMbsPiWbVrRg9fbkRKb8snGMzxMHb4EhLLgC8nvbuE73f%2FLcab7aiD0MjBC2aDgle7QPCS1a0O3rF4Vg0KD%2Bohu8ro1w%2Bmcnqo0HYVdwdqbJzF3Y7qj7NO8UZMnbNsLmfJ6%2FRJuv0x4QpXh4IVrmphCcxUTsWQPYlttLo2Rdx2h5rTASG2LOvEaZ4xSi292BkjIbzFksGJV%2BlvxtiIhT8bw9dRn7uNt%2FQvan5spT4%2FOll0qt4hs7f5YcNPOREl71Hs7A8ouaAJMsCQE6TL2blu1BMA%2BUYX%2BOw5kVIFHKNSnkOPU31zDt8h9YulKAvBygO0sxa00VvqhX72uVJJxMCCMNOZCy5b%2BomHGVHNPYSIQdz8YvROWVmT2NvCn4CkK8PF15lMVVd5b1B4fOu58PVJ9RNcx2mX7JzC%2B%2BgUD5R1hHHxM5NH2Xh%2FQ%2F6P8a3QUyJSOqiACl5xd8zD5i28ETc42b2jbepvII%2FHuCoLWqRDfGn2eP%2FsEJR8r6zIAh8ZtTYtXgm9LzQDln69J0MaO2%2FO3xyXU9702t29tbAv3rKN9ru3YsBxv63x9vvjLkU7G%2Fn40om%2FPcLb%2BCnG7rVi1Ac1PCpsO94w6W0fXio2kQ%2F1Pu0iBM9gjteTUlfUa0Wh61Ur5gFZ43WoTKwCnvkir%2Byqyqm7%2BlyRBvnmHFckvPlLSIIwwU4vXvGCCHMXfVaTYKNgUpliHutV7XlcXsZzd3ECSfPs5Wu8gs8KAmeb%2BKVaIGY1N5nNVE4DKJ7dL4SpAOstYVWp2HfCNR1%2FwO%2FukEJMRUiZ%2BgDVFD6NCpi0plHxqsTG43hG%2BlJ3SJ3dAaTO9VGuEY7G01pw9FPAnHX22aAB26Lj94owE%2FJDh8LxmCcT7YYE7AbrHrUgDn5%2BjOEqj8T4cdWvVoG%2F%2FU%2F%2BOXDevOAJGiY5D8YZLxSGzh11vDB4iGkUeKvq%2BaxhVPL3DAGOiEeMVTHiEM7EtW3V5uaDqlrFWIXndV4FLl3XrkVUzSji2U%2BOzxLouyTQqTIxKbLUf0dghnt0g5LHM1rUCuJrTTHrv6Rr%2B%2BNymQs0C%2BwP9ddB1wtmghsYaycFyIzI085FK5CH1hk1YTZdpa8vtBrKBaD1pHiYsaOVV69wGLQaGo1Wen%2BvN7QeyHk4C7RaXSu69Ys8fp3BXpDXGS9Fktx5A2bcamDRjGsKgFHNSwDM%2BWlvRYjJFECm6RcAss6lZXoGzHAKVHfAAO38AUOy3c5JKgGyDS5BS1cBPWMmnRvTl5quKXnH8fPGq6CitaPCKycHaCi8qrQTxBzKZafOwCXgVWqr5J7wymsqMAxebRoSg4lX1TYuAK7mxAsr8%2BBqavLEq6LQU2wNpQ6AA22fzwOv52dUAxJNJQOvGo3X4dRXUjnnrPFKuP%2Bs8CpPHVCLLg6Dq68aqbd83nideK0jLl4H20rhuAfoAhvD4dWwzh%2BvKukjWYmuukcRpTNw%2B8fdIzxwu4D%2FzHHmiK3efXn58kIGF3eL%2B8XD6yMaeLqbP6APFPQrqaAJnKc0D9wzceBeFPu%2FUMBokMOxwgUrOJ6fCw4gtUVEVE48YJC1uhbuSMr017oF0UrnKYFPwN5vyuapLJIaBPFISnTDKvPzMv6B%2BHKk7YnKpmc8ObGDbhRlbVZwisLeqvlNUbdHtK4ibNM%2BHk%2FXr%2Bs1%2BDiBeEVovujWVaTo1vFYlLUQcbHIUZyA%2BLpo7YnKCs9F4joBm0SHHg4HjV71lknHErGYdAalOOcm9Nw0v%2BNVHvbdiN4PyrVmUgUHcgHccYUnV9RvSq6PVqvES5lJOVIp4xTXJokRS%2F97babMf3ZRiqlZ%2BbTO%2F%2BIrkq0Tci8pk4s%2BuFm24jyTRylKmeLd8svGWePkrLIDFG4LtYIiDI3UkjkQVdD%2F8CPKtyKPA18%2Be6L6U8Jh%2FGpklF6Y84BpCBcnCLwgWkMRimBVCYSvHatEyB8SnSv%2Fh7d8KXM6GZALkae2RYlToINrXv0qgtpaxod2LUKoiqo8Oar1nqPsg5kmTcaSJj1iadycBSs64bU9jVV5NJ74HmF7GkvUW9n8sFd%2FW%2BThV%2BU%2Brbe27eYuRK7qlFELVJ7RxFFTVUOEzUS4oJp9%2FebDp%2B%2Bh08XRtDEU9VqrrzpFvlyto32xNokuL1RI4mpRJi%2BOnT46gYigT5EzUKOPXazUogmkn9QPYOSybMaze2bSikbqStc1WQq9pHVX05WuMWNS6DWTp4%2BM1F5DjdE5NXSCvPyUhzLwTWeDRGv4lmzxlQo7dJThNt7X3u6ysh5t3vgMKPDsrfzQyYqZEBJsoIHsXLolbmlUgX%2B%2BIV4Ezok3xPWT2ldyBWw%2FRvWME7AocQEvnqda%2Bt9%2F2%2F1dijTkaspvnUk3NED5o6Trm6oC6tDjaeOAZ6yIUTW7un%2F6Rh0no0nqss5Wcphv4wh1jKh2nJgyAAGv5kxvAFTHrldy8gp0Rdp%2Bja6eoZ%2BLT2Nptk7xPNWAAqQlLae%2BthgcR1iPawunCx0Sji729ChhtMzq7WGirlAlO0axbF2GWwy9mFomnLWY6zgUUX5LV3hrS%2FQzYgugfUKt%2FIqyiH8dOuErQ9iJFEQtIdTef0f5NtkJ5OnwYpYyQXH0I9pK03lpSrqqSVv%2BFFbrr8oUL%2FA2uXE7ZrlS7AgekiszIXKlIT7uI1jugtIVEvlJEoWsLOGcC6c1gcIhK5NNn79Itl6Cip6zB7IWpOQuK%2Fg4oetPtlxzCcbWSKBjIcu9hoMRVCKQoHX1MYxPeSyEUV1CCbcQ8aXHd0RR6xNuHGo0Sl9AViZRwbIFuWp1WRuLpcoWlPxw177YQ2UbONAy608kIZV7KCp5hWkb2z1MVMAVYGlfnZVSv0xWuhmc6RPRS1LXegmzkat%2FEUFWk25EqZXhfmB1CbSxQEJGW%2ByjTGiIv%2BVTsnvDptIKhXK321Q68UcLiX2VBVSWdfZjVoQPuDkjZhGw6PwunhXO05GEWOHkxyoIf%2FE3u6Dm393v6RmwxHh36vKiW3qjrioqFPIYDZRDN1bSqobwuLoGFU%2BjVDwm6ExYHWxal8xryTYqn01PJqxSVdfM7VYzqZnCPcct6WWr7WbyFNJZrG6a%2BFxqDp6jUUxr9xwN5Vqht%2BI%2F5Dpox8kityF3Vak7CMnS0ESleiuixdtgTGHPBuQJNtA2ZPvtyOEJggQheUtGER1SwFcIU9BzIyZVyZJQXq4VEwCScNv%2FyjCDkqzyX332UNuTa1D5r10jjFPcPZqg9B7hc6ET7PXfd4Qqog10WpMVpXBZtJvfyMsO7GmA3PBs4vx9rDnTl7%2BvQeDt8fbNaHoB1l%2FEdfeJ2a9jl49nz6n3dVt6yTZwfjlFAzjaHCc7sPjs6W60qk3LVfNGKyXSWsdLCvH1qcJKt3f223Fkm8JJ3OpB4DVQC36NIxT7W8oMyL7v99ES6UCL%2Fwc%3D'
st.markdown(f'<iframe src={url8} height="600" width="100%" frameborder="0"></iframe>', unsafe_allow_html = True)
st.subheader('5.2 Módulos desarrollados')
tab16, tab17, tab18, tab19, tab20, tab21, tab22, tab23, tab24 = st.tabs(['Módulo de correas planas', 'Módulo de correas trapezoidales', 'Módulo de cadenas', 'Módulo de engranajes', 'Módulo de parametros del eje', 'Módulo de factores de concentración de esfuerzos', 'Módulo de resultados del eje', 'Módulo de simulación del eje', 'Módulo de elementos bidimensionales'])
with tab16:
     col75, col76 = st.columns([3, 1], gap = 'medium')
     with col75:
          st.image(img29, use_column_width = True)
     with col76:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Potencia del motor
               <br>• RPM del motor
               <br>• Diámetros de las poleas
               <br>• Distancias entre centros de las poleas
               <br>• Tipo de motor
               <br>• Materiales para las correas
               <br>• Sentido de giro del motor
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Velocidad de la correa.
               <br>• Ángulos de contacto entre las poleas y la correa.
               <br>• Ancho de la correa.
               <br>• Longitud de la correa.
               <br>• Fuerza tangencial a transmitir.
               <br>• Fuerza radial.
               <br>• Fuerza de arranque.
               <br>• Torque a transmitir.
               <br>• Elongación de la correa
          </div>''', unsafe_allow_html = True)
with tab17:
     col77, col78 = st.columns([3, 1], gap = 'medium')
     with col77:
          st.image(img30, use_column_width = True)
     with col78:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Potencia del motor
               <br>• RPM del motor
               <br>• RPM de la maquina
               <br>• Diámetros de las poleas
               <br>• Distancias entre centros de las poleas
               <br>• Caracteristicas de trabajo
               <br>• Sentido de giro del motor
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Perfil de la correa
               <br>• Numero de correas
               <br>• Velocidad de la correa
               <br>• Ángulos de contacto entre las poleas y la correa
               <br>• Longitud de la correa
               <br>• Fuerza tangencial a transmitir
               <br>• Fuerza radial
               <br>• Torque a transmitir
               <br>• Elongación de la correa
          </div>''', unsafe_allow_html = True)
with tab18:
     col79, col80 = st.columns([3, 1], gap = 'medium')
     with col79:
          st.image(img31, use_column_width = True)
     with col80:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Potencia del motor
               <br>• RPM del motor
               <br>• Numero de dientes de los sprokets
               <br>• Características de las maquinas
               <br>• Distancias entre centros
               <br>• Tipo de cadena
               <br>• Sentido de giro del motor
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Paso de la cadena
               <br>• Tipo de lubricación para la cadena
               <br>• Eficiencia y vida de la cadena
               <br>• Velocidad de la cadena
               <br>• Ángulos de contacto
               <br>• Longitud de la cadena
               <br>• Fuerza tangencial a transmitir
               <br>• Fuerza radial
               <br>• Torque a transmitir
               <br>• Presión de contacto
          </div>''', unsafe_allow_html = True)
with tab19:
     col81, col82 = st.columns([3, 1], gap = 'medium')
     with col81:
          st.image(img32, use_column_width = True)
     with col82:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Potencia del piñón
               <br>• Numero de dientes del piñón
               <br>• Relación de transmisión
               <br>• Ciclos de vida
               <br>• Tipo de engranaje
               <br>• Angulo de presión y de hélice
               <br>• Modulo del engranaje
               <br>• Cargas en las maquinas
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Dimensiones de los engranajes
               <br>• Factores para picadura superficial
               <br>• Factores para flexión
               <br>• Fuerza axial a transmitir
               <br>• Fuerza tangencial a transmitir
               <br>• Fuerza radial a transmitir
               <br>• Torque a transmitir
               <br>• Factores de seguridad
               <br>• Potencia a transmitir
          </div>''', unsafe_allow_html = True)
with tab20:
     col83, col84 = st.columns([3, 1], gap = 'medium')
     with col83:
          st.image(img33, use_column_width = True)
     with col84:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Numero de nodos del eje
               <br>• Longitudes del eje
               <br>• Diámetros internos y externos del eje
               <br>• Fuerzas X Y Z sobre el eje
               <br>• Cargas distribuidas XY sobre el eje
               <br>• Cargas distribuidas XZ sobre el eje
               <br>• Momentos X Y Z sobre el eje
               <br>• Módulos de elasticidad del eje
               <br>• Módulos de rigidez del eje
               <br>• Esfuerzos de fluencia del eje
               <br>• Esfuerzos de rotura del eje
               <br>• Densidades del eje
               <br>• Numero de elementos del eje
               <br>• Tipos de apoyos en el eje.
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Esquema bidimensional, el cual muestra las dimensiones y apoyos del eje
               <br>• Peso y centro de masa del eje
          </div>''', unsafe_allow_html = True)
with tab21:
     col85, col86 = st.columns([3, 1], gap = 'medium')
     with col85:
          st.image(img34, use_column_width = True)
     with col86:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Tipos de concentración de esfuerzos
               <br>• Temperatura de trabajo
               <br>• Porcentaje de confiabilidad
               <br>• Ciclaje alto
               <br>• RPM del eje
               <br>• Esfuerzos de fluencia y factores de seguridad correspondientes a las chavetas
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Factores de concentración de esfuerzos estáticos y dinámicos
               <br>• Limites de fatiga modificados
               <br>• Longitud de las chavetas cuadradas
               <br>• Esquema bidimensional del eje para la correcta aplicación de los factores de concentración de esfuerzos.
               <br>• Redireccionamiento a la herramienta online de SKF para la selección de rodamientos
          </div>''', unsafe_allow_html = True)
with tab22:
     col87, col88 = st.columns([3, 1], gap = 'medium')
     with col87:
          st.image(img35, use_column_width = True)
     with col88:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Módelo teórico de cálculo       
               <br>• Resultado a analizar
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Reacciones de fuerzas X Y Z
               <br>• Reacciones de momentos X Y Z
               <br>• Diagramas de axiales
               <br>• Diagramas de torques
               <br>• Diagramas de cortantes
               <br>• Diagramas de flectores
               <br>• Diagramas de pendientes
               <br>• Diagramas de deformaciones
               <br>• Diagramas de factores de seguridad
               <br>• Diagramas de esfuerzos
               <br>• Diagrama de velocidad critica
               <br>• Curva S-N y ciclos de vida
               <br>• Factores de seguridad
               <br>• Esquema tridimensional del eje para la representación de los resultados
          </div>''', unsafe_allow_html = True)
with tab23:
     col89, col90 = st.columns([3, 1], gap = 'medium')
     with col89:
          st.image(img36, use_column_width = True)
     with col90:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Resultado para la simulación
               <br>• Escala de deformación
               <br>• Numero de frames para la simulación
               <br>• Plano de visualización para la simulación
               <br>• Grados de elevacion y azimuth para la visualización de la representación tridimensional del eje deformado
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Deformación angular máxima
               <br>• Deformación lineal máxima
               <br>• Factor de seguridad estático mínimo según el criterio elegido
               <br>• Factor de seguridad dinámico mínimo según el criterio elegido
               <br>• Velocidad crítica del eje
               <br>• Horas de vida del eje
               <br>• Simulación de la deformación del eje
               <br>• Animación de la simulación del eje
          </div>''', unsafe_allow_html = True)
with tab24:
     col91, col92 = st.columns([3, 1], gap = 'medium')
     with col91:
          st.image(img37, use_column_width = True)
     with col92:
          st.markdown('''<div style="text-align: justify;">
               <b>Main inputs:</b>
               <br>• Imagen del componente a analizar
               <br>• Número de nodos necesarios para representar al componente
               <br>• Modulo de poisson del componente
               <br>• Modulo de elasticidad del componente
               <br>• Espesor del componente
               <br>• Nivel de refinamiento de la malla
               <br>• Escala de deformación
               <br>• Numero de frames de la simulación
          </div>''', unsafe_allow_html = True)
          st.markdown('''<div style="text-align: justify;">
               <b>Main outputs:</b>
               <br>• Reacciones y desplazamientos de cada nodo
               <br>• Esfuerzo de Von Misses y factor de seguridad de cada elemento
               <br>• Representación bidimensional de los esfuerzos y deformaciones
               <br>• Simulación de la deformación del componente
          </div>''', unsafe_allow_html = True)          
st.markdown('''<div style="text-align: justify;">
     La aplicación desarrollada ofrece una gran variedad de resultados, tanto numéricos como gráficos,
     a partir de los cuales el diseñador puede basarse para efectuar las optimizaciones correspondientes.
     No obstante, muchas veces resulta necesario una visualización mucho mas intuitiva de ciertos resultados, 
     por lo que, adicionalmente la aplicación permite crear representaciones visuales mucho mas didacticas como las siguientes:
</div>''', unsafe_allow_html = True)
st.markdown('#####')
col95, col96, col97 = st.columns([1, 1, 1], gap = 'small')
with col95:
     st.markdown(f'<img src = "data:image/gif;base64,{gif5}" width = "100%">', unsafe_allow_html = True)
with col96:
     st.markdown(f'<img src = "data:image/gif;base64,{gif2}" width = "100%">', unsafe_allow_html = True)
with col97:
     st.markdown(f'<img src = "data:image/gif;base64,{gif3}" width = "100%">', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     Todos los modulos desarrollados pueden ser utilizados directamente desde cualquier
     navegador web, como google chrome, microsoft edge, etc. Esto se debe a que el proyecto
     se integro con GitHub, la cual es una de las herramientas mas utilizadas
     por programadores para el desarrollo y distribución de software. Todo el proyecto se encuentra
     registrado en un repositorio publico, en el cual se explica de manera resumida la aplicación desarrollada, 
     y se brinda los accesos directos a las aplicaciones junto con sus respectivos tutoriales. Ademas, gracias a 
     la señalada integración, se puede ejecutar actualizaciones de la aplicación de manera global, en caso fuese necesario una.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown(f'<a href="https://github.com/junior19a2000/Bachillerato/blob/main/README.md"><img src = "data:image/gif;base64,{gif4}" width = "100%">', unsafe_allow_html = True)

# Validación
st.header('6. Validación')
st.markdown('''<div style="text-align: justify;">
     Para la validación teórica del módulo de ejes, se ha visto por conveniente utilizar el caso de estudio abordado en el libro: "Diseño en
     ingeniería mecánica de Shigley". El planteamiento del problema y el proceso de validación se muestran a continuación:
</div>''', unsafe_allow_html = True)
st.markdown('#####')
col71, col72 = st.columns([1, 1], gap = 'medium')
with col71:
     url4 = 'https://drive.google.com/file/d/1otj0L-IovilNb5Z0eQEhArahWDnuFvac/preview'
     st.markdown(f'<iframe src={url4} height="650" width="100%"></iframe>', unsafe_allow_html = True)
with col72:
     url5 = 'https://drive.google.com/file/d/1Jj_NNjUQ3voAgIAqA7DzZIhCRo-vSsA0/preview'
     st.markdown(f'<iframe src={url5} height="245" width="100%"></iframe>', unsafe_allow_html = True)
     st.markdown('#####')
     url6 = 'https://sketchfab.com/models/5a30f935158c43a08d28041942d2a98d/embed'
     st.markdown(f'<iframe src={url6} height="380" width="100%"></iframe>', unsafe_allow_html = True)
st.markdown('''<div style="text-align: justify;">
     En el caso de estudio, el autor cálcula los diametros en función a factores de seguridad establecidos y diversas iteraciones. No obstante, el proceso 
     de cálculo del módulo de ejes de PSTC es similar a los software CAE actuales, es decir, primero se inicia con el dimensionamiento del eje y luego se modifica la geometria inicial hasta alcanzar el factor   
     de seguridad buscado. En concecuencia, los resultados obtenidos por PSTC se compararan mejor con los obtenidos por programas CAE, los cuales en este caso son Ansys, Paraview y Simscale.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
selectbox_2 = st.selectbox('Resultado a validar', ('Diagrama xz', 'Diagrama xy', 'Esfuerzos estáticos', 'Esfuerzos dinámicos', 'Ciclos de vida', 'Deformaciones', 'Velocidad crítica'))
col100, col101 = st.columns([1, 1], gap = 'medium')
col100.markdown(
     "<h3 style='text-align: center;'>Otros</h1>",
unsafe_allow_html = True)
col101.markdown(
     "<h3 style='text-align: center;'>Power System Transmission Calculator</h1>",
unsafe_allow_html = True)
if selectbox_2 == 'Diagrama xz':
     col100.image(img39)
     col101.image(img40)
elif selectbox_2 == 'Diagrama xy':
     col100.image(img41)
     col101.image(img42)
elif selectbox_2 == 'Esfuerzos estáticos':
     url7 = 'https://drive.google.com/file/d/1hig9McpA3y1S7cx_nxM-a3G1zS8Ehqqz/preview'
     col100.markdown(f'<iframe src={url7} height="328" width="100%"></iframe>', unsafe_allow_html = True)
     col101.image(img43)
elif selectbox_2 == 'Esfuerzos dinámicos':
     col100.image(img44)
     col101.image(img45)
elif selectbox_2 == 'Ciclos de vida':
     col100.image(img46)
     col101.image(img47)
elif selectbox_2 == 'Deformaciones':
     col100.markdown(f'<img src = "data:image/gif;base64,{gif6}" width = "100%" height = "320">', unsafe_allow_html = True)
     st.markdown('#####')
     col101.markdown(f'<img src = "data:image/gif;base64,{gif7}" width = "100%" height = "320">', unsafe_allow_html = True)
     st.markdown('#####')
elif selectbox_2 == 'Velocidad crítica':
     col100.image(img48)
     col101.image(img49)
col100.markdown('''<div style="text-align: justify;">
     Todos los resultados obtenidos en el módulo de ejes se resumen en 6 valores: Pendiente máxima, deflexión máxima, factor de seguridad estático mínimo, 
     factor de seguridad dinámico mínimo, velocidad crítica y horas de vida. A partir de estos, cualquier usuario sin importar su nivel de expertiz, deberia 
     ser capaz de diseñar un eje de transmición de potencia eficiente. Se puede apreciar que, a partir de los resultados gráficos y númericos, los resultados obtenidos 
     por PSTC se validan con los resultados obtenidos por el autor en el caso de estudio y los software CAE utilizados en el análisis. 
</div>''', unsafe_allow_html = True)
col101.latex(r'''
          \begin{array}{| c | c | c |}\hline
          \text{Resultado} & \text{P.S.T.C.} & \text{Otros} \\\hline
          \text{Pendiente (rad)} & 0.00056321 & 0.00000000 \\\hline
          \text{Deflexiones (m)} & 0.00003079 & 0.00003039 \\\hline
          \text{F.S. Von Misses} & 4.4933 & 4.4943 \\\hline
          \hspace{8.25mm} \text{F.S. ASME} \hspace{8.25mm} & \hspace{10mm} 1.9993 \hspace{10mm} & \hspace{10mm} 1.9882 \hspace{10mm} \\\hline
          \text{RPM crítico} & 5765.1 & 5164.8 \\\hline
          \text{Horas de vida} & 5.4750 & 5.4307 \\\hline
          \end{array} 
     ''')
st.header('7. Aplicación')
st.markdown('''<div style="text-align: justify;">
     Durante el desarrollo del curso "Diseño de Maquinas" en la Universidad, se elaboró el proyecto denominado <a style="text-decoration:none; color: black" href="https://drive.google.com/file/d/1XbGtGwfPnpFTuzziI2uQhbUHs36x2oD7/preview" target="_blank">"ANALISIS DE INGENIERIA INVERSA DE UN MAQUINA TRITURADORA DE
     PET DE LA EMPRESA HYC INDUSTRIAS DEL PERU"</a>, en el cual se analizo el proceso de diseño de una maquina de trituración PET, con la finalidad de optimizar el diseño de sus componentes. 
     Los cálculos para la mencionada optimización, en el caso de las correas en V y el eje a utilizar en la transmisión de potencia, fueron realizados de manera manual y con ayuda del programa Inventor respectivamente, 
     obteniendo como resultado el uso de 3 correas tipo B en lugar de 5 correas tipo C, y un diametro del eje equivalente a 70 mm en vez de los 110 mm con el que este fue fabricado. Ahora bien, con el uso de PSTC para el mismo 
     objetivo, se obtuvo como resultados el uso de 3 correas tipo SPZ y un diametro de eje 50 mm. Estos resultados obtenidos no solo validan los obtenidos en el desarrollo del proyecto, sino que significan una mejora, 
     ya que en el caso de las correas, se utilizo la metodología de cálculo de un fabricante y, en el caso del eje, el diametro propuesto es menor y cumple con las condiciones establecidas para su diseño. Ademas, cabe señalar que 
     el tiempo utilizado con PSTC resulta mucho menor que el empleado en el proyecto, entre otras consideraciones que resaltan a PSTC como una mejor alternativa.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
url9 = 'https://drive.google.com/file/d/1W_iUF0AgRPj-XbYmv7lQm0qCxczGxnO8/preview'
st.markdown(f'<iframe src={url9} height=675  width="100%"></iframe>', unsafe_allow_html = True)

# Conclusiones
st.header('8. Conclusiones')
st.markdown('''<div style="text-align: justify;">
     📌 Debido a la digitalización de diagramas, los factores necesarios en el diseño, son determinados sin la necesidad de que el usuario 
     intervenga en ello, lo cual se traduce en una reducción de tiempo considerable en el proceso de cálculo general.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     📌 A diferencia de otros programas, el haber considerado la configuración geométrica de la transmisión de potencia y el sentido de giro 
     del motor, permite que la descomposición y la determinación de las fuerzas sea mas realista y por lo tanto, un analisis mas preciso del eje de transmisión.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     📌 Gracias al estudio e inclusión de diversas metodologías de cálculo, la aplicación esta en la capacidad de analizar, cálcular y diseñar cualquier tipo de eje 
     de transmisión de manera óptima.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     📌 El no haber ignorado los efectos de las fuerzas cortantes en los analisis del eje de transmisión, no ha supuesto una diferencia significativa en los resultados, 
     almenos cuando el eje es de proporciones genéricas.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     📌 Si bien, la aplicación desarrollada se centra en el diseño de ejes de transmisión, no se deja de lado a los componentes que por lo general, permiten dicha transmisión, siendo 
     en este caso: las correas planas, las correas trapezoidales, las cadenas y los engranajes, los cuales se analizan bajo la metodología de fabricantes y normativas reconocidas mundialmente.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     📌 Se ha cumplido con los objetivos establecidos en el proyecto de investigación, ya que la aplicación desarrollada se caracteriza por su interfaz gráfica amigable, uso sencillo y acceso libre, lo cual sumado a que sus algoritmos poseen una lógica 
     de programación eficiente, la convierte en una gran opción para el diseño de sistemas de transmisión de potencia de manera óptima.
</div>''', unsafe_allow_html = True)

# Oportunidades de mejora
st.header('9. Oportunidades de mejora')
st.markdown('''<div style="text-align: justify;">
     👉 La precisión de las interpolaciones, en el proceso de la digitalización de los diagramas, podria incrementarse si se añade una mayor cantidad de datos.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     👉 Si bien se ha señalado que con la aplicación desarrollada se puede analizar cualquier tipo de eje de transmisión, es importante mencionar que, existen factores involucrados en el proceso, que dependen de ciertas propiedades, las cuales si son 
     atipicas, podrian hacer que dichos factores difieran de los utilizados en la aplicación, por lo que, para estos casos, el usuario debe ser alguien con la 
     capacidad de estimar la precisión de los resultados obtenidos con la aplicación. En concecuencia, los algoritmos desarrollados deben actualizarse para abarcar mayores casuisticas que aun no se han contemplado.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     👉 Se han analizado los componentes principales de un sistema de transmisión de potencia, no obstante, existen otros que tambien deberian ser incluidos, como los motores, volantes de inercia, 
     anillos de retención, etc.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     👉 Asi mismo, los componentes abarcados en la aplicación, se cálculan segun el fabricante respectivo, sin embargo, existen otros fabricantes de igual relevancia, que podrian ser incluidos.
</div>''', unsafe_allow_html = True)
st.markdown('#####')
st.markdown('''<div style="text-align: justify;">
     👉 Este proyecto podría ser utilizado para el desarrollo de un laboratorio virtual para el análisis y diseño de sistemas de transmisión de potencia.
</div>''', unsafe_allow_html = True)

# Agradecimientos
st.header('10. Agradecimientos')
st.markdown('''<div style="text-align: justify; padding: 20px; border: 2.5px solid black; margin: 0px; border-radius: 15px;"><b>
     Mi mayor agradecimiento esta dirigido a Dios, por haberme permitido estudiar una carrera profesional y el desarrollar este proyecto de tesis, 
     sin embargo, si bien Dios me lo permitio, fue gracias a mi mamá que todo esto se hizo posible, ya que sin ella estoy seguro no lo hubiera logrado. 
     Mi madre es la mujer que mas respeto y admiro, y aunque no siempre se lo digo, espero que estas palabras y este proyecto sean evidencia de ello, 
     ya que me he esforzado en demostrarle que la confianza y el sacrificio depositado en mi, ha valido la pena, y espero seguir en ese camino. Agradezco 
     tambien a mis hermanos y a mi papa, quienes me ayudaron desde pequeño y estimo mucho. Finalmente, me agradezco a mi, por no haberme rendido nunca y seguir 
     siempre adelante, a pesar de las adversidades.
</b></div>''', unsafe_allow_html = True)
# --------------------------------------------------------------------------------------------------------------------------------------------------

# Sobre el autor
with st.sidebar:
     st.markdown('# Sobre el autor ...')
     st.markdown('''<div style="text-align: justify;">
          Cuando elegí la carrera de Ingeniería Mecánica no estaba seguro si en verdad era lo que queria estudiar,\
          pero a medida que avanzaba me di cuenta que me encontraba en el lugar correcto, dado que me considero una persona a la cual le\
          gusta aprender de todo, y esta carrera es tan amplia que me permite involucrarme en distintas ramas tales\
          como el diseño mecánico, energías renovables y automatización (mis preferidas, obviamente hay mas). Por otra parte, otra de mis pasiones \
          es la programación, sobre todo el desarrollo de aplicaciones web, lo cual cabe decir, me ha ayudado bastante, tanto en la\
          universidad como en el mundo laboral. Este proyecto es un claro ejemplo de lo que menciono, ya que para su desarrollo han sido\
          necesarios mis conocimientos en ingeniería mecánica y programación, y del cual me siento muy orgulloso, ya que en comparación con otros\
          proyectos similares, humildemente considero que el mío es mucho mejor.
     </div>''', unsafe_allow_html = True)
     st.markdown('#')
     st.image(img12, caption = 'Junior Joel Aguilar Hancco')

# st.components.v1.html(f'<iframe src={i}> </iframe>')
# url1 = 'https://junior19a2000.github.io/Jupywidgets/lab?path=Numesym.ipynb'
# url1 = 'https://junior19.starboard.host/v1/embed/0.15.3/cbljq1i23akg00a8j9b0/n529MY4/'
# st.markdown(f'<iframe src={url1} height="760" width="100%"></iframe>', unsafe_allow_html = True)

# st.latex(r'''\large
#           \begin{array}{|c | c |c | c|}\hline \\
#           \text{Resultado} & \text{P.S.T.C.} & \text{Otros} & \text{\% de Error}\\ \\\hline \\
#           \text{Pendiente (rad)} & 0.00056321 & 0.00000000 & 0.000\\ \\\hline \\
#           \text{Deflexiones (m)} & 0.00003079 & 0.00003039 & 1.310\\ \\\hline \\
#           \text{F.S. Von Misses} & 4.4933 & 4.4943 & 0.022\\ \\\hline \\
#           \text{F.S. ASME} & 1.9993 & 1.9882 & 0.550\\ \\\hline \\
#           \text{RPM crítico} & 5765.1 & 5164.8 & 11.62\\ \\\hline \\
#           \text{Horas de vida} & 5.4750 & 5.4307 & 0.815\\ \\\hline
#           \end{array} 
#      ''')