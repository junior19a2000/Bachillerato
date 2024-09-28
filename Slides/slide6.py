import streamlit as st
from PIL import Image, ImageDraw
import base64

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
    rad = 50
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
    return add_corners(image).resize((1000, 550))
@st.cache_data()
def load_resources(load):
    img39 = edit_image(Image.open(r'Imagenes/cortanteshi.png'))
    img40 = edit_image(Image.open(r'Imagenes/cortantesxz.png'))
    img41 = edit_image(Image.open(r'Imagenes/pendienteshi.png'))
    img42 = edit_image(Image.open(r'Imagenes/pendientesxy.png'))
    img43 = edit_image(Image.open(r'Imagenes/esfuerzosvmb.png'))
    img44 = edit_image(Image.open(r'Imagenes/ansysdin.png'))
    img45 = edit_image(Image.open(r'Imagenes/dinamicospstc.png'))
    img46 = edit_image(Image.open(r'Imagenes/ansysvida.png'))
    img47 = edit_image(Image.open(r'Imagenes/vidapstc.png'))
    img48 = edit_image(Image.open(r'Imagenes/simcritica.png'))
    img49 = edit_image(Image.open(r'Imagenes/criticapstc.png'))

    file_6   = open(r'ReadmeRSC/animation.gif', "rb")
    content6 = file_6.read()
    gif6     = base64.b64encode(content6).decode("utf-8")
    file_6.close()
    file_7   = open(r'ReadmeRSC/DeflectionAnsys.gif', "rb")
    content7 = file_7.read()
    gif7     = base64.b64encode(content7).decode("utf-8")
    file_7.close()
    return img39, img40, img41, img42, img43, img44, img45, img46, img47, img48, img49, gif6, gif7
img39, img40, img41, img42, img43, img44, img45, img46, img47, img48, img49, gif6, gif7 = load_resources('load')

titulo(2, '6. Validación').create()
text = '''
    <br>Para la validación teórica del módulo de ejes, se ha visto por conveniente utilizar el caso
    de estudio abordado en el libro "Diseño en ingeniería mecánica de Shigley". Respecto al módulo
    de engranajes, se utilizó el caso de estudio descrito en el proyecto de fin de carrera “Cálculo y
    diseño de engranajes conforme a la norma ANSI/AGMA 2101-D04”. Así mismo, para la
    validación del módulo de análisis bidimensional se utilizaron los problemas descritos en el libro
    “A first course in the finite element method”. En cuanto a los demás componentes, se han utilizado
    los casos de diseño descritos en sus respectivos catálogos. A continuación, se describirá
    únicamente la validación del módulo de ejes, dado que todos los tutoriales se han realizado con
    los casos de validación correspondientes a cada componente.
'''
texto(text).create()
st.markdown('#####')
st.image('Imagenes/plano.png', use_column_width = True)
st.markdown('#####')
tab1, tab2, tab3, tab4, tab5, tab6, tab7 = st.tabs(['Diagrama de cortantes xz', 'Diagrama de pendientes xy', 'Esfuerzos estáticos', 'Esfuerzos dinámicos', 'Ciclos de vida', 'Deformaciones', 'Velocidad crítica'])
with tab1:
    col1, col2 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col1:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.image(img39, use_column_width = True)
    with col2:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img40, use_column_width = True)
with tab2:
    col3, col4 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col3:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.image(img41, use_column_width = True)
    with col4:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img42, use_column_width = True)
with tab3:
    col5, col6 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col5:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        url1 = 'https://drive.google.com/file/d/1hig9McpA3y1S7cx_nxM-a3G1zS8Ehqqz/preview'
        st.markdown(f'<iframe src={url1} height="264" width="100%" style="border-radius: 50px;"></iframe>', unsafe_allow_html = True)
     
    with col6:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img43, use_column_width = True)
with tab4:
    col7, col8 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col7:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.image(img44, use_column_width = True)
    with col8:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img45, use_column_width = True)
with tab5:
    col9, col10 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col9:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.image(img46, use_column_width = True)
    with col10:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img47, use_column_width = True)
with tab6:
    col11, col12 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col11:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.markdown(f'<img src = "data:image/gif;base64,{gif6}" width = "100%" height = "264" style="border-radius: 30px;">', unsafe_allow_html = True)
    with col12:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.markdown(f'<img src = "data:image/gif;base64,{gif7}" width = "100%" height = "264" style="border-radius: 30px;">', unsafe_allow_html = True)
with tab7:
    col13, col14 = st.columns([1, 1], gap = 'small', vertical_alignment = 'center')
    with col13:
        st.markdown("<h3 style='text-align: center;'>OTROS</h3>", unsafe_allow_html = True)
        st.image(img48, use_column_width = True)
    with col14:
        st.markdown("<h3 style='text-align: center;'>P.S.T.C.</h3>", unsafe_allow_html = True)
        st.image(img49, use_column_width = True)
st.markdown('#####')
text = '''
    Todos los resultados obtenidos en el módulo de ejes se resumen en 6 valores: Pendiente máxima, deflexión máxima, factor de seguridad estático mínimo, 
    factor de seguridad dinámico mínimo, velocidad crítica y horas de vida. A partir de estos, cualquier usuario sin importar su nivel de expertiz, deberia 
    ser capaz de diseñar un eje de transmición de potencia eficiente. Se puede apreciar que, a partir de los resultados gráficos y númericos, los resultados obtenidos 
    por PSTC se validan con los resultados obtenidos por el autor en el caso de estudio y los software CAE utilizados en el análisis. 
'''
texto(text).create()
st.markdown('#####')
st.latex(r'''
          \begin{array}{c c c}\hline \\
          \text{Resultado} & \text{P.S.T.C.} & \text{Otros} \\\\\hline\\
          \text{Pendiente (rad)} & 0.00056321 & 0.00000000 \\\\
          \text{Deflexiones (m)} & 0.00003079 & 0.00003039 \\\\
          \text{F.S. Von Misses} & 4.4933 & 4.4943 \\\\
          \hspace{8.25mm} \text{F.S. ASME} \hspace{8.25mm} & \hspace{10mm} 1.9993 \hspace{10mm} & \hspace{10mm} 1.9882 \hspace{10mm} \\\\
          \text{RPM crítico} & 5765.1 & 5164.8 \\\\
          \text{Horas de vida} & 5.4750 & 5.4307 \\\\\hline
          \end{array} 
     ''')