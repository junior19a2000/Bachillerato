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
    rad = 15
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
    return add_corners(image)
@st.cache_data()
def load_resources(load): #.resize((1000, 550))
    img1 = edit_image(Image.open(r'Imagenes/aply1.jpg'))
    img2 = edit_image(Image.open(r'Imagenes/aply2.jpg'))
    img3 = edit_image(Image.open(r'Imagenes/aply3.jpg'))
    img4 = edit_image(Image.open(r'Imagenes/aply4.jpg'))
    img5 = edit_image(Image.open(r'Imagenes/aply5.jpg'))
    img6 = edit_image(Image.open(r'Imagenes/aply6.jpg'))
    img7 = edit_image(Image.open(r'Imagenes/aply7.jpg'))
    img8 = edit_image(Image.open(r'Imagenes/aply8.jpg'))
    img9 = edit_image(Image.open(r'Imagenes/aply9.jpg'))
    img10 = edit_image(Image.open(r'Imagenes/aply10.jpg'))
    img11 = edit_image(Image.open(r'Imagenes/aply11.jpg'))
    img12 = edit_image(Image.open(r'Imagenes/aply12.jpg'))
    img13 = edit_image(Image.open(r'Imagenes/aply13.jpg'))
    img14 = edit_image(Image.open(r'Imagenes/aply14.png'))
    img15 = edit_image(Image.open(r'Imagenes/aply15.jpg'))
    img16 = edit_image(Image.open(r'Imagenes/aply16.jpg'))
    img17 = edit_image(Image.open(r'Imagenes/aply17.jpg'))
    img18 = edit_image(Image.open(r'Imagenes/aply18.png'))
    img19 = edit_image(Image.open(r'Imagenes/aply19.jpg'))
    img20 = edit_image(Image.open(r'Imagenes/aply20.jpg'))
    img21 = edit_image(Image.open(r'Imagenes/aply21.jpg'))
    img22 = edit_image(Image.open(r'Imagenes/aply22.jpg'))
    img23 = edit_image(Image.open(r'Imagenes/aply23.jpg'))
    img24 = edit_image(Image.open(r'Imagenes/aply24.jpg'))
    img25 = edit_image(Image.open(r'Imagenes/aply25.jpg'))
    img26 = edit_image(Image.open(r'Imagenes/aply26.jpg'))
    img27 = edit_image(Image.open(r'Imagenes/aply27.jpg'))
    img28 = edit_image(Image.open(r'Imagenes/aply28.jpg'))
    img29 = edit_image(Image.open(r'Imagenes/aply29.jpg'))
    img30 = edit_image(Image.open(r'Imagenes/aply30.jpg'))
    img31 = edit_image(Image.open(r'Imagenes/aply31.jpg'))
    return img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img29, img30, img31
img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img29, img30, img31 = load_resources('load')

titulo(2, '7. Aplicación').create()

text = '''
    <br>Para la aplicación práctica de P.S.T.C. se ha visto por conveniente hacer uso de esta herramienta, para mejorar el diseño de una máquina de trituración de Tereftalato de Polietileno, fabricada y comercializada por la empresa H&C INDUSTRIAS DEL PERU.  
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([0.65, 1, 0.21, 1, 1], gap = 'small', vertical_alignment = 'center')
with col2:
    st.image(img1, use_column_width = False)
with col4:
    st.image(img2, use_column_width = False)
st.markdown('#####')
text = '''
    La optimización del diseño por medio de P.S.T.C. se enfocará en el sistema de transmisión de potencia de la máquina, específicamente en las correas y el eje de transmisión.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([0.65, 1, 0.21, 1, 1], gap = 'small', vertical_alignment = 'center')
with col2:
    st.image(img3, use_column_width = False)
with col4:
    st.image(img4, use_column_width = False)
st.markdown('#####')
text = '''
    Como se mencionó en el capítulo V, el acceso al módulo de correas planas se encuentra en el sitio web P.S.T.C., por lo que el primer paso de este proceso de optimización es ingresar a la url y pinchar sobre el botón que dice “Open in MATLAB Online”, el cual se encuentra a lado del módulo correspondiente.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img5, use_column_width = False)
st.markdown('#####')
text = '''
    El enlace redirige a una sesión de Matlab Online correspondiente a la cuenta de MathWorks previamente registrada. En dicha sesión aparecerá un cuadro de confirmación, mediante el cual se le solicitará al usuario guardar una copia del repositorio de P.S.T.C. Lo anterior, ocurrirá únicamente en la primera vez que se use P.S.T.C.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img6, use_column_width = False)
st.markdown('#####')
text = '''
    Una vez guardado el repositorio, el módulo se ejecutará inmediatamente y estará listo para utilizarse directamente en el navegador. En base al modelo CAD de la maquina y la información de campo registrada, se llenan los recuadros ubicados en la parte izquierda del módulo y se pincha el botón “Definir”.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img7, use_column_width = False)
st.markdown('#####')
text = '''
    Producto de la acción anterior, el módulo recomendara el perfil de correa que debe de seleccionarse, en este caso, SPZ. No obstante, el usuario se encuentra en la libertad de elegir otro perfil, teniendo en cuenta el grafico de perfiles.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img8, use_column_width = False)
st.markdown('#####')
text = '''
    Una vez seleccionado el perfil de correa, se debe de verificar los valores de velocidad y frecuencia de flexión de las correas, en base a una tolerancia establecida, así como determinar los diámetros de las poleas y la longitud de la correa. Para ello, se pincha la palanca de verificación, con lo cual el módulo recomendará los diámetros de poleas a utilizar, calculará la longitud de la correa y advertirá sobre si los valores antes mencionados cumplen con la tolerancia establecida.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img9, use_column_width = False)
st.markdown('#####')
text = '''
    Luego de seleccionado el perfil, los diámetros de las poleas, la longitud de la correa y las verificaciones correspondientes, se procede con el cálculo de los resultados restantes. Para ello se pincha el botón “Calcular”, con lo cual se podrá saber el número de correas a utilizar, la magnitud de las cargas que actuaran sobre el eje de transmisión, entro otros. Para este caso en particular, el módulo recomienda utilizar 3 correas trapeciales de perfil SPZ, con una longitud de 3000 mm.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img10, use_column_width = False)
st.markdown('#####')
text = '''
    Con las correas ya seleccionadas, continua el cálculo del eje de transmisión. Para ello, se busca el módulo de ejes en el sitio web de P.S.T.C. y se accede a este como en el caso anterior.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img11, use_column_width = False)
st.markdown('#####')
text = '''
    Dado que el módulo de correas sigue abierto, la sesión de Matlab Online consultara si se desea trabajar en una nueva ventana, o continuar trabajando en la ventana que ya se encuentra abierta. En este caso, para trabajar con ambos módulos, debe de seleccionarse la opción de continuar en la ventana que ya se encuentra abierta.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img12, use_column_width = False)
st.markdown('#####')
text = '''
    A continuación, aparecerá un cuadro de consulta sobre si se desea crear una nueva copia del repositorio, o en caso contrario, continuar con el ya existente. Este cuadro siempre aparecerá,
    y solo se debe de guardar una nueva copia cuando el repositorio base haya sufrido cambios. Para el presente caso, se continua con el ya existente.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img13, use_column_width = False)
st.markdown('#####')
text = '''
    Inicialmente, se va a calcular el eje con las dimensiones con las que H&C INDUSTRIAS DEL PERU lo fabricó, para posteriormente optimizar el diseño inicial. En consecuencia, se debe ingresar las características geométricas y mecánicas del eje en el submódulo de parámetros.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img14, use_column_width = False)
st.markdown('#####')
text = '''
    Para el caso de las cargas que actúan sobre el eje de transmisión, se hace uso de los resultados obtenidos en el módulo de correas en V. Además, se deben agregar las cargas correspondientes a otros elementos acoplados al eje, como lo son para el presente caso, el juego de cuchillas, la polea y el volante.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img15, use_column_width = False)
st.markdown('#####')
text = '''
    De igual forma, se llena con la información correspondiente, el submódulo de factores, el cual está relacionado a las concentraciones de esfuerzos estáticos y dinámicos, así como al cálculo del límite de fatiga para cada tramo del eje. Adicionalmente, incorpora herramientas para el cálculo de chavetas cuadradas y selección de rodamientos SKF.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img16, use_column_width = False)
st.markdown('#####')
text = '''
    Una vez llenada la información, se procede a pinchar el botón “Calcular factores” para efectuar los cálculos correspondientes, de esta manera, el usuario está en la posibilidad de revisar los resultados de estos, antes de efectuar el cálculo final.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img17, use_column_width = False)
st.markdown('#####')
text = '''
    Con la información registrada y los factores de concentración ya determinados, corresponde ejecutar el cálculo general del eje, mediante el modelo de Bernoulli o Timoshenko. El módulo recomendara el modelo a elegir en base a la esbeltez del eje de transmisión, no obstante, el usuario tiene la libertad de elegir cual emplear.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img18, use_column_width = False)
st.markdown('#####')
text = '''
    Una vez elegido el modelo, el usuario deberá pinchar el botón correspondiente a dicho modelo, para que el módulo pueda iniciar con los cálculos necesarios. Una vez estos terminados, el submódulo de resultados está en la capacidad de mostrar los resultados obtenidos de manera
    gráfica y numérica. A continuación, se muestran algunos de ellos para el caso en análisis:
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([0.65, 1, 0.21, 1, 1], gap = 'small', vertical_alignment = 'center')
with col2:
    st.image(img19, use_column_width = False)
    st.image(img21, use_column_width = False)
    st.image(img23, use_column_width = False)
with col4:
    st.image(img20, use_column_width = False)
    st.image(img22, use_column_width = False)
    st.image(img24, use_column_width = False)
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img25, use_column_width = False)
st.markdown('#####')
text = '''
    Del cuadro de resumen de resultados, se advierte que el eje esta sobredimensionado bajo todos los criterios, por lo que puede ser optimizado y admitir cambios en su geometría como en sus propiedades. En adición a lo anterior, para hacer el análisis más realista, se tomará en cuenta el peso propio del eje.
    En línea con lo expuesto previamente, se modificó el diámetro central del eje de transmisión, pasando de 11 cm a 7 cm; se añadió un orificio interior de 3 cm en toda la longitud del eje de transmisión, y se añadieron las cargas distribuidas correspondientes al peso propio del eje de transmisión en cada tramo para un análisis más realista. Así mismo, se recalcularon los valores obtenidos a partir del submódulo de factores, principalmente debido a los cambios geométricos que ha sufrido el eje de transmisión, ya que estos afectan a los redondeos que están presenten en los cambios de diámetro.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([0.65, 1, 0.21, 1, 1], gap = 'small', vertical_alignment = 'center')
with col2:
    st.image(img26, use_column_width = False)
with col4:
    st.image(img27, use_column_width = False)
st.markdown('#####')
text = '''
    Con los valores involucrados recalculados, se efectúa el cálculo general del eje de transmisión bajo el modelo seleccionado, a partir del cual se obtuvieron los siguientes resultados, los cuales son menos conservadores, pero aún confiables:
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3, col4, col5 = st.columns([0.65, 1, 0.21, 1, 1], gap = 'small', vertical_alignment = 'center')
with col2:
    st.image(img28, use_column_width = False)
with col4:
    st.image(img29, use_column_width = False)
st.markdown('#####')
text = '''
    Se advierte que los factores de seguridad se han reducido en un 40% a causa de los cambios efectuados; no obstante, dichos factores siguen siendo bastante seguros, por lo que el eje de transmisión puede optimizarse aún más.
    Finalmente, una vez optimizado el diseño, P.S.T.C. esta en la capacidad de generar una simulación tridimensional del eje con los resultados obtenidos, esto para una mejor representación y entendimiento de los mismos, tal y como se muestra en las siguientes figuras.
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img30, use_column_width = False)
col1, col2, col3 = st.columns([0.4, 1, 1], gap = 'small', vertical_alignment = 'center')# Arreglar !
with col2:
    st.image(img31, use_column_width = False)

