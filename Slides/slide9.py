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

titulo(2, '9. Recomendaciones').create()
text = '''
    <br>1. La precisión de las interpolaciones, en el proceso de la digitalización de los diagramas,
    podría incrementarse si se añade una mayor cantidad de datos.<br/>
    <br>2. Si bien se ha señalado que con la aplicación desarrollada se puede analizar cualquier
    tipo de eje de transmisión, es importante mencionar que, existen factores involucrados
    en el proceso, que dependen de ciertas propiedades, las cuales, si son atípicas, podrían
    hacer que dichos factores difieran de los utilizados en la aplicación, por lo que, para
    estos casos, el usuario debe ser alguien con la capacidad de estimar la precisión de los
    resultados obtenidos con la aplicación. En consecuencia, los algoritmos desarrollados
    deben actualizarse para abarcar mayores casuísticas que aún no se han contemplado.<br/>
    <br>3. Se han analizado los componentes principales de un sistema de transmisión de potencia,
    no obstante, existen otros que también deberían ser incluidos, como los motores,
    volantes de inercia, anillos de retención, etc.<br/>
    <br>4. Así mismo, los componentes abarcados en la aplicación, se calculan según el fabricante
    respectivo, sin embargo, existen otros fabricantes de igual relevancia, que podrían ser
    incluidos.<br/>
    <br>5. La ecuación propuesta para el cálculo de la velocidad crítica de Rayleigh ha sido
    validada únicamente con casos teóricos, por lo que sería conveniente su validación en
    casos reales.<br/>
    <br>6. Este proyecto podría ser utilizado como base para el desarrollo de un laboratorio
    virtual, enfocado en el análisis y diseño de sistemas de transmisión de potencia.<br/>
'''
texto(text).create()