import streamlit as st

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

titulo(2, '8. Conclusiones').create()
text = '''
    <br>1. Debido a la digitalización de diagramas, los factores necesarios en el diseño, son
    determinados sin la necesidad de que el usuario intervenga en ello, lo cual se traduce
    en una reducción de tiempo considerable en el proceso de cálculo general.<br/>
    <br>2. A diferencia de otros programas, el haber considerado la configuración geométrica de
    la transmisión de potencia y el sentido de giro del motor, permite que la
    descomposición y la determinación de las fuerzas sea más realista y, por lo tanto, un
    análisis más preciso del eje de transmisión.<br/>
    <br>3. Gracias al estudio e inclusión de diversas metodologías de cálculo, la aplicación está
    en la capacidad de analizar, calcular y diseñar cualquier tipo de eje de transmisión de
    potencia de manera óptima.<br/>
    <br>4. El no haber ignorado los efectos de las fuerzas cortantes en los análisis del eje de
    transmisión, no ha supuesto una diferencia significativa en los resultados, al menos
    cuando el eje es de proporciones genéricas.<br/>
    <br>5. Si bien, la aplicación desarrollada se centra en el diseño de ejes de transmisión, no se
    deja de lado a los componentes que, por lo general, permiten dicha transmisión, siendo
    en este caso: las correas planas, las correas en V, las cadenas de rodillos y los
    engranajes, los cuales se analizan bajo la metodología de fabricantes y normativas
    reconocidas mundialmente.<br/>
    <br>6. Se ha cumplido con los objetivos establecidos en el proyecto de investigación, ya que
    la aplicación desarrollada se caracteriza por su interfaz gráfica amigable, uso sencillo
    y acceso libre, lo cual la convierte en una gran opción para el diseño de componentes
    de transmisión de potencia de manera óptima.<br/>
'''
texto(text).create()