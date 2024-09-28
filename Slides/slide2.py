import streamlit as st
from PIL import Image, ImageDraw

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

def add_corners(im):
    rad = 35
    circle = Image.new('L', (rad * 2, rad * 2), 0)
    draw = ImageDraw.Draw(circle)
    draw.ellipse((0, 0, rad * 2 - 1, rad * 2 - 1), fill=255)
    alpha = Image.new('L', im.size, 255)
    w, h = im.size 
    alpha.paste(circle.crop((0, 0, rad, rad)), (0, 0))
    alpha.paste(circle.crop((0, rad, rad, rad * 2)), (0, h - rad))
    alpha.paste(circle.crop((rad, 0, rad * 2, rad)), (w - rad, 0))
    alpha.paste(circle.crop((rad, rad, rad * 2, rad * 2)), (w - rad, h - rad))
    im.putalpha(alpha)
    return im
def edit_image(image):
    return add_corners(image).resize((600, 870))
@st.cache_data()
def load_resources(load):
    img13 = edit_image(Image.open(r'Imagenes/tesis1a.png'))
    img14 = edit_image(Image.open(r'Imagenes/tesis1b.png'))
    img15 = edit_image(Image.open(r'Imagenes/tesis2a.png'))
    img16 = edit_image(Image.open(r'Imagenes/tesis2b.png'))
    img17 = edit_image(Image.open(r'Imagenes/tesis3a.png'))
    img18 = edit_image(Image.open(r'Imagenes/tesis3b.png'))
    img19 = edit_image(Image.open(r'Imagenes/tesis4a.png'))
    img20 = edit_image(Image.open(r'Imagenes/tesis4b.png'))
    img21 = edit_image(Image.open(r'Imagenes/tesis5a.png'))
    img22 = edit_image(Image.open(r'Imagenes/tesis5b.png'))
    img23 = edit_image(Image.open(r'Imagenes/tesis6a.png'))
    img24 = edit_image(Image.open(r'Imagenes/tesis6b.png'))
    img25 = edit_image(Image.open(r'Imagenes/tesis7a.png'))
    img26 = edit_image(Image.open(r'Imagenes/tesis7b.png'))
    img27 = edit_image(Image.open(r'Imagenes/tesis8a.png'))
    img28 = edit_image(Image.open(r'Imagenes/tesis8b.png'))
    img53 = edit_image(Image.open(r'Imagenes/tesis9a.png'))
    img54 = edit_image(Image.open(r'Imagenes/tesis9b.png'))
    img55 = edit_image(Image.open(r'Imagenes/tesis10a.png'))
    img56 = edit_image(Image.open(r'Imagenes/tesis10b.png'))
    img57 = add_corners(Image.open(r'Imagenes/articulo1.png')).resize((1255, 857))
    img58 = add_corners(Image.open(r'Imagenes/articulo2.png')).resize((1255, 857))
    img59 = add_corners(Image.open(r'Imagenes/articulo3.png')).resize((1255, 857))
    img60 = add_corners(Image.open(r'Imagenes/articulo4.png')).resize((1255, 857))
    return img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img53, img54, img55, img56, img57, img58, img59, img60
img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img53, img54, img55, img56, img57, img58, img59, img60 = load_resources('load')

titulo(2, '2. Indroducción').create()
titulo(3, '2.1. Problemática').create()
text = '''
    <br>En general, los sistemas industrializados disponen de motores eléctricos o de combustión interna para alimentarlos con la potencia necesaria para su 
    funcionamiento, lo cual significa que, el cálculo y diseño de un sistema de transmisión de potencia es un proceso frecuente a nivel industrial, y que, 
    si se realiza adecuadamente, permite reducir costos y mejorar el rendimiento general del sistema. El cálculo y diseño óptimo de estos sistemas está en función 
    a los requerimientos de las máquinas que lo conforman, y a las condiciones de trabajo de las mismas, lo cual se traduce en un proceso largo e iterativo 
    que demandará una considerable cantidad de tiempo y esfuerzo humano. En la actualidad existen soluciones que abordan este problema, siendo este el 
    caso de los programas de ingeniería asistida por computadora desarrollados por grandes empresas o de manera individual, sin embargo, en el primero 
    de estos casos, la solución resulta muy compleja y costosa, mientras que, en el segundo, la solución suele ser muy específica y de difícil acceso.
    En base a lo expuesto, desarrollar una aplicación computacional que permita el cálculo de los componentes principales de un sistema de transmisión de 
    potencia, haciendo uso de distintas metodologías que permitan abarcar mayores casuísticas de diseño y que, además, sea gratuita, sencilla y de fácil 
    acceso para cualquier tipo de usuario, supone una solución óptima para la problemática descrita, en comparación con las ya existentes.
'''
texto(text).create()
st.markdown('#####')

titulo(3, '2.2 Antecedentes').create()
st.markdown('#####')
tab25, tab8, tab9, tab10, tab11, tab12, tab13, tab26, tab14, tab15, tab27, tab28, tab29, tab30 = st.tabs(['Tesis I', 'Tesis II', 'Tesis III', 'Tesis IV', 'Tesis V', 'Tesis VI', 'Tesis VII', 'Tesis VIII', 'Tesis IX', 'Tesis X', 'Artículo I', 'Artículo II', 'Artículo III', 'Artículo IV'])
with tab25:
    col107, col108, col109 = st.columns([1, 2, 1], gap = 'medium')
    with col107:
        st.image(img53)
    with col108:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Programa de cálculo de ejes
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> Jose Ruben Sanchez Sanchez
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad de Salamanca - 2003
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Objetivo:</b> Desarrollar un software que permita calcular y diseñar ejes sometidos a diversos tipos de cargas. El tesista 
            logró el objetivo planteado mediante el desarrollo del programa CALCULO DE EJES.
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Puntos a favor:</b>
            <br>• Cuenta con una libreria de materiales para el eje de transmisión.
            <br>• Permite efectuar iteraciones hasta encontrar el diametro que satisfaga el factor de seguridad requerido.
        </div>''', unsafe_allow_html = True)
    with col109:
        st.image(img54)
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
            <b>Objetivo:</b> Desarrollar un algoritmo que permita diseñar arboles de transmisión de cajas reductoras de engranajes 
            cilíndricos con distribución uniforme. El tesista logró el objetivo planteado mediante el desarrollo del programa PRODIAT.
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Puntos a favor:</b>
            <br>• Optimizado para el diseño de ejes utilizados en cajas reductoras.
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
            <b>Objetivo:</b> Desarrollar un algoritmo que permita diseñar árboles en cajas reductoras de velocidad. El tesista logró el objetivo planteado mediante el desarrollo del programa ADAR.
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Puntos a favor:</b>
            <br>• Permite el modelado 3D del eje en el software Inventor.
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
            <br>• Cuenta con una biblioteca de materiales para ejes.
        </div>''', unsafe_allow_html = True)
    with col64:
        st.image(img24)
with tab26:
    col110, col111, col112 = st.columns([1, 2, 1], gap = 'medium')
    with col110:
        st.image(img55)
    with col111:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Herramienta para el diseño y cálculo de sistemas de transmisión por engranajes cilíndricos de dientes rectos y ejes paralelos
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> Alejandra Gonzalez Garcia
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad de Sevilla - 2019
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Objetivo:</b> Desarrollar una herramienta que permita diseñar los elementos mecánicos que constituyen 
            un sistema de transmisión para cajas reductoras. El tesista 
            logró el objetivo planteado mediante el desarrollo de un programa de cálculo.
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Puntos a favor:</b>
            <br>• Presenta una metodología de cálculo desarrollada para chavetas y rodamientos.
        </div>''', unsafe_allow_html = True)
    with col112:
        st.image(img56)
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
            <br>• Toma en cuenta otras consideraciones relevantes en la operatividad de los engranajes. 
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
            <br>• Permite el modelado 3D del eje en el software Solid Works.
        </div>''', unsafe_allow_html = True)
    with col70:
        st.image(img28)
with tab27:
    col113, col114 = st.columns([1, 1], gap = 'medium')
    with col113:
        st.image(img57)
    with col114:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Desarrollo de un software asistido por ordenador para el diseño de ejes de transmisión de potencia con criterios múltiples
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> D.A. Fadare y O.Y. Akanbi
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad de Ibadan - 2010
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Resumen:</b> Este artículo analiza el desarrollo de un diseño y dibujo asistido por ordenador 
            (CADD) de ejes de transmisión de potencia con múltiples criterios de diseño (resistencia, rigidez torsional, velocidad crítica, 
            Soderberg y rigidez lateral). El CADD desarrollado se denomina "UI-CADSHAFT". El software se 
            aplicó a un caso de estudio típico y se validó con el diseño manual. Se obtuvieron resultados precisos con una productividad 
            veinte veces mayor que el diseño manual.
        </div>''', unsafe_allow_html = True)
with tab28:
    col115, col116 = st.columns([1, 1], gap = 'medium')
    with col115:
        st.image(img58)
    with col116:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Desarrollo de software CAD para ejes sometidos a diversas condiciones de carga
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> A.A. Adukenle, S.B. Adejuyigbe y O.T. Arulogun 
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad de Tecnología Ladoke Akintola - 2012
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Resumen:</b> Este estudio se llevó a cabo 
            para diseñar un eje bajo diversas condiciones de carga utilizando el diseño asistido por computadora, y los resultados obtenidos demostraron 
            que ahorra desperdicio de materiales y también ahorra tiempo. Finalmente, se desarrolló un paquete de software utilizando las fórmulas 
            inicialmente derivadas.
        </div>''', unsafe_allow_html = True)
with tab29:
    col117, col118 = st.columns([1, 1], gap = 'medium')
    with col117:
        st.image(img59)
    with col118:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Aplicación de sistemas de software para el análisis de resistencia de ejes en ingeniería mecánica
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> N.F. Timerbaev, A.R. Sadrtdinov y R.G. Safin
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad Nacional de Investigación Tecnológica de Kazan - 2017
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Resumen:</b> Mediante este artículo se demuestra que, el análisis de ejes mediante sistemas de software permite evitar errores 
            en los cálculos y brinda la posibilidad de optimizar el diseño del eje. Cabe señalar que el software se desarrollo con una interfaz gráfica fácil de usar y comprensible.
        </div>''', unsafe_allow_html = True)
with tab30:
    col119, col120 = st.columns([1, 1], gap = 'medium')
    with col119:
        st.image(img60)
    with col120:
        st.markdown('''<div style="text-align: justify;">
            <b>Título:</b> Un nuevo modelo para el diseño de ejes de motores mediante MATLAB-GUI
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Autor(es):</b> Mahmoud Helal, Abdulaziz H Alghtani, Bassem F. Felemban, Abdullah Alharthi, Elsayed Fathallah, Abdallah A. Elsherbiny y Hasan Eleashy
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Universidad y año:</b> Universidad de Taif - 2021
        </div>''', unsafe_allow_html = True)
        st.markdown('''<div style="text-align: justify;">
            <b>Resumen:</b> En este artículo, se crea un código MATLAB para obtener automáticamente 
            el diseño óptimo del eje. Se desarrolla una Interfaz Gráfica de Usuario (GUI) amigable para recibir todos los parámetros de diseño del eje y de 
            componentes del eje tales como poleas y engranajes. Los resultados obtenidos son coherentes con los cálculos de diseño tradicionales manuales.
        </div>''', unsafe_allow_html = True)
st.markdown('#####')
titulo(3, '2.3 Objetivos').create()
titulo(4, '2.3.1 General').create()
text = '''
    <br> Desarrollar una aplicación computacional que permita el cálculo y diseño óptimo de los componentes principales de un sistema de transmisión de potencia, haciendo 
    uso de distintas metodologías que permitan abarcar una gran cantidad de casuísticas y que, además, sea gratuita, sencilla y de fácil acceso 
    para cualquier tipo de usuario
'''
texto(text).create()
st.markdown('#####')
titulo(4, '2.3.2 Específicos').create()
text = '''
    <br>1. Desarrollar el algoritmo para el cálculo de los factores necesarios para el diseño de los componentes de transmisión de potencia, haciendo uso del procesamiento de imagenes.<br/>
    <br>2. Desarrollar los algoritmos para el cálculo y diseño de transmisiones de potencia por medio de correas planas, correas trapezoidales, cadenas y engranajes (cilíndricos rectos, cilíndricos helicoidales, cilíndricos bihelicoidales y cónicos rectos).<br/>
    <br>3. Desarrollar el algoritmo para el cálculo de las reacciones y deformaciones presentes en los ejes de transmisión bajo cualquier configuración geométrica o mecánica, considerando las teorías de Euler-Bernoulli y Timoshenko.<br/>
    <br>4. Desarrollar el algoritmo para el cálculo y diseño de ejes de transmisión bajo un enfoque estático, dinámico, vibracional, de vida y de rigidez, considerando a los efectos de las cargas axiales y cortantes.<br/>
    <br>5. Desarrollar el algoritmo para cálculo de los esfuerzos y deformaciones en elementos de espesor constante, mediante el método de los elementos finitos.<br/>
    <br>6. Implementar los algoritmos desarrollados en una interfaz gráfica amigable con el usuario final.<br/>
    <br>7. Validar los resultados obtenidos a travez de la aplicación desarrollada.<br/>
    <br>8. Ejemplificar el uso de la aplicación desarrollada.<br/>
    <br>9. Hacer accesible la aplicación desarrollada para cualquier usuario.<br/>
    <br>10. Elaborar la documentación y tutoriales de uso de la aplicación desarrollada.<br/>
'''
texto(text).create()
