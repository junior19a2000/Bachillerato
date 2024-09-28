import streamlit as st
import base64

class titulo:
    def __init__(self, level, text):
        self.level = level
        self.text = text
    def create(self):
        html_code = f'<h{self.level} style = "text-align: center; color: black;">{self.text}</h{self.level}>'
        return st.markdown(html_code, unsafe_allow_html = True)
class gif:
    def __init__(self, content, width):
        self.content = content
        self.width = width
    def create(self):
        html_code = f'<div style = "text-align: center;"><img src = "data:image/gif;base64,{self.content}" width = "{self.width}"></div>'
        return st.markdown(html_code, unsafe_allow_html = True)

@st.cache_data()
def load_resources(load):
    file    = open(r'Imagenes/Logo.gif', "rb")
    content = file.read()
    gif     = base64.b64encode(content).decode("utf-8")
    file.close()
    return gif
gif1 = load_resources('load')

titulo(1, 'Power System Transmission Calculator').create()
titulo(6, 'Proyecto de tesis desarrollado por Junior Joel Aguilar Hancco para obtener el grado de Ingeniero Mecánico').create()
st.markdown('######')
gif(gif1, 500).create()
st.markdown('######')
titulo(6, 'Universidad Nacional de San Agustin').create()
titulo(6, 'Arequipa - 2024').create()