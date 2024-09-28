import solara as sol
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import sympy as sp

class Plots:
    def __init__(self, xlabel, ylabel, axes, sizex, sizey, alpha):
        self.xlabel = xlabel
        self.ylabel = ylabel
        self.axes   = axes
        self.sizex  = sizex
        self.sizey  = sizey
        self.alpha  = alpha
    def figura(self):
        fig, axe = plt.subplots(figsize = (self.sizex, self.sizey))
        axe.axis(self.axes)
        axe.grid(alpha = self.alpha)
        axe.set_xlabel(self.xlabel)
        axe.set_ylabel(self.ylabel)
        return axe, fig

def sym_calc(L, EI, AE, AF, F, M, D, tipo):
    Lon_Tra = L
    Ine_You = EI
    Apo_Ela = AE
    Apo_Fij = AF
    Fue_Nod = F
    Mom_Nod = M
    Fue_Dis = D

    Nod_Tot = np.concatenate((np.array([0]), np.cumsum(Lon_Tra[0:2])))
    Nod_Ini = Nod_Tot[0:2]
    Nod_Fin = Nod_Tot[1:3]
    Apo_Tot = Apo_Ela + Apo_Fij

    nvr = ''
    for i in range(1,np.shape(np.nonzero(Apo_Tot))[1] + 1):
            var = ' r' + str(i)
            nvr = nvr + var
    Cons_0  = sp.var(nvr)
    Rea_Fue = np.array([0, 0 ,0], dtype = object)
    Rea_Fue[Apo_Tot > 0] = Cons_0
    Fue_Nod = Fue_Nod + Rea_Fue

    if sum(Apo_Fij) != 0:
        nvr = ''
        for i in range(1,np.shape(np.nonzero(Apo_Fij))[1] + 1):
                var = ' m' + str(i)
                nvr = nvr + var
        Cons_1  = sp.var(nvr)
        Rea_Mom = np.array([0, 0 ,0], dtype = object)
        Rea_Mom[Apo_Fij > 0] = Cons_1
        Mom_Nod = Mom_Nod + Rea_Mom

    x = sp.var('x'); x1 = sp.var('x1'); x2 = sp.var('x2')
    Com_Fue = np.array([0, 0], dtype = object)
    Com_Dis = np.array([0, 0], dtype = object)
    for i in range(2):
        Com_Fue[i] = sum(Fue_Nod[0:i + 1])
        Com_Dis[i] = Fue_Dis[i] * (x - Nod_Ini[i])
    Fue_Equ = Fue_Dis * (Nod_Fin - Nod_Ini)
    Fue_Equ = np.concatenate((np.array([0]), np.cumsum(Fue_Equ[0:1])))

    Ecu_Cor = np.array([0, 0], dtype = object)
    for i in range(2):
        Ecu_Cor[i] = Com_Fue[i] + Com_Dis[i] + Fue_Equ[i]
    x1 = 0
    Ecu_Mom = np.array([0, 0], dtype = object)
    for i in range(2):
        Ecu_1      = sp.integrate(Ecu_Cor[i], x) + x2 + Mom_Nod[i] - x1
        Ecu_1      = Ecu_1.subs(x, Nod_Ini[i])
        Ecu_2      = sp.integrate(Ecu_Cor[i], x) + np.array(sp.solve(Ecu_1, x2))[0]
        Ecu_Mom[i] = Ecu_2
        x1         = Ecu_2.subs(x, Nod_Fin[i])      
    Sis_Fue = sum(Fue_Nod) + sum(Fue_Dis * (Nod_Fin - Nod_Ini))
    Sis_Mom = sum(Mom_Nod) + sum(Nod_Fin * Fue_Nod[1:]) + sum((Fue_Dis * (Nod_Fin - Nod_Ini)) * ((Nod_Fin + Nod_Ini) / 2))

    Ecu_Pen = np.array([0, 0], dtype = object)
    Ecu_Def = np.array([0, 0], dtype = object)
    for i in range(2):
        Ecu_Pen[i] = sp.integrate(Ecu_Mom[i], x) + sp.var('c' + str(2 * (i + 1) - 1))
        Ecu_Def[i] = sp.integrate(Ecu_Pen[i], x) + sp.var('c' + str(2 * (i + 1)))    
    Sis_Pen = Ecu_Pen[1].subs(x, Nod_Fin[0]) / Ine_You - Ecu_Pen[0].subs(x, Nod_Fin[0]) / Ine_You
    Sis_Def = Ecu_Def[1].subs(x, Nod_Fin[0]) / Ine_You - Ecu_Def[0].subs(x, Nod_Fin[0]) / Ine_You

    Sis_Nod = np.array([0, 0], dtype = object)
    Sis_Nod[0] = Ecu_Def[0].subs(x, Nod_Tot[0])
    Sis_Nod[1] = Ecu_Def[1].subs(x, Nod_Tot[2])
    if sum(Apo_Fij) != 0: 
        Sis_Nop = np.zeros((1, np.count_nonzero(Apo_Fij)), dtype = object)[0]
        j = -1
        for i in range(3):
            if Apo_Fij[i] != 0:
                j = j + 1
                if Apo_Fij[i] == 1:
                    Sis_Nop[j] = Ecu_Pen[0].subs(x, Nod_Tot[i])
                elif Apo_Fij[i] == 3:
                    Sis_Nop[j] = Ecu_Pen[1].subs(x, Nod_Tot[i])
        if len(Sis_Nop) == 1:
            Sis_Ecu = (Sis_Fue, Sis_Mom, Sis_Pen, Sis_Def, Sis_Nod[0], Sis_Nod[1], Sis_Nop[0])
        else:
            Sis_Ecu = (Sis_Fue, Sis_Mom, Sis_Pen, Sis_Def, Sis_Nod[0], Sis_Nod[1], Sis_Nop[0], Sis_Nop[1])
    else:
        Sis_Ecu = (Sis_Fue, Sis_Mom, Sis_Pen, Sis_Def, Sis_Nod[0], Sis_Nod[1])
    rpts = sp.solve(Sis_Ecu)

    if tipo == 'Cortantes':
        Ecu_Ind = Ecu_Cor / Ine_You * Ine_You
    elif tipo == 'Momentos':
        Ecu_Ind = Ecu_Mom / Ine_You * Ine_You
    elif tipo == 'Pendientes':
        Ecu_Ind = Ecu_Pen / Ine_You
    else:
        Ecu_Ind = Ecu_Def / Ine_You


    for i in range(2):
        Ecu_Def[i] = Ecu_Def[i].subs(c1, rpts[c1])
        Ecu_Def[i] = Ecu_Def[i].subs(c2, rpts[c2])
        Ecu_Def[i] = Ecu_Def[i].subs(c3, rpts[c3])
        Ecu_Def[i] = Ecu_Def[i].subs(c4, rpts[c4])
        Ecu_Def[i] = Ecu_Def[i].subs(r1, rpts[r1])
        if sum(Apo_Fij) != 0: 
            Ecu_Def[i] = Ecu_Def[i].subs(m1, rpts[m1])
    Ecu_Def = Ecu_Def / Ine_You
    for i in range(2):
        Ecu_Pen[i] = sp.diff(Ecu_Def[i], x)
        Ecu_Mom[i] = sp.diff(Ecu_Pen[i], x) * Ine_You
        Ecu_Cor[i] = sp.diff(Ecu_Mom[i], x)

    if tipo == 'Cortantes':
        Ecu_Det = Ecu_Cor
    elif tipo == 'Momentos':
        Ecu_Det = Ecu_Mom
    elif tipo == 'Pendientes':
        Ecu_Det = Ecu_Pen
    else:
        Ecu_Det = Ecu_Def

    Dom = np.array([np.linspace(Nod_Tot[0], Nod_Tot[1], 50), np.linspace(Nod_Tot[1], Nod_Tot[2], 50)])
    Val_Def = np.array([])
    Val_Pen = np.array([])
    Val_Mom = np.array([])
    Val_Cor = np.array([])
    for i in range(2):
        flamb = sp.lambdify(x, Ecu_Def[i], "numpy")
        Val_Def = np.append(Val_Def, flamb(Dom[i]))
        flamb = sp.lambdify(x, Ecu_Pen[i], "numpy")
        Val_Pen = np.append(Val_Pen, flamb(Dom[i]))
        flamb = sp.lambdify(x, Ecu_Mom[i], "numpy")
        Val_Mom = np.append(Val_Mom, flamb(Dom[i]))
        flamb = sp.lambdify(x, Ecu_Cor[i], "numpy")
        Val_Cor = np.append(Val_Cor, flamb(Dom[i]))
    Dom = Dom.reshape(100,)
    dom = Dom
    if tipo == 'Cortantes':
        if Val_Cor.shape[0] == 2:
            Val_Cor = np.array([Val_Cor[0], Val_Cor[0], Val_Cor[1], Val_Cor[1]])
            Dom     = np.array([0, forcepnt.value, forcepnt.value, longitud.value])
        Val_Gra = Val_Cor
    elif tipo == 'Momentos':
        Val_Gra = Val_Mom
    elif tipo == 'Pendientes':
        Val_Gra = Val_Pen
    else:
        Val_Gra = Val_Def
    return Ecu_Ind, Ecu_Det, Val_Gra, rpts, Dom, Val_Def, dom

def num_calc(L, E, I, G, tipo):
    L = L
    E = E
    I = I
    G = G
    Nod_Tot = np.concatenate((np.array([0]), np.cumsum(L[0:2])))
    Nod_Ini = Nod_Tot[0:2]
    Nod_Fin = Nod_Tot[1:3]
    A   = (np.pi / 4) * ((diameext.value / 1000) ** 2 - (diameint.value / 1000) ** 2)       
    m   = np.repeat(diameint.value / diameext.value, 2)
    k   = (6 * (1 + 0.3) * (1 + m ** 2) ** 2) / ((7 + 6 * 0.3) * (1 + m ** 2) ** 2 + (20 + 12 * 0.3) * m ** 2)
    p   = (12 * E * I) / (k * A * G * L ** 2)
    N_E = np.repeat(elements.value + 1, 2)
    L_L = (Nod_Fin - Nod_Ini) / N_E
    I_I = np.repeat(I, 2)
    P_P = np.repeat(p, 2)
    E_E = np.repeat(E, 2)
    L1  = [np.zeros((1, N_E[0]))[0], np.zeros((1, N_E[1]))[0]]
    I1  = [np.zeros((1, N_E[0]))[0], np.zeros((1, N_E[1]))[0]]
    E1  = [np.zeros((1, N_E[0]))[0], np.zeros((1, N_E[1]))[0]]
    phi1 = [np.zeros((1, N_E[0]))[0], np.zeros((1, N_E[1]))[0]]
    for i in range(2):
        L1[i] = np.repeat(L_L[i], N_E[i])
        I1[i] = np.repeat(I_I[i], N_E[i])
        E1[i] = np.repeat(E_E[i], N_E[i])
        phi1[i] = np.repeat(P_P[i], N_E[i])
    L1   = np.concatenate((L1[0], L1[1]))
    I1   = np.concatenate((I1[0], I1[1]))
    E1   = np.concatenate((E1[0], E1[1]))
    phi1 = np.concatenate((phi1[0], phi1[1]))
    MG   = np.zeros((sum(N_E), 2 * (sum(N_E) + 1), 2 * (sum(N_E) + 1)))
    ML   = np.zeros((sum(N_E), 4, 4))
    for i in range(sum(N_E)):
        ML[i, :, :] = (E1[i] / L1[i] ** 3) * (I1[i] / (1 + phi1[i])) * np.array([
                      [12, 6 * L1[i], -12, 6 * L1[i]],
                      [6 * L1[i], (4 + phi1[i]) * L1[i] ** 2, -6 * L1[i], (2 - phi1[i]) * L1[i] ** 2],
                      [-12, -6 * L1[i], 12, -6 * L1[i]],
                      [6 * L1[i], (2 - phi1[i]) * L1[i] ** 2, -6 * L1[i], (4 + phi1[i]) * L1[i] ** 2]])
        MG[i, np.array([2 * i, 2 * i + 1, 2 * i + 2, 2 * i + 3])[:,np.newaxis], np.array([2 * i, 2 * i + 1, 2 * i + 2, 2 * i + 3])[np.newaxis,:]] = ML[i, :, :]
    MG  = np.sum(MG, axis = 0)

    FCT = np.arange(0, (3 + 2 * elements.value) * 2)
    FCE = np.array([0, (2 + 2 * elements.value) * 2])
    if apoyoizq.value == 'Fijo':
        FCE = np.concatenate((FCE, np.array([1])))
    if apoyoder.value == 'Fijo':
        FCE = np.concatenate((FCE, np.array([(2 + 2 * elements.value) * 2 + 1])))
    FCS = np.setdiff1d(FCT, FCE)
    MRA = MG[FCS[:,np.newaxis], FCS[np.newaxis,:]]
    if pesoprop.value == True:
        FDN = - (((np.pi / 4) * ((diameext.value / 1000) ** 2 - (diameint.value / 1000) ** 2)) * (longitud.value / 1000) * densidad.value * 9.81) / (3 + 2 * elements.value)
    else:
        FDN = 0
    MFD = np.repeat(FDN, 3 + 2 * elements.value).reshape((3 + 2 * elements.value, 1))
    MDF = np.zeros((3 + 2 * elements.value, 1))
    MDF[1 + elements.value] = fuerza.value * 1000
    MDF = MDF + MFD
    MDM = np.zeros((3 + 2 * elements.value, 1))
    MDM[1 + elements.value] = momento.value * 1000
    MFM = np.hstack((MDF, MDM)).reshape((len(MFD) * 2, 1))
    MRB = MFM[FCS]
    MRX = np.linalg.solve(MRA, MRB)
    MPD = np.zeros(((3 + 2 * elements.value) * 2, 1))
    MPD[FCS] = MRX
    MFM = np.dot(MG, MPD)
    FC  = np.array([])
    MF  = np.array([])
    for i in range(sum(N_E)):
        MLR = np.dot(ML[i], MPD[(2 * i):(2 * i + 4)])
        FC  = np.concatenate((FC, MLR[0], MLR[2]))
        MF  = np.concatenate((MF, MLR[1], MLR[3]))
    RD  = MPD[range(0, len(MPD), 2)]
    RP  = MPD[range(1, len(MPD), 2)]
    Num = np.unique(np.concatenate((np.linspace(0, forcepnt.value, elements.value + 2), np.linspace(forcepnt.value, longitud.value, elements.value + 2)))) / 1000
    if tipo == 'Cortantes':
        Val_Num = FC[range(0, len(FC), 2)]
        Val_Num = np.append(Val_Num, -FC[-1])
    elif tipo == 'Momentos':
        Val_Num = MF[range(0, len(MF), 2)] * -1
        Val_Num = np.append(Val_Num, MF[-1])
    elif tipo == 'Pendientes':
        Val_Num = RP.T[0]
    else:
        Val_Num = RD.T[0]
    Def_Num = RD.T[0]
    return MRA, Val_Num, Num, Def_Num

def shaft_calc():
    tipo = tipodiag.value
    L  = np.array([forcepnt.value / 1000, (longitud.value - forcepnt.value) / 1000])
    EI = 207e9 * ((np.pi / 64) * ((diameext.value / 1000) ** 4 - (diameint.value / 1000) ** 4))
    AE = np.array([0, 0, 0])
    AF = np.array([0, 0, 0])
    if apoyoizq.value == 'Elastico':
        AE[0] = 1
    else:
        AF[0] = 1
    if apoyoder.value == 'Elastico':
        AE[2] = 3
    else:
        AF[2] = 3
    F = np.array([0, fuerza.value * 1000, 0])
    M = np.array([0, momento.value * 1000, 0])
    if pesoprop.value == True:
        D = ((np.pi / 4) * ((diameext.value / 1000) ** 2 - (diameint.value / 1000) ** 2)) * densidad.value * 9.81
        D = np.array([-D, -D])
    else:
        D = np.array([0, 0])
    Ecu_Ind, Ecu_Det, Val_Gra, rpts, Dom, Val_Def, dom = sym_calc(L, EI, AE, AF, F, M, D, tipo)

    E  = 207e9
    I  = ((np.pi / 64) * ((diameext.value / 1000) ** 4 - (diameint.value / 1000) ** 4))
    G   = 80e9
    Mat_Num, Val_Num, Num, Def_Num = num_calc(L, E, I, G, tipo)
    Val_Def
    Vcr_Ana = round(30 / np.pi * np.sqrt(9.81 * (np.trapz(abs(Val_Def), dom) / (np.trapz(abs(Val_Def), dom) ** 2))), 3)
    Vcr_Num = round(30 / np.pi * np.sqrt(9.81 * (np.trapz(abs(Def_Num), Num) / (np.trapz(abs(Def_Num), Num) ** 2))), 3)
    Por_Err = round(abs((abs(Vcr_Ana) - abs(Vcr_Num)) / Vcr_Num) * 100, 3)

    return Ecu_Ind, Ecu_Det, Val_Gra, rpts, Dom, Mat_Num, Val_Num, Num, Vcr_Ana, Vcr_Num, Por_Err

densidad = sol.reactive(7850)
longitud = sol.reactive(1000)
diameext = sol.reactive(50)
diameint = sol.reactive(25)
fuerza   = sol.reactive(-1)
momento  = sol.reactive(1)
elements = sol.reactive(0)
apoyoizq = sol.reactive('Fijo')
apoyoder = sol.reactive('Elastico')
pesoprop = sol.reactive(False)
forcepnt = sol.reactive(longitud.value / 2)
tipodiag = sol.reactive('Deformaciones')

@sol.component
def Page():
    sol.lab.theme.dark = False
    sol.lab.theme.themes.light.primary = "#000000"
    sol.Title('MiniShaftDesignerApp')
    with sol.AppBar():
        sol.Markdown('<span style="color:white">*Desarrollado por Junior A.H.*</span>')
    with sol.Sidebar():
        with sol.Details('Parametros de diseño', expand = False):
            with sol.Columns([1, 1]):
                with sol.Column():
                    sol.InputFloat(label = 'Longitud [mm]', value = longitud)
                    sol.InputFloat(label = 'Diametro externo [mm]', value = diameext)
                    sol.InputFloat(label = 'Fuerza [kN]', value = fuerza)
                    sol.Select(label = 'Apoyo izquierdo', values = ['Elastico', 'Fijo'], value = apoyoizq)
                with sol.Column():
                    sol.InputFloat(label = 'Densidad [kg/m3]', value = densidad)
                    sol.InputFloat(label = 'Diametro interno [mm]', value = diameint)
                    sol.InputFloat(label = 'Momento [kN.m]', value = momento)
                    sol.Select(label = 'Apoyo derecho', values = ['Elastico', 'Fijo'], value = apoyoder)
        sol.Markdown('#', unsafe_solara_execute = True)   
        with sol.Details('Parametros de resultados', expand = True):
            sol.Select(label = 'Diagrama de', values = ['Cortantes', 'Momentos', 'Pendientes', 'Deformaciones'], value = tipodiag)
            sol.SliderFloat(label = 'Ubicación de las cargas', value = forcepnt, min = 1, max = longitud.value, step = 1)
            sol.Checkbox(label = 'Incluir peso propio', value = pesoprop)
            sol.InputInt(label = 'Número de elementos', value = elements)
        Ecu_Ind, Ecu_Det, Val_Gra, rpts, Dom, Mat_Num, Val_Num, Num, Vcr_Ana, Vcr_Num, Por_Err = shaft_calc()
        sol.Markdown('#', unsafe_solara_execute = True)   
        with sol.Details('Velocidad Crítica', expand = False):
            with sol.Columns([1, 1]):
                with sol.Column():
                    sol.Markdown(r'$\text{Euler-Bernoulli: }$', unsafe_solara_execute = True)
                    sol.Markdown(r'$\text{Timoshenko: }$', unsafe_solara_execute = True)
                    sol.Markdown(r'$\text{Porcentaje de error: }$', unsafe_solara_execute = True)    
                with sol.Column():
                    sol.Markdown(f'${Vcr_Ana}$', unsafe_solara_execute = True)
                    sol.Markdown(f'${Vcr_Num}$', unsafe_solara_execute = True)
                    sol.Markdown(f'${Por_Err}$', unsafe_solara_execute = True)            
    
    with sol.Card(title = 'Esquema del eje de transmisión de potencia', subtitle = 'Ecuaciones analíticas vs Elementos finitos ', elevation = 5):
        with sol.Column(align = 'center'):
            axe1, fig1 = Plots('', '', 'equal', 12, 4, 0).figura()
            axe1.fill([0, longitud.value, longitud.value, 0], [0, 0, diameext.value, diameext.value], color = 'black')
            axe1.plot([[0, 0], [longitud.value, longitud.value]], [[diameext.value / 2 - diameint.value / 2, diameext.value / 2 + diameint.value / 2], [diameext.value / 2 - diameint.value / 2, diameext.value / 2 + diameint.value / 2]], '--w')
            axe1.plot([forcepnt.value, forcepnt.value], [diameext.value, 3 * diameext.value], linewidth = diameext.value / 7.5, color = 'black')
            if fuerza.value < 0:
                axe1.scatter([forcepnt.value], [diameext.value], 5 * diameext.value, marker = 'v', color = 'black')
            else:
                axe1.scatter([forcepnt.value], [3 * diameext.value], 5 * diameext.value, marker = '^', color = 'black')    
            if apoyoizq.value == 'Elastico':
                axe1.scatter([0], [0], 10 * diameext.value, marker = '^', color = 'black')
            else:
                axe1.scatter([0], [0], 10 * diameext.value, marker = 's', color = 'black')
            if apoyoder.value == 'Elastico':
                axe1.scatter([longitud.value], [0], 10 * diameext.value, marker = '^', color = 'black')
            else:
                axe1.scatter([longitud.value], [0], 10 * diameext.value, marker = 's', color = 'black')
            axe1.set_xlim([-0.05 * longitud.value, 1.05 * longitud.value])
            sol.FigureMatplotlib(fig1)
    
    with sol.Row():
        with sol.Column(align = 'stretch'):
            with sol.Card(title = 'Gráfica Analítica', subtitle = 'Ecuaciones analíticas', elevation = 5):
                axe2, fig2 = Plots('Dominio', tipodiag.value, 'auto', 10, 5, 1).figura()
                axe2.fill_between(Dom, Val_Gra, color = 'black', alpha = 1)
                sol.FigureMatplotlib(fig2)
        with sol.Column(align = 'stretch'):
            with sol.Card(title = 'Gráfica Numérica', subtitle = 'Elementos finitos', elevation = 5):
                axe3, fig3 = Plots('Dominio', tipodiag.value, 'auto', 10, 5, 1).figura()
                axe3.fill_between(Num, Val_Num, color = 'black', alpha = 1)
                sol.FigureMatplotlib(fig3)

    with sol.Card(title = '', subtitle = '', elevation = 5):
        with sol.lab.Tabs(align = 'center'):
            with sol.lab.Tab("Modelo de Euler Bernoulli - Ecuaciones analíticas"):
                with sol.Row():
                    with sol.Column(align = 'stretch'):
                        sol.Markdown(r'$\text{Ecuaciones indeterminadas iniciales:}$', unsafe_solara_execute = True)
                        for i in Ecu_Ind:
                            equ = sp.printing.latex(sp.N(i, 3))
                            sol.Markdown(f'${equ}$', unsafe_solara_execute = True)
                        sol.Markdown(r'$\text{Incognitas calculadas:}$', unsafe_solara_execute = True)
                        with sol.Row():
                            for i in rpts:
                                equ1 = sp.printing.latex(i)
                                equ2 = sp.printing.latex(sp.N(rpts[i], 3))
                                sol.Markdown(f'${equ1} \Rightarrow {equ2}$', unsafe_solara_execute = True)
                        sol.Markdown(r'$\text{Ecuaciones determinadas finales:}$', unsafe_solara_execute = True)
                        for i in Ecu_Det:
                            equ = sp.printing.latex(sp.N(i, 3))
                            sol.Markdown(f'${equ}$', unsafe_solara_execute = True)
            with sol.lab.Tab("Modelo de Timoshenko - Elementos finitos"):
                sol.DataFrame(pd.DataFrame(Mat_Num).round(1), items_per_page = 14, scrollable = True)
    plt.close('all')