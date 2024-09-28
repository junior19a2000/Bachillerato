import streamlit as st
from streamlit_flow import streamlit_flow as flow
from streamlit_flow.elements import StreamlitFlowNode as node
from streamlit_flow.elements import StreamlitFlowEdge as edge
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
class flowchart:
    def __init__(self, entrada, blackbox, salida, key):
        self.entrada = entrada
        self.blackbox = blackbox
        self.salida = salida
        self.key = key
    def create(self):
        nodes = [
            node(id='1', pos=(-400, 450), data={'content': self.entrada}, node_type='input', source_position='right', draggable=False, width = 380, height = 130),
            node('2', (50, 450), {'content': self.blackbox}, node_type='default', source_position='right', target_position='left', draggable=False, width = 380, height = 130),
            node('3', (500, 450), {'content': self.salida}, node_type='output', target_position='left', draggable=False, width = 380, height = 130),
        ]
        edges = [
            edge('1-2', '1', '2', animated=True, edge_type='step'),
            edge('2-3', '2', '3', animated=True, edge_type='step'),
        ]
        flowchart = flow(
            self.key,
            nodes,
            edges,
            fit_view=True,
            show_minimap=False,
            show_controls=False,
            pan_on_drag=True,
            allow_zoom=True,
            hide_watermark=True,
            height=200,
        )        
        return flow

@st.cache_data()
def load_resources(load):
    img1 = Image.open(r'Imagenes/ml.png').resize((290, 290))
    img2 = Image.open(r'Imagenes/gh.png').resize((290, 290))
    img3 = Image.open(r'Imagenes/pstcapp.png').resize((450, 290))
    return img1, img2, img3
img1, img2, img3 = load_resources('load')

titulo(2, '3. Marco teórico').create()

titulo(3, '3.1 Correas planas').create()
text = '''
    Se analizan bajo la metodología desarrollada por la empresa Forbo, la cual, mediante datos de entrada 
    conocidos como la potencia y revoluciones del motor, los diámetros de las poleas y la distancia entre 
    las mismas, permite calcular las dimensiones del tipo de correa elegida junto con las fuerzas que se 
    transmitirán al eje de transmisión de potencia.
'''
texto(text).create()
entrada = r'''
    INPUTS

    1. Potencia
    2. RPM
    3. Diametro de las poleas
    4. Distancia entre las poleas
'''
blackbox = r'''
    BLACKBOX
    
    1. Ángulos de contacto
    2. Velocidad de la correa
    3. Factores
    4. Perfil de la correa
'''
salida = r'''
    OUTPUTS
    
    1. Dimensiones de la correa
    2. Frecuencia de exitación
    3. Fuerzas sobre el eje
    4. Momentos sobre el eje
'''
flowchart(entrada, blackbox, salida, '1').create()
titulo(3, '3.2 Correas trapezoidales').create()
text = '''
    Se analizan bajo la metodología desarrollada por la empresa Optibelt, la cual, mediante datos de 
    entrada conocidos como la potencia y revoluciones del motor, los diámetros de las poleas y la distancia 
    entre las mismas, permite calcular el número de correas a emplear, las dimensiones del tipo de correa 
    elegida junto con las fuerzas que se transmitirán al eje de transmisión de potencia.
'''
texto(text).create()
entrada = r'''
    INPUTS

    1. Potencia
    2. RPM
    3. Diametro de las poleas
    4. Distancia entre las poleas
'''
blackbox = r'''
    BLACKBOX
    
    1. Ángulos de contacto
    2. Velocidad de la correa
    3. Factores
    4. Perfil de la correa
'''
salida = r'''
    OUTPUTS
    
    1. Dimensiones de la correa
    2. Número de correas
    3. Fuerzas sobre el eje
    4. Momentos sobre el eje
'''
flowchart(entrada, blackbox, salida, '2').create()
titulo(3, '3.3 Cadenas de rodillos').create()
text = '''
    Se analizan bajo la metodología desarrollada por la empresa Renold, la cual, mediante datos de entrada 
    conocidos como la potencia y revoluciones del motor, el número de dientes de los sprokets y la distancia 
    entre los mismos, permite calcular el número de cadenas a emplear, las dimensiones del tipo de cadena 
    elegida junto con las fuerzas que se transmitirán al eje de transmisión de potencia.
'''
texto(text).create()
entrada = r'''
    INPUTS

    1. Potencia
    2. RPM
    3. Dientes de los sprockets
    4. Distancia entre los sprockets
'''
blackbox = r'''
    BLACKBOX
    
    1. Ángulos de contacto
    2. Velocidad de la cadena
    3. Factores
    4. Perfil de la cadena
'''
salida = r'''
    OUTPUTS
    
    1. Dimensiones de la cadena
    2. Número de cadenas
    3. Fuerzas sobre el eje
    4. Momentos sobre el eje
'''
flowchart(entrada, blackbox, salida, '3').create()
titulo(3, '3.4 Engranajes').create()
text = '''
    Se analizan bajo la norma ANSI / AGMA 2101-D04, en la cual se definen cuatro tipos de fallas, 
    de las cuales las más importantes son la falla por picadura y la falla por flexión. La aplicación permite el cálculo 
    de los siguientes tipos de engranajes:
'''
texto(text).create()
text = '''
<br>1. Engranajes rectos
<br>2. Engranajes helicoidales y bihelicoidales
<br>3. Engranajes conicos rectos
'''
texto(text).create()
st.markdown('#####')
texto('Los cálculos se realizan aplicando las siguientes ecuaciones:').create()
st.markdown('#####')
st.latex(r'\begin{array}{ccc} \hline \\ & \text{Falla por picadura} & \text{Falla por flexión} \\ \\ \hline \\ \text{Esfuerzo} & \sigma_h = Z_e\sqrt{\frac{F_t K_o K_v K_s K_h Z_r}{d_{w1}bZ_i}} & \sigma_f = \frac{F_t K_o K_v K_s K_h K_b}{bm_t Y_j} \\\\ \text{Esfuerzo admisible} & \sigma_{ha} = \frac{\sigma_{hp}Z_n Z_w}{S_h Y_\theta Y_z} & \sigma_{fa} = \frac{\sigma_{fp}Y_n}{S_f Y_\theta Y_z} \\\\ \text{Potencia} & P_{az} = \frac{\pi \omega_1 bZ_i}{6.10^7 K_o K_v K_s K_h Z_r}\left(\frac{d_{w1} \sigma_{hp} Z_n Z_w}{Z_e S_h Y_\theta Y_z}\right)^2 & P_{ay} = \frac{\pi \omega_1 d_{w1} b m_t Y_j \sigma_{fp} Y_n}{6.10^7 K_o K_v K_s K_h K_b S_f Y_\theta Y_z} \\\\ \hline \end{array}')
st.markdown('#####')
titulo(3, '3.5 Ejes de transmisión de potencia').create()
text = '''
    Euler-Bernoulli: No toma en cuenta los efectos de las fuerzas cortantes 
    en la deformación del eje, por lo que resulta adecuada para ejes largos (L/D>10).
    <br>Timoshenko: Toma en cuenta los efectos de las fuerzas cortantes 
    en la deformación del eje, por lo que resulta adecuada para ejes cortos (L/D<10).     
'''
texto(text).create()
st.markdown('#####')
st.latex(r'\begin{array}{ccccc} \hline \\ \text{Análisis estático} & \text{Análisis dinámico} & \text{Análisis vibracional} & \text{Análisis de rigidez} & \text{Análisis de vida} \\\\ \hline \\ \text{Von Misses} & \text{Soderberg} & \text{Dunkerley} & \text{Pendientes} & \text{Wohler}\\\\ \text{Tresca} & \text{Goodman} & \text{Rayleigh} & \text{Deflexiones} \\\\ \text{Rankine} & \text{ASME} & & \\\\ \hline \end{array}')               
st.markdown('#####')
titulo(3, '3.6 Teoría de los elementos finitos').create()
text = '''
    La idea básica del método de los elementos finitos consiste en discretizar el dominio del problema en sub-regiones, en las cuales, 
    las ecuaciones en derivadas parciales siguen siendo totalmente válidas y calculables, empleando para ello una aproximación polinomial.
    La discretizacion consiste en convertir las ecuaciones de derivadas parciales complejas en sistemas de ecuaciones lineales que 
    pueden ser resueltas por medios computacionales. Una parte de esos sistemas de ecuaciones se denomina matriz de rigidez, la cual 
    contiene las propiedades físicas de los elementos que conforman el fenómeno físico. La forma de la matriz de rigidez 
    depende del tipo de elemento a analizar y pueden ser del tipo local y global. De manera general, la matriz de rigidez local se puede 
    escribir como:
'''
texto(text).create()
st.markdown('#####')
st.latex(r'[f]=[k][d]')
st.markdown('#####')
texto('La matriz de rigidez global, la cual representa el conjunto ensamblado de todas las matrices de rigidez local, se define como:').create()
st.markdown('#####')
st.latex(r'[F]=[K][d]')
st.markdown('#####')
text = '''
    Esta última, sin importar el tipo de elemento a analizar, presenta las siguientes propiedades:</br>
    <br>•Es cuadrada, ya que relaciona un número equivalente tanto de fuerzas como de desplazamientos.</br>
    •Es simétrica, para todos los elementos que comprende.</br>
    •Es singular, por lo que no posee inversa hasta que se le aplique las suficientes condiciones de frontera. </br>
'''
texto(text).create()
st.markdown('#####')
titulo(3, '3.7 Matlab & GitHub').create()
text = '''
    App Designer es un entorno de desarrollo interactivo para diseñar una aplicación y
    programar su comportamiento. Proporciona una versión totalmente integrada del editor de
    MATLAB® y un gran conjunto de componentes interactivos de la IU. Así mismo, su integración
    con GitHub permite compartir las aplicaciones desarrolladas de manera gratuita y con los
    requerimientos mínimos para su uso.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([3, 1, 3, 1, 5], gap = 'small', vertical_alignment = 'center')
with col1:
    st.image(img1, use_column_width = True)
with col2:
    st.latex(r'\Huge +')
with col3:
    st.image(img2, use_column_width = True)
with col4:
    st.latex(r'\Huge =')
with col5:
    st.image(img3, use_column_width = True)