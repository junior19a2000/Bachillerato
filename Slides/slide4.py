import streamlit as st
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
import pandas as pd
from scipy.interpolate import interp1d, RegularGridInterpolator
from PIL import Image

class titulo:
    def __init__(self, level, text):
        self.level = level
        self.text = text
    def create(self):
        html_code = f'<h{self.level} style = "text-align: left; color: black;">{self.text}</h{self.level}>'
        return st.markdown(html_code, unsafe_allow_html = True)

class texto:
    def __init__(self, text):
        self.text = text
    def create(self):
        html_code = f'<div style = "text-align: justify; color: black;">{self.text}</div>'
        return st.markdown(html_code, unsafe_allow_html = True)

@st.cache_data()
def load_resources(load):
    img1 = mpimg.imread(f'Imagenes/carta1.png')
    img2 = Image.open(f'Imagenes/tramos.png')
    img3 = Image.open(f'Imagenes/maxelem.jpg')
    img4 = Image.open(f'Imagenes/maxelem1.jpg')
    img5 = Image.open(f'Imagenes//esfuerzoscf.jpg')
    img6 = Image.open(f'Imagenes/elem4.png')

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
    fx = interp1d([5, 35], [50, 550])
    fy = interp1d([0.11, 0.148], [650, 20])
    fz = RegularGridInterpolator((y, x), z)
    
    return img1, img2, img3, img4, img5, img6, fx, fy, fz
img1, img2, img3, img4, img5, img6, fx, fy, fz = load_resources('load')

def factor(x1, y1, img, fx, fy, fz):
    f1 = str(np.round(fz((y1, x1)), 5))
    f2 = fx(x1)
    f3 = fy(fz((y1, x1)))
    fig, axe = plt.subplots()
    axe.imshow(img)
    axe.plot([f2, f2], [650, 20], 'black', linestyle = 'dotted', linewidth = 3)
    axe.plot([50, 550], [f3, f3], 'black', linestyle = 'dotted', linewidth = 3)
    axe.text(f2, f3, rf'${f1}$', color = 'white', fontsize = 7.5, bbox = dict(facecolor = 'black', edgecolor = 'black', boxstyle = 'round,pad = 0.5'), ha = 'center', va = 'center')
    axe.axis('off')
    return fig

def motor(rme, rma, lon, phi, giro):
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
    zoom = 1
    x9 = np.tan(np.deg2rad(phi)) * np.array([-lon - zoom * rma, lon + zoom * rma])
    y9 = (-1 / np.tan(np.deg2rad(phi))) * np.array([-lon - zoom * rma, lon + zoom * rma]) + (y2 - (-1 / np.tan(np.deg2rad(phi))) * x2)
    fig, axe = plt.subplots()
    axe.plot(x1 + rme * np.cos(tetha), y1 + rme * np.sin(tetha), 'black', linewidth = 3)
    axe.plot(x2 + rma * np.cos(tetha), y2 + rma * np.sin(tetha), 'black', linewidth = 3)
    if giro == 'Antihorario':
        axe.plot([x3, x4], [y3, y4], 'black')
        axe.plot([x5, x6], [y5, y6], 'black')
        FMcos = np.round(65 * np.cos(np.deg2rad(beta)), 2)
        Fmcos = np.round(35 * np.cos(np.deg2rad(alpa)), 2)
        FMsin = np.round(65 * np.sin(np.deg2rad(beta)), 2)
        Fmsin = np.round(35 * np.sin(np.deg2rad(alpa)), 2)
    else:
        axe.plot([x3, x4], [y3, y4], 'black')
        axe.plot([x5, x6], [y5, y6], 'black')
        FMcos = np.round(65 * np.cos(np.deg2rad(alpa)), 2)
        Fmcos = np.round(35 * np.cos(np.deg2rad(beta)), 2)
        FMsin = np.round(65 * np.sin(np.deg2rad(alpa)), 2)
        Fmsin = np.round(35 * np.sin(np.deg2rad(beta)), 2)
    fxpr  = np.round(Fmcos + FMcos, 2)
    fypr  = np.round(Fmsin + FMsin, 2)
    axe.arrow(x2, y2, x7 - x2, y7 - y2, color = 'black', head_width = 0.05, width = 0.005)
    axe.arrow(x2, y2, x8 - x2, y8 - y2, color = 'black', head_width = 0.05, width = 0.005)
    axe.plot([x2 - rma, x2 + rma], [y2, y2], color = 'black', linestyle = 'dashed')
    axe.plot([x2, x2], [y2 - rma, y2 + rma], color = 'black', linestyle = 'dashed')
    axe.plot([-lon - zoom * rma, lon + zoom * rma], x9, color = 'black', linestyle = 'dotted')
    axe.plot([-lon - zoom * rma, lon + zoom * rma], y9, color = 'black', linestyle = 'dotted')
    axe.text(x2 + rma, y2, rf'$F_x = {abs(fxpr)}$', color = 'white', fontsize = 7.5, bbox = dict(facecolor = 'black', edgecolor = 'black', boxstyle = 'round,pad = 0.5'), ha = 'center', va = 'center')
    axe.text(x2, y2 + rma, rf'$F_y = {abs(fypr)}$', color = 'white', fontsize = 7.5, bbox = dict(facecolor = 'black', edgecolor = 'black', boxstyle = 'round,pad = 0.5'), ha = 'center', va = 'center')
    axe.set_xlim([-lon - zoom * rma, lon + zoom * rma])
    axe.set_ylim([-lon - zoom * rma, lon + zoom * rma])
    axe.set_aspect('equal', adjustable = 'box')
    axe.axis('off')
    return fig, beta, alpa

def error():
    R = np.random.randint(10, 1001, 100) / 1000
    r = R / 2
    M = np.random.randint(1, 1000, 100)
    m = np.random.randint(1, 1000, 100)
    V = np.random.randint(1, 1000, 100)
    v = np.random.randint(1, 1000, 100)
    f = np.random.randint(1, 1000, 100)
    t = np.random.randint(1, 1000, 100)
    N = (4 * R * (M * np.sin(np.arctan(M / m)) + m * np.cos(np.arctan(M / m)))) / (np.pi * (R ** 4 - r ** 4))
    C = (4 * (R ** 2 + R * r + r ** 2) * (V * np.sin(np.arctan(M / m)) ** 2 + v * np.cos(np.arctan(M / m)) ** 2)) / (3 * np.pi * (R ** 4 - r ** 4))
    F = f / (np.pi * (R ** 2 - r ** 2))
    T = (2 * t * R) / (np.pi * (R ** 4 - r ** 4))
    p = np.random.randint(0, 2, 100)
    p[p == 0] = -1
    NmaxR = N + F
    CmaxR = T + C * p
    CmaxA = T + C
    CmaxU = T + 0
    VR = np.sqrt(NmaxR ** 2 + 3 * CmaxR ** 2)
    VA = np.sqrt(NmaxR ** 2 + 3 * CmaxA ** 2)
    VU = np.sqrt(NmaxR ** 2 + 3 * CmaxU ** 2)
    T = np.arange(1, 101) * C
    NmaxR = N + F
    CmaxR = T + C * p
    CmaxA = T + C
    CmaxU = T + 0
    VRR = np.sqrt(NmaxR ** 2 + 3 * CmaxR ** 2)
    VAR = np.sqrt(NmaxR ** 2 + 3 * CmaxA ** 2)
    VUR = np.sqrt(NmaxR ** 2 + 3 * CmaxU ** 2)
    data1 = pd.DataFrame([abs((VR - VA) / VR) * 100, abs((VR - VU) / VR) * 100]).T
    data1.columns = ['Con cortantes: ' + str(round(data1.mean().iat[0], 2)) + ' %', 'Sin cortantes: ' + str(round(data1.mean().iat[1], 2)) + ' %']
    data2 = pd.DataFrame([abs((VRR - VAR) / VRR) * 100, abs((VRR - VUR) / VRR) * 100]).T
    data2.columns = ['Con cortantes: ' + str(round(data2.mean().iat[0], 2)) + ' %', 'Sin cortantes: ' + str(round(data2.mean().iat[1], 2)) + ' %']
    return data1, data2

def dinamico():
    fm = np.random.randint(-100, 100, 4)
    an = np.linspace(0, 2 * np.pi, 100)
    ef1 = fm[0] * np.sin(an) ** 2
    ef2 = fm[1] * np.cos(an) ** 2
    ef3 = fm[0] * np.sin(an) ** 2 + fm[1] * np.cos(an) ** 2
    em1 = fm[2] * np.sin(an)
    em2 = fm[3] * np.cos(an)
    em3 = fm[2] * np.sin(an) + fm[3] * np.cos(an)
    data1 = pd.DataFrame([an, em1, em2, em3]).T
    data1.columns = ['Radianes', 'Solo en Y', 'Solo en Z', 'Esfuerzo combinado']
    data2 = pd.DataFrame([an, ef1, ef2, ef3]).T
    data2.columns = ['Radianes', 'Solo en Y', 'Solo en Z', 'Esfuerzo combinado']
    return data1, data2

titulo(2, '4. Marco metodológico').create()

titulo(3, '4.1 Correas planas, correas trapezoidales, cadenas y engranajes').create()
col1, col2 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
with col1:
    text = '''
        Para el cálculo de estos componentes resulta 
        nacesario el uso de factores, que por lo general, estan representados mediante gráficas y tablas. 
        Por medio del procesamiento de imágenes, se han extraido los datos de las gráficas 
        correspondientes a cada uno de estos factores, para poder asi representarlos mediante tablas y, posteriormente, mediante 
        interpolaciones (unidimensionales o bidimensionales), estar en la capacidad calcularlos. Para el citado procesamiento, se usaron las siguientes ecuaciones:
    '''
    texto(text).create()
    st.markdown('######')
    st.latex(r'{x_{{n_{a,b}}}} = \frac{{{x_{{n_{b,a}}}} - {x_{{1_{b,a}}}}}}{{{x_{{2_{b,a}}}} - {x_{{1_{b,a}}}}}}\left( {{x_{{2_{a,b}}}} - {x_{{1_{a,b}}}}} \right) + {x_{{1_{a,b}}}}')
    st.latex(r'{y_{{n_{a,b}}}} = \frac{{{y_{{n_{b,a}}}} - {y_{{1_{b,a}}}}}}{{{y_{{2_{b,a}}}} - {y_{{1_{b,a}}}}}}\left( {{y_{{2_{a,b}}}} - {y_{{1_{a,b}}}}} \right) + {y_{{1_{a,b}}}}')
    st.markdown('######')
    texto('A la derecha, se muestra el cálculo de un factor para engranajes:').create()
    col3, col4 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col3:
        slider1 = st.slider('Ángulo', 5, 35, 20, 1)
    with col4:
        slider2 = st.slider('Dientes', 20, 300, 300, 1)
    fig1 = factor(slider1, slider2, img1, fx, fy, fz)
with col2:
    st.pyplot(fig1, use_container_width = True)
col5, col6 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
with col5:
    text = '''
        Por otra parte, en la mayoría de casos, la trasmisión de potencia hacia el eje se dará de manera indirecta, es decir, 
        por medio de corras o cadenas, las cuales podrian ubicarse en distintas configuraciones geométricas.
        En concecuencia, para efectos de un análisis más realista, las fuerzas que actúan en el eje producto de la transmisión de 
        potencia, deben de descomponerse en ejes alineados en las direcciones paralela y perpendicular a la gravedad. Los ángulos 
        de descomposición de las fuerzas de transmisión son:
    '''
    texto(text).create()
    st.latex(r'\beta = 90 + \varphi  - \phi \hspace{3mm} \text{y} \hspace{3mm} \alpha = 2\varphi - \beta')
    st.latex(r'\text{donde} \hspace{10mm} \phi = \cos^{-1} \left( \frac{R - r}{a} \right)')
    col7, col8 = st.columns([1, 1], gap = 'large', vertical_alignment = 'center')
    with col7:
        number1 = st.number_input('Angulo de desfase (𝜑)', 0, 360, 50, 1)
    with col8:
        radio1 = st.radio('⟳ Sentido de giro del motor', ['Antihorario', 'Horario'], horizontal = True, label_visibility = 'visible')
with col6:
    fig2, beta, alpa = motor(0.1, 0.2, 0.4, number1, radio1)
    st.pyplot(fig2, use_container_width = True)

titulo(3, '4.2 Ejes de transmisión  de potencia').create()
titulo(4, '4.2.1 Cálculo general de las reacciones y desplazamientos (Euler - Bernoulli)').create()
text = '''
    Mediante el uso del método de las integraciones concecutivas se pueden cálcular las reacciones y desplazamientos correspondientes a un eje 
    con propiedades geométricas y mecánicas no constantes, bajo la presencia de cualquier cantidad de cargas y apoyos.
'''
texto(text).create()
st.markdown('######')
st.image(img2, use_column_width = True)
st.markdown('######')
st.latex(r'''\scriptsize
    \begin{array}{c c c}\hline\\
    \text{ Ecuación } & \text{ Representativa } & \text{ Aplicativa:}\hspace{5mm} para\;k = 1\; \to \;T\hspace{5mm}\text{ donde T es el numero de tramos del eje} \\\\\hline\\
    \text{Cortantes}       & {{V_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{W_T}(x)dx} }           & {V_k}(x) =  - \sum\limits_{i = 1}^k {{F_i}}  - {w_k}(x - {x_k}) - \sum\limits_{i = 1}^{k} {{w_{i-1}}({x_{i}} - {x_{i-1}})}\\\\\\
    \text{Momentos}      & {{M_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{V_T}(x)dx} }              & {M_k}(x) =  - x\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{2}{w_k}{(x - {x_k})^2} - x\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + {C_{{1_k}}} + {M_k} \\\\\\
    \text{Pendientes}     & {{\theta _T} = \frac{{\int\limits_{{x_T}}^{{x_{T + 1}}} {{M_T}(x)dx} }}{{{E_T}{I_T}}}}             & {E_k}{I_k}{\theta _k}(x) = { - \frac{{{x^2}}}{2}\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{6}{w_k}{{(x - {x_k})}^3} - \frac{{{x^2}}}{2}\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + {C_{{1_k}}}x + {M_k}x + {C_{{2_k}}}} \\\\\\
    \hspace{2mm}\text{Deflexiones}\hspace{2mm}     & \hspace{4mm} {{y_T} = \int\limits_{{x_T}}^{{x_{T + 1}}} {{\theta _T}(x)dx} } \hspace{4mm} & \hspace{5mm} {E_k}{I_k}{y_k}(x) = { - \frac{{{x^3}}}{6}\sum\limits_{i = 1}^k {{F_i}}  - \frac{1}{{24}}{w_k}{{(x - {x_k})}^4} - \frac{{{x^3}}}{6}\sum\limits_{i = 1}^k {{w_{i - 1}}({x_i} - {x_{i - 1}})}  + \frac{{{C_{{1_k}}}{x^2}}}{2} + \frac{{{M_k}{x^2}}}{2} + {C_{{2_k}}}x + {C_{{3_k}}}} \hspace{5mm}\;\\\\\hline
    \end{array}
''')
st.markdown('######')
text = '''
    En las ecuaciones planteadas se observa que existen tres constantes de integración, las cuales junto con las reacciones en los apoyos, 
    actuan como incognitas a despejar; no obstante, 
    la primera de estas constantes de integración, se computa de manera simultanea con la integración de la ecuación de cortantes 
    para el cálculo de la ecuación de momentos, seguiendo el procedimiento que se describe a continuación.
    En concecuencia, el valor de dicha constante se cálcula mediante la siguiente expresión: 
'''
texto(text).create()
st.markdown('######')
col9, col10 = st.columns([1.8, 1], gap = 'small', vertical_alignment = 'center')
with col9:
    st.latex(r'''\scriptsize
        {\begin{array}{c c c c c}\hline
        \\\text{Tramo} & \text{Cortantes} & \text{Momentos} & \text{Sustitucion} & \text{Resultados} \\\\\hline\\
        {{x_1} \to {x_2}}& {{V_1}(x) = \int {{w_1}(x)} } & {{M_0}({x_1}) = \int {{V_1}(x) + {C_{{1_1}}} + {M_1}} } & {x = {x_1}} & {{C_{{1_1}}}} \\
        &   & {{M_1}(x) = \int {{V_1}(x) + {C_{{1_1}}} + {M_1}} } & {x = {x_2}} & {{M_1}({x_2})} \\\\\\
        {{x_2} \to {x_3}} & {{V_2}(x) = \int {{w_2}(x)} } & {{M_1}({x_2}) = \int {{V_2}(x) + {C_{{1_2}}} + {M_2}} } & {x = {x_2}} & {{C_{{1_2}}}} \\              
        &   & {{M_2}(x) = \int {{V_2}(x) + {C_{{1_2}}} + {M_2}} } & {x = {x_3}} & {{M_2}({x_3})} \\
        \vdots & \vdots & \vdots & \vdots & \vdots \\\\ 
        {{x_T} \to {x_{T + 1}}} & {{V_T}(x) = \int {{w_T}(x)} } & {{M_{T - 1}}({x_T}) = \int {{V_T}(x) + {C_{{1_T}}} + {M_T}} } & {x = {x_T}} & {{C_{{1_T}}}} \\          
        &  & {{M_T}(x) = \int {{V_T}(x) + {C_{{1_T}}} + {M_T}} } & {x = {x_{T + 1}}} & {{M_T}({x_{T + 1}})} \\\\\hline
        \end{array}}
        ''')
with col10:
    st.latex(r'''
        {{C_{{1_k}}} = {M_{k - 1}}({x_k}) - \int {{V_k}({x_k}) - {M_k}}}
    ''')
st.markdown('######')
text = '''
    Dado que las reacciones a cálcular dependen del tipo de apoyos presentes en el eje, se puede definir el número de incógnitas por 
    reacciones, en función al número y tipo de apoyos; mientras que el número de constantes de integración a cálcular se puede definir
    a partir del número de tramos del eje. Entonces, si [AS] representa el número de apoyos simples, [AE] representa el número de apoyos 
    elásticos, [AF] representa el número de apoyos fijos y [T] representa el número de tramos del eje, se concluye que:
'''
texto(text).create()
st.markdown('######')
col11, col12 = st.columns([1.8, 1], gap = 'small', vertical_alignment = 'center')
with col11:
    st.markdown('#####')
    st.markdown('+ Número de reacciones a cálcular: $2AS + 3AE + 6AF$')
    st.markdown('+ Número de constantes de integración a cálcular: $4T$')
    st.markdown('+ Número total de incognitas a cálcular: $4T + 2AS + 3AE + 6AF$')
with col12:
    st.latex(r'''\scriptsize
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
st.markdown('######')
text = '''
    En línea con lo anterior, es necesario establecer un sistema de ecuaciones con dimensión igual al numero de incognitas calculado. 
    Las ecuaciones para dicho sistema, se formulan a partir de las condiciones de frontera presentes en cada uno de los apoyos, de las condiciones 
    de continuidad en las ecuaciones analíticas de pendientes y deflexiones, y de las condiciones que establece el equilibrio 
    estático paras las fuerzas y momentos. El sistema de ecuaciones descrito es el siguiente:
'''
texto(text).create()
st.markdown('######')
st.latex(r'''\normalsize
    \begin{array}{c c c}\hline\\
    \text{Condición} & \text{Ecuación} & \text{Número de ecuaciones} \\\\\hline\\ 
    \delta_x=0 & \sum_{i=1}^{T}\frac{F_{x_i}(x_{i+1}-x_i)}{E_iA_i}=0 & AE+AF-1 \\\\\\ 
    \delta_y=0 & y_{(x)_T}=0 & AS+AE+AF \\\\\\ 
    \delta_z=0 & z_{(x)_T}=0 & AS+AE+AF\\\\\\ 
    \theta_x=0 & \sum_{i=1}^{T}\frac{M_{x_i}(x_{i+1}-x_i)}{J_iG_i}=0 & AF-1 \\\\\\ 
    \theta_y=0 & \alpha_{(x)_T}=0 & AF \\\\\\ 
    \theta_z=0 & \beta_{(x)_T}=0 & AF \\\\\\ 
    \delta_{T_2}=\delta_{T+1_1} & y_{(x_2)_T}=y_{(x_1)_{T+1}} & T-1 \\ 
    & z_{(x_2)_T}=z_{(x_1)_{T+1}} & T-1 \\\\\\ 
    \theta_{T_2}=\theta_{T+1_1} & \alpha_{(x_2)_T}=\alpha_{(x_1)_{T+1}} & T-1 \\ 
    & \beta_{(x_2)_T}=\beta_{(x_1)_{T+1}} & T-1 \\\\\\ 
    \sum F_x=0 & \sum_{i=1}^TF_{x_i}=0 & 1\\\\\\ 
    \sum F_y=0 & \sum_{i=1}^{T+1} F_{y_i}+\sum_{i=1}^T w_{y_i}(x_{i+1}-x_i)=0 & 1\\\\\\ 
    \sum F_z=0 & \sum_{i=1}^{T+1} F_{z_i}+\sum_{i=1}^T w_{z_i}(x_{i+1}-x_i)=0 & 1\\\\\\ 
    \sum M_x=0 & \sum_{i=1}^TM_{x_i}=0 & 1\\\\\\ 
    \sum M_y=0 & \sum_{i=1}^{T+1} M_{y_i}+ \sum_{i=1}^{T} x_{i+1}F_{y_{i+1}} + \sum_{i=1}^{T}\frac{w_{y_i}(x_{i+1}-x_i)(x_{i+1}+x_i)}{2}=0& 1\\\\\\ 
    \hspace{3mm} \sum M_z=0 \hspace{3mm} & \hspace{6mm} \sum_{i=1}^{T+1} M_{z_i}+ \sum_{i=1}^{T} x_{i+1}F_{z_{i+1}} + \sum_{i=1}^{T}\frac{w_{z_i}(x_{i+1}-x_i)(x_{i+1}+x_i)}{2}=0 \hspace{6mm} & 1\\\\\hline\\  
    & \text{Número total de ecuaciones } & 4T+2AS+3AE+6AF\\\\\hline
    \end{array}
''')
st.markdown('######')
text = '''
    Dado que el número de ecuaciones que se pueden establecer es igual al número de incógnitas que se deben de calcular, se infiere 
    que, sin importar el tipo o la cantidad de apoyos y cargas presentes, o que las propiedades geométricas y mecánicas varien, 
    siempre será posible calcular todas las reacciones y desplazamientos a los que se encuentre sometido un eje de transmisión de 
    potencia, lo cual valida la metodología de cálculo general de ejes, desarrollada bajo el modelo de Euler y Bernoully.
'''
texto(text).create()
st.markdown('######')
titulo(4, '4.2.2 Cálculo general de las reacciones y desplazamientos (Timoshenko)').create()
text = '''
    Mediante el uso de matrices se pueden cálcular las reacciones y desplazamientos correspondientes a un eje 
    con propiedades geométricas y mecánicas no constantes, bajo la presencia de cualquier cantidad de cargas y apoyos. 
    El procedimiento de cálculo inicia con la formulación de la matriz de rigidez local para cada elemento del eje, para posteriormente 
    ensamblarlas y establecer la matriz de rigidez global, la cual junto con las matrices de cargas y deformaciones, permiten cálcular 
    todas las incognitas, siempre y cuando se hayan pre establecido las condiciones de frontera de manera apropiada, en cada una de las 
    matrices previamente mencionadas.
'''
texto(text).create()
st.markdown('######')
st.latex(r'''\normalsize
    \begin{matrix} \hline\\
    \text{Matriz de } f \text{ y } m & \text{Matriz de rigidez local } k & \text{Matriz de } \delta \text{ y } \theta \\\\ \hline \\
    \begin{bmatrix} \hspace{0.85mm} F_{{1_X}} \hspace{0.85mm} \\ F_{{2_X}} \\ \vdots \end{bmatrix} & \frac{{AE}}{{L}}\begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} & \begin{bmatrix} \hspace{0.25mm} \delta _{{1_X}} \hspace{0.25mm} \\ \delta _{{2_X}} \\ \vdots \end{bmatrix} \\ \\
    \begin{bmatrix} M_{{1_X}} \\ M_{{2_X}} \\ \vdots \end{bmatrix} & \frac{{JG}}{{L}}\begin{bmatrix} 1 & -1 \\ -1 & 1 \end{bmatrix} & \begin{bmatrix} \theta _{{1_X}} \\ \theta _{{2_X}} \\ \vdots \end{bmatrix} \\ \\
    \begin{bmatrix} \hspace{1.6mm} F_1 \hspace{1.6mm} \\ M_1 \\ F_2 \\ M_2 \\ \vdots \end{bmatrix} & \frac{{EI}}{{L^3(1 + \varphi)}}\begin{bmatrix} 12 & 6L & -12 & 6L \\ 6L & (4 + \varphi)L^2 & -6L & (2 - \varphi)L^2 \\ -12 & -6L & 12 & -6L \\ 6L & (2 - \varphi)L^2 & -6L & (4 + \varphi)L^2 \end{bmatrix} & \begin{bmatrix} \hspace{1mm} \delta _1 \hspace{1mm} \\ \theta _1 \\ \delta _2 \\ \theta _2 \\ \vdots \end{bmatrix} \\\\\hline
    \end{matrix}
''')
st.markdown('######')
text = '''
    A diferencia de la teoría de Euler y Bernoulli, la teoría de Timoshenko toma en cuenta los efectos de las cargas cortantes 
    por medio del coeficiente 𝜑, el cual se cálcula con:
'''
texto(text).create()
st.markdown('######')
st.latex(r'\varphi=\frac{12EI}{K_sAGL^2}')
st.markdown('######')
text = '''
    En esta ecuacíon aparece un nuevo termino conocido como factor de area, el cual depende del area de la sección del eje de transmisión y se computa 
    mediante la siguiente expresión: 
'''
texto(text).create()
st.markdown('######')
st.latex(r'K_s=\frac{6(1+\nu)(1+m^2)^2}{(7+6\nu)(1+m^2)^2+(20+12\nu)m^2} \quad\quad\quad\quad \text{Donde:} \quad m = \frac{r}{R} \quad \text{y} \quad v = \text{Coeficiente de Poisson [0.3]}')
st.markdown('######')
with st.expander('Demostración práctica: Modelo de cálculo de Euler-Bernoulli vs modelo de cálculo de Timoshenko', expanded = False):
    url = 'https://py.cafe/embed/junior19a2000/minishaftdesignerapp'
    st.markdown(f'<iframe src={url} height="650" width="100%" style="border: 1px solid #e6e6e6; border-radius: 10px;";></iframe>', unsafe_allow_html = True)

titulo(4, '4.2.3 Análisis estático').create()
text = '''
    El módulo de ejes tiene como objetivo calcular los resultados mas críticos en todo el dominio del eje, por lo que resulta 
    necesario, establecer un elemento en específico para cada punto de análisis, en el cual estén presentes dichos resultados. 
    A priori, teniendo en cuenta las ecuaciones para el cálculo de los esfuerzos, se infiere que tal elemento 
    se encontrara en el contorno de la sección que se analice, no obstante, analizar todos los elementos del contorno de la 
    sección para determinar cual es el más crítico, se traduce en un elevado costo computacional y tiempo; por lo que es 
    imprescindible definir con antelación cual será el elemento a analizar, lo cual no implica necesariamente 
    que se deba conocer su posición exacta. 
'''
texto(text).create()
st.markdown('######')
col13, col14 = st.columns([2.8, 1], gap = 'small', vertical_alignment = 'center')
with col13:
    st.image(img3)
with col14:
    st.image(img4)
st.markdown('######')
texto('Los esfuerzos que se analizaran en dicho elemento son:').create()
st.markdown('#####')
st.latex(r'\sigma_x=\frac{F_x}{A} \quad \sigma_y=\frac{M_yR}{I} \quad \sigma_z=\frac{M_zR}{I} \quad \tau_x=\frac{M_xR}{J} \quad \tau_y=\frac{F_yQ}{It} \quad \tau_z=\frac{F_zQ}{It}')
st.markdown('#####')
texto('Las propiedades geómetricas para un eje de transmisión hueco se calculan con:').create()
st.markdown('#####')
st.latex(r'A=\pi (R^2-r^2) \quad J = \frac{\pi (R^4 - r^4)}{2} \quad I = \frac{\pi (R^4 - r^4)}{4} \quad Q=\frac{2(R^3 - r^3)\sin^3\alpha}{3} \quad t = 2(R - r)\sin\alpha')
st.markdown('#####')
texto('Particularmente, los esfuerzos flexionantes correspondientes a un elemento en el contorno de la sección se computan con:').create()
st.markdown('#####')
st.latex(r'\sigma_y=\frac{4M_yR\cos\alpha}{\pi (R^4-r^4)} \quad \sigma_z=\frac{4M_zR\cos\beta}{\pi (R^4-r^4)}')
st.markdown('#####')
texto('Asi mismo, los esfuerzos cortantes correspondientes a un elemento en el contorno de la sección se computan con:').create()
st.markdown('#####')
st.latex(r'\tau_y=\frac{4F_y(R^2+Rr+r^2)\sin^2\beta}{3\pi (R^4-r^4)} \quad \tau_z=\frac{4F_z(R^2+Rr+r^2)\sin^2\alpha}{3\pi (R^4-r^4)}')
st.markdown('######')
texto('En conjunto, los esfuerzos normales y cortantes respectivamente, se calculan con las siguientes ecuaciones:').create()
st.markdown('######')
col15, col16 = st.columns([1, 1], gap = 'medium', vertical_alignment = 'center')
with col15:
    st.latex(r'\sigma_{yz}=\frac{4R(M_y\sin\beta + M_z\cos\beta)}{\pi (R^4-r^4)}')
    st.latex(r'\tau_{yz}=\frac{4(R^2+Rr+r^2)(F_y\sin^2\beta +F_z\cos^2\beta)}{3\pi (R^4-r^4)}')
with col16:
    st.image(img5, use_column_width = True)
st.markdown('######')
texto('El elemento a analizar sera aquel en el cual este presente el esfuerzo flector máximo:').create()
st.markdown('#####')
st.latex(r'\frac{d\sigma_{yz}}{d\beta}=0 \hspace{5mm} M_y\cos\beta-M_z\sin\beta = 0 \hspace{5mm} \beta=\arctan \frac{M_y}{M_z}')
st.markdown('#####')
texto('Finalmente, los esfuerzos que se analizaran en dicho elemento se establecen como:').create()
st.markdown('#####')
st.latex(r'\sigma_{\text{flexionante}} = \sigma_{yz} \quad \tau_{\text{cortante}} = \tau_{yz} \quad \sigma_{\text{axial}} = \sigma_x \quad \tau_{\text{torsional}} = \tau_x')
st.markdown('#####')
text = '''
    Ahora bien, para determinar el valor del esfuerzo máximo al cual estará sometido el elemento seleccionado, es necesario tomar en 
    cuenta el sentido de los esfuerzos previamente establecidos de manera conjunta. Al respecto, se puede afirmar que, 
    siempre existirá un caso en el cual los esfuerzos normales y transversales tendrán la misma orientación, aunque no 
    necesariamente de manera simultánea.
'''
texto(text).create()
st.markdown('######')
col17, col18 = st.columns([1, 1], gap = 'medium', vertical_alignment = 'center')
with col17:
    st.latex(r'''
        \begin{array}{ccc}\hline\\
        \text{Normales coinciden} & \text{Transversales coinciden}\\\\\hline\\
        \sigma_{\text{n}}=\sigma_{\text{flexionante}}+\sigma_{\text{axial}} & \sigma_{\text{n}}=\sigma_{\text{flexionante}}\pm\sigma_{\text{axial}}\\
        \tau_{\text{t}}=\tau_{\text{torsional}}\pm\tau_{\text{cortante}} & \tau_{\text{t}}=\tau_{\text{torsional}}+\tau_{\text{cortante}}\\\\\hline
        \end{array}
    ''')
with col18:
    st.image(img6, use_column_width = True)
st.markdown('######')
texto('Considerando un enfoque conservador, los esfuerzos normales y transversales combinados se calculan con las siguientes ecuaciones:').create()
st.markdown('#####')
st.latex(r'\sigma_{\text{n}}=\sigma_{\text{flexionante}}+\sigma_{\text{axial}}')
st.latex(r'\tau_{\text{t}}=\tau_{\text{torsional}}+\tau_{\text{cortante}}')
st.markdown('#####')
text = '''
    Dado que se está incurriendo en un error voluntario, se ha comparado el error de considerar al esfuerzo cortante con el 
    error de ignorarlo, en el cálculo de los esfuerzos combinados bajo el criterio de Von Mises, al ser dicho criterio el más 
    usado para el diseño de ejes. De las gráficas de la derecha, se aprecia que, en promedio, para ambos casos previamente 
    descritos, el error es muy similar, es decir, que a pesar de estar considerando a los esfuerzos cortantes en el cálculo 
    del esfuerzo de Von Mises, esto no ha significado un incremento considerable en el error en el que se incurría al 
    ignorarlos para dicho cálculo. Por otra parte, se advierte que cuando la relación entre el esfuerzo torsional y el 
    esfuerzo cortante es mayor a 20 (lo cual sucede casi siempre), el error en el cálculo del esfuerzo de Von Mises 
    disminuye por debajo del 10% a medida que dicha relación se incrementa.
'''
texto(text).create()
st.markdown('#####')
button1 = st.button('Comparar escenarios', use_container_width = True, type = "primary")
data1, data2 = error()
col19, col20 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
with col19:
    st.line_chart(data1, y_label = 'Esfuerzo de Von Mises', color = ['#000000', '#999999'], use_container_width = True)
    text = '''
        En línea con lo anterior y considerando 
        a los factores de concentración de esfuerzos estáticos, el cálculo del esfuerzo máximo 
        combinado, bajo tres tipos de criterios de falla, se efectúa mediante las siguientes expresiones:
    '''
    texto(text).create()
    st.markdown('#####')
    st.latex(r'\sigma_{k} = K_{f}\sigma_{\text{flexionante}} + K_{a}\sigma_{\text{axial}}')
    st.latex(r'\tau_{k} = K_{t}\tau_{\text{torsional}} + \tau_{\text{cortante}}')
with col20:   
    st.line_chart(data2, y_label = 'Esfuerzo torsional / Esfuerzo cortante', color = ['#000000', '#999999'], use_container_width = True)
    st.latex(r'''
        \begin{array}{c c}\hline\\
        \text{Criterio de falla estático} & \text{Ecuación}\\\\\hline\\
        \text{Von Mises} & \sqrt{\sigma_{\text{k}}^{2}+3\tau_{\text{k}}^{2}}\\\\
        \text{Tresca} & \sqrt{\sigma_{\text{k}}^{2}+4\tau_{\text{k}}^{2}}\\\\
        \text{Rankine} & \frac{1}{2}(\sigma_{\text{k}}+\sqrt{\sigma_{\text{k}}^{2}+4\tau_{\text{k}}^{2}})\\\\\hline
    \end{array}
    ''')
st.markdown('#####')
titulo(4, '4.2.4 Análisis dinámico').create()  
text = '''
    En los ejes de transmisión de potencia, algunos de los esfuerzos que actúan sobre este fluctúan en relación al tiempo, 
    debido al comportamiento de las cargas que los generan. Si se analiza al elemento seleccionado, en su recorrido alrededor 
    del contorno circular del eje, se entiende que, 
    para el caso de los esfuerzos axiales y torsionales, estos presentan un comportamiento constante, es decir que, tanto 
    su magnitud como sentido no se alteran a medida que el eje da un giro entero. En contraste, 
    para el caso de los esfuerzos flexionantes y cortantes, estos presentan un comportamiento fluctuante, dado que tanto 
    su magnitud como sentido se alteran a medida que el eje de un giro entero sobre su propio eje.
'''  
texto(text).create()
st.markdown('#####')
button2 = st.button('Visualizar fluctuaciones', use_container_width = True, type = "primary")
data1, data2 = dinamico()
col21, col22 = st.columns([1, 1], gap = 'medium', vertical_alignment = 'center')
with col21:
    st.line_chart(data1, x = 'Radianes', y = ['Solo en Y', 'Solo en Z', 'Esfuerzo combinado'], x_label = '', y_label = 'Esfuerzo flexionante', color = ['#151f2e', '#8a8f96', '#e7e8ea'], use_container_width = True)
with col22:   
    st.line_chart(data2, x = 'Radianes', y = ['Solo en Y', 'Solo en Z', 'Esfuerzo combinado'], x_label = '', y_label = 'Esfuerzo cortante', color = ['#151f2e', '#8a8f96', '#e7e8ea'], use_container_width = True)
text = '''
    Considerando lo previamente expuesto, 
    se establecen las siguientes ecuaciones en relación a los componentes medio y alternante para cada uno de los esfuerzos 
    presentes en el eje:
'''
texto(text).create()
st.markdown('#####')
st.latex(r'''
    \begin{array}{c c c} \hline \\
    \text{Esfuerzo} & \text{Componente medio} & \text{Componente alternante}  \\\\\hline\\
    \text{Axial} & \sigma_{\text{axial}} & 0  \\ \\\\
    \text{Torsional} & \tau_{\text{torsional}} & 0  \\ \\\\
    \text{Flexionante} & 0 & \sigma_{\text{flexionante}}  \\ \\\\
    \text{Cortante} & \hspace{3.5mm} \frac{{\tau_{\text{cortante máximo}} + \tau_{\text{cortante mínimo}}}}{2} \hspace{3mm} & \hspace{3mm} \frac{{\tau_{\text{cortante máximo}} - \tau_{\text{cortante mínimo}}}}{2} \hspace{3.5mm} \\ \\\hline
    \end{array}
''')
st.markdown('#####')
text = '''
    A diferencia de los esfuerzos flexionantes, los esfuerzos cortantes no presentan un comportamiento sinusoidal completamente 
    invertido, lo cual conlleva a que para este caso, se deban cálcular los valores máximos y mínimos para dicha función:
'''
texto(text).create()
st.markdown('#####')
st.latex(r'\frac{{d{\tau _{yz}}}}{{d\beta }} = 0 \quad 2\sin \beta \cos \beta ({F_y} - {F_z}) \quad \beta = \frac{{k\pi }}{2} \rightarrow k = \mathbb{N}')
st.markdown('#####')
texto('De conformidad con el resultado anterior, se obtiene que los valores máximo y mínimo de la función del esfuerzo cortante son:').create()
st.markdown('#####')
st.latex(r'{\tau _{{\text{cortante máximo}}}} = \frac{{4({R^2} + Rr + {r^2})\max ([{F_y},{F_z}])}}{{3\pi ({R^4} - {r^4})}}')
st.latex(r'{\tau _{{\text{cortante mínimo}}}} = \frac{{4({R^2} + Rr + {r^2})\min ([{F_y},{F_z}])}}{{3\pi ({R^4} - {r^4})}}')
st.markdown('#####')
texto('En consecuencia, los componentes de los esfuerzos medio y alternante de los esfuerzos cortantes se establecen como:').create()
st.markdown('#####')
st.latex(r'{\tau _{{\text{medio cortante}}}} = \frac{{2({R^2} + Rr + {r^2})({F_y} + {F_z})}}{{3\pi ({R^4} - {r^4})}}')
st.latex(r'{\tau _{{\text{alternante cortante}}}} = \frac{{2({R^2} + Rr + {r^2})({F_y} - {F_z})}}{{3\pi ({R^4} - {r^4})}}')
st.markdown('#####')
texto('Por lo expuesto, los esfuerzos medio y alternante para cada uno de los esfuerzos analizados se definen mediante las siguientes expresiones:').create()
st.markdown('#####')
st.latex(r'''
    \begin{array}{c c c} \hline \\
    \text{Esfuerzo} & \text{Componente medio} & \text{Componente alternante} \\ \\\hline\\
    \text{Axial} & \sigma _{{m_a}} = \sigma _{{\text{axial}}} & \sigma _{{a_a}} = 0 \\ \\\\
    \text{Torsional} & \tau _{{m_t}} = \tau _{{\text{torsional}}} & \tau _{{a_t}} = 0 \\ \\\\
    \text{Flexionante} & \sigma _{{m_f}} = 0 & \sigma _{{a_f}} = \sigma _{{\text{flexionante}}} \\ \\\\
    \hspace{4.5mm} \text{Cortante} \hspace{4mm} & \hspace{3.5mm} \tau _{{m_c}} = \tau _{{\text{medio cortante}}} \hspace{3.5mm} & \hspace{3.5mm} \tau _{{a_c}} = \tau _{{\text{alternante cortante}}} \hspace{4mm} \\ \\\hline
    \end{array}
''')
st.markdown('#####')
text = '''
    Con los valores de los esfuerzos medios y alternante ya calculados para cada uno de los esfuerzos presentes en el eje de 
    manera individual, se pueden calcular los esfuerzos medio y alternante de los esfuerzos combinados bajo los criterios de 
    falla utilizados en el análisis estático. Considerando a los factores de concentración de los esfuerzos dinámicos, dichos esfuerzos son:
'''
texto(text).create()
st.markdown('#####')
st.latex(r'''
    \text{Von Mises}\left\{ \begin{array}{c}
    \sigma_a = \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 3\tau_{a_c}^2 \right]^{\frac{1}{2}} \\
    \sigma_m = \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 3{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}}
    \end{array} \right.
''')
st.latex(r'''
    \text{Tresca}\left\{ \begin{array}{c}
    \sigma_a = \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 4\tau_{a_c}^2 \right]^{\frac{1}{2}} \\
    \sigma_m = \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 4{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}}
    \end{array} \right.
''')
st.latex(r'''
    \text{Rankine}\left\{ \begin{matrix}
    \sigma_a = 0.5\left\{ ({K_{f_f}}\sigma_{a_f}) + \left[ {{{({K_{f_f}}\sigma_{a_f}})}^2} + 4\tau_{a_c}^2 \right]^{\frac{1}{2}} \right\}  \\
    \sigma_m = 0.5\left\{ ({K_{f_a}}\sigma_{m_a}) + \left[ {{{({K_{f_a}}\sigma_{m_a}})}^2} + 4{{({K_{f_t}}\tau_{m_t}} + \tau_{m_c})}^2 \right]^{\frac{1}{2}} \right\}
    \end{matrix} \right.
''')
st.markdown('#####')
texto('Finalmente, los esfuerzos dinámicos se calculan en base al criterio de falla estático que se considere conveniente y bajo los siguientes criterios de falla dinámicos:').create()
st.markdown('#####')
st.latex(r'''
    {\text{Soderberg}}:\quad \frac{{{\sigma _a}}}{{{{\text{S}}_e}}}{\text{ + }}\frac{{{\sigma _m}}}{{{{\text{S}}_y}}}{\text{ = }}\frac{{\text{1}}}{n}
''')
st.latex(r'''
    {\text{Goodman}}:\quad \frac{{{\sigma _a}}}{{{{\text{S}}_e}}}{\text{ + }}\frac{{{\sigma _m}}}{{{{\text{S}}_u}}}{\text{ = }}\frac{{\text{1}}}{n}
''')
st.latex(r'''
    {\text{ASME}}:\quad {\left( {\frac{{{\sigma _a}}}{{{{\text{S}}_e}}}} \right)^2}{\text{ + }}{\left( {\frac{{{\sigma _m}}}{{{{\text{S}}_y}}}} \right)^2}{\text{ = }}\frac{{\text{1}}}{{{n^{\text{2}}}}}
''')
st.markdown('#####')
titulo(4, '4.2.5 Análisis de rigidez').create() 
texto('Las deformaciones lineales y angulares resultantes, se calculan haciendo uso de las deflexiones y pendientes ya calculadas, por medio de las siguientes ecuaciones:').create()
st.markdown('#####')
st.latex(r'\delta_{\text{resultante}} = \sqrt{\delta _x^2 + \delta _y^2 + \delta _z^2} \quad\quad \theta_{\text{resultante}}     = \sqrt {\theta _x^2 + \theta _y^2 + \theta _z^2}')
st.markdown('#####')
titulo(4, '4.2.6 Análisis de vida').create() 
texto('Para determinar si el eje de transmisión es de vida infinita o en su defecto, cálcular el número de ciclos a los cuales este fallara, se hace uso de la Curva de Wöhler. Para este último caso, el tiempo de vida se calcula con:').create()
st.latex(r'\text{Horas de vida} = \frac{N}{\text{revoluciones por minuto x 60}} \quad\quad \text{donde:} \quad N = \left\{\frac{\sigma _{\text{dinamico maximo}}}{10^{\left[\log( 0.9S_{u}) -\frac{3}{3-\log( N_{2})}\log\left(\frac{0.9S_{u}}{S_{e}}\right)\right]}}\right\}^{\left[\frac{1}{\frac{1}{3-\log( N_{2})}\log\left(\frac{0.9S_{u}}{S_{e}}\right)}\right]}')
st.markdown('#####')
titulo(4, '4.2.7 Análisis vibracional').create() 
texto('El cálculo de los límites del rango de operación en el cual estará situada la velocidad critica fundamental del eje de transmisión de potencia, se efectúa siguiendo las ecuaciones de Rayleigh y Ritz:').create()
st.markdown('#####')
st.latex(r'\text{Límite inferior: } \frac{30}{\pi}\sqrt{\frac{g}{\max(\delta_{\text{resultante}})}} \quad < \quad \text{Velocidad crítica fundamental} \quad < \quad \text{Límite superior: } \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T {m_i y_i}}{\sum\limits_{i = 1}^T {m_i y_i^2}}}')
st.markdown('#####')
text = '''
    Para el cálculo del límite superior, resulta necesario primeramente dividir al eje en sectores, luego calcular la masa de cada uno 
    de ellos y finalmente determinar la deflexión en el punto medio de cada uno de estos sectores. Una vez calculados estos valores, 
    recién se puede hallar el valor deseado, sin embargo, la precisión de este resultado depende del número de divisiones del eje, lo 
    cual significa que, a mayor número de divisiones, mayor precisión en el resultado, sin embargo, esto a su vez implica mayores cálculos 
    debido a los pasos comentados previamente. Teniendo en cuenta lo anterior, se ha visto por conveniente modificar la ecuación en cuestión, 
    de la siguiente manera:
'''
texto(text).create()
st.markdown('#####')
st.latex(r'''
    \text{Límite superior:}\quad \text{RPM} = \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T {\sum\limits_{j = 1}^n {m_{i_j} y_{i_j}} }}{\sum\limits_{i = 1}^T {\sum\limits_{j = 1}^n {m_{i_j} y_{i_j}^2} } }}
''')
st.markdown('#####')
texto('Llevando al límite el número de divisiones del eje y reemplazando el valor de la masa correspondiente a cada una de estas divisiones:').create()
st.markdown('#####')
st.latex(r'''
    \sum\limits_{j = 1}^n {m_j y_j} = \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta m_j \cdot y_j = \rho A \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta x_j \cdot y_j = \rho_T A_T \int y_T dx
''')
st.latex(r'''
    \sum\limits_{j = 1}^n {m_j y_j^2} = \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta m_j \cdot y_j^2 = \rho A \lim_{{n \to \infty}} \sum\limits_{j = 1}^n \Delta x_j \cdot y_j^2 = \rho_T A_T \int y_T^2 dx
''')
st.markdown('#####')
texto('Finalmente, reemplazando en la ecuación inicial, el limite superior se computa con:').create()
st.markdown('#####')
st.latex(r'''
    \text{Límite superior:}\quad \text{RPM} = \frac{30}{\pi}\sqrt{g\frac{\sum\limits_{i = 1}^T \rho_i A_i \int y_i dx}{\sum\limits_{i = 1}^T \rho_i A_i \int y_i^2 dx}}
''')
st.markdown('#####')
text = '''
    Esta ecuación ofrece un resultado más preciso, dado que el número de divisiones se ha elevado al infinito, lo cual ha 
    permitido convertir las sumatorias en integrales, y que, por otra parte, resulta conveniente en este caso, toda vez que las deflexiones 
    en el eje han sido calculadas mediante funciones analíticas y numéricas que se pueden integrar de manera rápida y precisa.
'''
texto(text).create()
st.markdown('######')
with st.expander('Demostración práctica: Ecuación de Rayleigh modificada', expanded = False):
    url = 'https://py.cafe/embed/junior19a2000/critica'
    st.markdown(f'<iframe src={url} height="650" width="100%" style="border: 1px solid #e6e6e6; border-radius: 10px;";></iframe>', unsafe_allow_html = True)

titulo(3, '4.3 Elementos bidimensionales').create()
text = '''
    Se utilzan elementos triangulares de deformación constante (CST), donde cada uno de estos estará definido geométricamente por tres pares 
    de coordenadas, a partir de los cuales se pueden establecer las siguientes expresiones:
'''
texto(text).create()
st.markdown('######')
st.latex(r'\begin{align*} \beta_i=y_j-y_m \hspace{0.6cm}& \beta_j=y_m-y_i \hspace{0.3cm}& \beta_m=y_i-y_j\\ \gamma_i=x_m-x_j \hspace{0.6cm}& \gamma_j=x_i-x_m \hspace{0.3cm}& \gamma_m=x_j-x_i\\ \end{align*}')
st.markdown('######')
text = '''
    Ahora bien, considerando estas expresiones junto con el área, el módulo de elasticidad y el coeficiente de Poisson correspondientes a 
    cada uno de los elementos, se describen las siguientes matrices:
'''
texto(text).create()
st.markdown('######')
st.latex(r'[B]=\frac{1}{2A}\begin{bmatrix} \beta_i & 0 & \beta_j & 0 & \beta_m & 0 \\ 0 & \gamma_i & 0 & \gamma_j & 0 & \gamma_m \\ \gamma_i & \beta_i & \gamma_j & \beta_j & \gamma_m & \beta_m \\ \end{bmatrix} \quad [D] = \frac{E}{1-v^2}\begin{bmatrix} 1 & v & 0 \\ v & 1 & 0 \\ 0 & 0 & \frac{1-v}{2} \\ \end{bmatrix}')
st.markdown('######')  
texto('A partir de estas y considerando el espesor de cada elemento, se puede formular la matriz de rigidez respectiva mediante la siguiente ecuación:').create()
st.markdown('######')
st.latex(r'[k]=tA[B]^T[D][B]')
st.markdown('######')
text = '''
    Con las matrices de rigidez individuales se plantea la matriz de rigidez global, la cual, junto con las matrices de fuerzas y desplazamientos, 
    se redimensionan en base a las condiciones de frontera, para posteriormente resolver el sistema general y determinar asi, las reacciones y desplazamientos 
    en cada nodo de la malla, lo cual asu vez, permite calcular los esfuerzos en cada elemento de la malla, mediante las siguientes expresiones:
'''
texto(text).create()
st.markdown('######')
st.latex(r'[F]=[K][d] → [\sigma_x, \sigma_y, \tau_{xy}] = [D][B][d]')
st.markdown('######')
with st.expander('Demostración práctica: Algoritmos de mallado', expanded = False):
    url = 'https://py.cafe/embed/junior19a2000/mallado'
    st.markdown(f'<iframe src={url} height="650" width="100%" style="border: 1px solid #e6e6e6; border-radius: 10px;";></iframe>', unsafe_allow_html = True)

