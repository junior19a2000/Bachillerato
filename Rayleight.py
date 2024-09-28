import matplotlib.pyplot as plt
import numpy as np
import solara as sol
import sympy as sp
import pandas as pd

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
    data_frame  = pd.DataFrame(table_data, columns = ["Centro de masa (mm)", "Volumen (mm3)", "Peso (N)", "Deflexión (mm)"]).round(1)
    
    fig, axs = plt.subplots(figsize = (12, 6))
    axs.plot(x1, y1, color = '#000000', linestyle = 'solid', linewidth = 3)
    axs.plot(x2, y2, color = '#cccccc', linestyle = 'solid', linewidth = 1)
    axs.plot(x3, y3, color = '#000000', linestyle = 'solid', linewidth = 2)
    axs.fill(x4, y4, color = '#7f7f7f', alpha = 0.5)
    axs.set_xticks([])
    axs.set_xlabel('')
    axs.set_yticks([])
    axs.set_ylabel('')
    axs.spines['top'].set_visible(False)
    axs.spines['bottom'].set_visible(False)
    axs.spines['left'].set_visible(False)
    axs.spines['right'].set_visible(False)

    if tpo == 'Escalonado':
        axs.plot(np.array([[300, 700], [300, 700]]), np.array([[50, 50], [-50, -50]]), color = 'black', linestyle = 'solid', linewidth = 1)
        axs.text(30 + 50, 20, r'$\frac{30}{\pi}\sqrt{\frac{g}{max(\delta_R)}}=$' + str(round(vel_dun_cla, 2)), fontsize = 11)
        axs.text(500 + 50, 30, r'$\frac{30}{\pi}\sqrt{g\frac{\sum m_i y_i}{\sum m_i y_{i}^{2}}}=$' + str(round(vel_ray_cla, 2)), fontsize = 11)
        axs.text(500 + 50, 10, r'$\frac{30}{\pi}\sqrt{g\frac{\sum \rho A\int y_{(x)}dx}{\sum \rho A\int y_{(x)}^{2}dx}}=$' + str(round(vel_ray_mod, 2)), fontsize = 11)
        axs.text(270 + 50, 20, r'$<V.C.R.<$', fontsize = 20)
    else:
        axs.plot(x5, y5, color = 'black', linestyle = 'solid', linewidth = 1)
        axs.plot(np.array([[500, 1000], [500, 1000]]), np.array([[25, 25], [-25, -25]]), color = 'black', linestyle = 'solid', linewidth = 1)
        axs.text(50 + 50, 6, r'$\frac{30}{\pi}\sqrt{\frac{g}{max(\delta_R)}}=$' + str(round(vel_dun_cla, 2)), fontsize = 11)
        axs.text(1000 + 50, 10, r'$\frac{30}{\pi}\sqrt{g\frac{\sum m_i y_i}{\sum m_i y_{i}^{2}}}=$' + str(round(vel_ray_cla, 2)), fontsize = 11)
        axs.text(1000 + 50, 3, r'$\frac{30}{\pi}\sqrt{g\frac{\sum \rho A\int y_{(x)}dx}{\sum \rho A\int y_{(x)}^{2}dx}}=$' + str(round(vel_ray_mod, 2)), fontsize = 11)
        axs.text(550 + 50, 6, r'$<V.C.R.<$', fontsize = 20)

    return fig, data_frame

elements = sol.reactive(1)
tipodeje = sol.reactive('Escalonado')

@sol.component
def Page():
    sol.lab.theme.dark = False
    sol.lab.theme.themes.light.primary = "#000000"
    sol.Title('Ecuación de Rayleigh modificada')
    with sol.AppBar():
        sol.Markdown('<span style="color:white">*Desarrollado por Junior A.H.*</span>')
    fig, data_frame = f1_rpm(elements.value, tipodeje.value)
    with sol.Sidebar():
        sol.Select(label = 'Tipo de eje', value = tipodeje, values = ['Escalonado', 'Hueco'])  
        sol.DataFrame(data_frame, items_per_page = 12, scrollable = False)            
    with sol.Card(title = '', subtitle = '', elevation = 5):
        sol.SliderInt('Número de sectores:', value = elements, min = 1, max = 50)
        with sol.Column(align = 'center'):
            plt.show(fig)                               

    