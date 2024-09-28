import streamlit as st

st.set_page_config(page_title = "Tesis de bachillerato", page_icon = "🦅", layout = "wide", initial_sidebar_state = "expanded")

class slides:
    def __init__(self, file, title, default):
        self.file = file
        self.title = title
        self.default = default
    def create(self):
        slide = st.Page(
            page = 'Slides/' + self.file + '.py',
            title = self.title,
            default = self.default,
        )
        return slide

slide0 = slides('slide0', 'Presentación', True).create()
slide1 = slides('slide1', '1. Resumen', False).create()
slide2 = slides('slide2', '2. Indroducción', False).create()
slide3 = slides('slide3', '3. Marco teórico', False).create()
slide4 = slides('slide4', '4. Marco metodológico', False).create()
slide5 = slides('slide5', '5. Resultados', False).create()
slide6 = slides('slide6', '6. Validación', False).create()
slide7 = slides('slide7', '7. Aplicación', False).create()
slide8 = slides('slide8', '8. Conclusiones', False).create()
slide9 = slides('slide9', '9. Recomendaciones', False).create()

pg = st.navigation(pages = [slide0, slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9])

st.sidebar.image('C:/Users/user/Downloads/unsa.png', use_column_width = True)

pg.run()