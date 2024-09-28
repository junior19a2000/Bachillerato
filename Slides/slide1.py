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

text = '1. Resumen'
titulo(2, text).create()
text = '''
    <br>El presente proyecto de investigación se realizo con la finalidad de optimizar el proceso de diseño de componentes de transmisión de potencia. Para ello se analizaron los
    componentes principales de dichos sistemas, siendo estos: las correas planas, las correas trapezoidales, las cadenas, los engranajes y los ejes de transmisión,
    en base a las distintas metodologias, criterios y normativas que existen en la actualidad. Una vez establecido 
    el proceso de cálculo para cada uno de ellos, se programaron los algoritmos respectivos y se desarrollo una interfaz gráfica para que el usuario pueda
    mejorar su diseño mediante la variación de los parametros iniciales del sistema. Posteriormente, gracias a la integración entre Matlab y GitHub, 
    se cargó el código y la documentación a un repositorio virtual en la nube. Como resultado de todo este proceso, se
    creó Power System Transmission Calculator, una aplicación informática amigable, accesible, actualizable y gratuita, que permite cálcular y diseñar los componentes previamente
    mencionados, de manera rapida, precisa y optima, cumpliendo asi con el proposito establecido en el proyecto de investigación.
'''
texto(text).create()