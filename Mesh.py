import matplotlib.pyplot as plt
import numpy as np
import solara as sol

def mallado(nodos):
    x0  = np.array([0.21258347, 0.26571428, 0.27714286, 0.31428571, 0.35142857, 0.42285714,
                    0.32857141, 0.36163247, 0.37142857, 0.39714286, 0.43142857, 0.45714286,
                    0.49428576, 0.48571433, 0.48857143, 0.48285715, 0.49142858, 0.49428572,
                    0.62979578, 0.60122436, 0.58693864, 0.56979579, 0.55265293, 0.54122441,
                    0.76122439, 0.70979578, 0.69836721, 0.67265292, 0.62693864, 0.58693865])
    y0  = np.array([0.45180723, 0.51506024, 0.59938554, 0.67771084, 0.7419759 , 0.83938554,
                    0.44879518, 0.52108434, 0.60240964, 0.69373494, 0.75903614, 0.84238555,
                    0.43975904, 0.51204819, 0.59238555, 0.68072289, 0.74903615, 0.85238553,
                    0.44103797, 0.50731507, 0.60068856, 0.67201385, 0.76936322, 0.84867647,
                    0.45808616, 0.51936326, 0.60671265, 0.68803795, 0.75235117, 0.83165237])    
    x1  = np.resize(x0,(5,6))
    y1  = np.resize(y0,(5,6))
    x2  = x1.T
    y2  = y1.T
    nodos = nodos - 1
    new_x = []
    new_y = []
    x3    = [[] for i in range(4)]
    y3    = [[] for i in range(4)]
    for i in range(np.shape(x1)[0]):
        for j in range(np.shape(x1)[1] - 1):
            new_x.extend(list(np.linspace(x1[i][j], x1[i][j + 1], 2 + nodos)))
            new_y.extend(list(np.linspace(y1[i][j], y1[i][j + 1], 2 + nodos)))
    indexes = np.unique(new_x, return_index = True)[1]
    last_x  = [new_x[index] for index in sorted(indexes)]
    last_x  = np.resize(last_x, (np.shape(x1)[0], np.shape(x1)[1] * (nodos + 1) - nodos))
    indexes = np.unique(new_y, return_index = True)[1]
    last_y  = [new_y[index] for index in sorted(indexes)]
    last_y  = np.resize(last_y, (np.shape(y1)[0], np.shape(y1)[1] * (nodos + 1) - nodos))
    for i in range(len(x3)):
        final_x = np.array([last_x[i + 1], last_x[i]]).T
        final_y = np.array([last_y[i + 1], last_y[i]]).T
        x3[i]   = np.delete(np.delete(np.resize(final_x, (1, np.size(final_x)))[0], 0), -1)
        y3[i]   = np.delete(np.delete(np.resize(final_y, (1, np.size(final_y)))[0], 0), -1)
    x3 = np.vstack((x3[0], x3[1], x3[2], x3[3]))
    y3 = np.vstack((y3[0], y3[1], y3[2], y3[3]))
    plt.close('all')
    fig1, ax = plt.subplots(figsize=(5, 5))
    ax.plot(x3.T, y3.T, color = 'black', linestyle = 'solid', linewidth = 0.5)
    ax.plot(x1, y1, color = 'black', linewidth = 3)
    ax.plot(x2, y2, color = 'black', linewidth = 3)
    ax.scatter(x1, y1, color = 'black', s = 50)
    ax.set_aspect('equal')
    ax.axis('off')
    plt.tight_layout()
    ax1 = fig1.add_axes([0.65, 0.55, 0.25, 0.25])
    ax1.plot(x3.T, y3.T, color = 'black', linestyle = 'solid', linewidth = 0.5)
    ax1.plot(x1, y1, color = 'black', linewidth = 3)
    ax1.plot(x2, y2, color = 'black', linewidth = 3)
    ax1.scatter(x3, y3, color = 'black', s = 50)
    ax1.scatter(x1, y1, color = 'black')
    ax1.set_xlim(0.21, 0.37)
    ax1.set_ylim(0.41, 0.57)
    ax1.set_xticks([])
    ax1.set_yticks([])
    ax1.set_aspect('equal')

    x0  = np.array(np.hstack([1.00 * np.cos(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.75 * np.cos(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.50 * np.cos(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.25 * np.cos(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25))]))
    y0  = np.array(np.hstack([1.00 * np.sin(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.75 * np.sin(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.50 * np.sin(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25)),
                            0.25 * np.sin(np.linspace(0, 2 * np.pi, 25) + np.random.uniform(low=-0.01, high=0.01, size=25))]))
    x1  = np.resize(x0,(4,25))
    y1  = np.resize(y0,(4,25))
    x2  = x1.T
    y2  = y1.T
    new_x = []
    new_y = []
    x3    = [[] for i in range(3)]
    y3    = [[] for i in range(3)]
    for i in range(np.shape(x1)[0]):
        for j in range(np.shape(x1)[1] - 1):
            new_x.extend(list(np.linspace(x1[i][j], x1[i][j + 1], 2 + nodos)))
            new_y.extend(list(np.linspace(y1[i][j], y1[i][j + 1], 2 + nodos)))
    indexes = np.unique(new_x, return_index = True)[1]
    last_x  = [new_x[index] for index in sorted(indexes)]
    last_x  = np.resize(last_x, (np.shape(x1)[0], np.shape(x1)[1] * (nodos + 1) - nodos))
    indexes = np.unique(new_y, return_index = True)[1]
    last_y  = [new_y[index] for index in sorted(indexes)]
    last_y  = np.resize(last_y, (np.shape(y1)[0], np.shape(y1)[1] * (nodos + 1) - nodos))
    for i in range(len(x3)):
        final_x = np.array([last_x[i + 1], last_x[i]]).T
        final_y = np.array([last_y[i + 1], last_y[i]]).T
        x3[i]   = np.delete(np.delete(np.resize(final_x, (1, np.size(final_x)))[0], 0), -1)
        y3[i]   = np.delete(np.delete(np.resize(final_y, (1, np.size(final_y)))[0], 0), -1)
    x3 = np.vstack((x3[0], x3[1], x3[2]))
    y3 = np.vstack((y3[0], y3[1], y3[2]))
    fig2, ax = plt.subplots(figsize=(5, 5))
    ax.plot(x3.T, y3.T, color = 'black', linestyle = 'solid', linewidth = 0.5)
    ax.plot(x1, y1, color = 'black', linewidth = 3)
    ax.plot(x2, y2, color = 'black', linewidth = 3)
    ax.scatter(x1, y1, color = 'black', s = 50)
    ax.set_aspect('equal')
    ax.axis('off')
    plt.tight_layout()
    ax1 = fig2.add_axes([0.65, 0.55, 0.25, 0.25])
    ax1.plot(x3.T, y3.T, color = 'black', linestyle = 'solid', linewidth = 0.5)
    ax1.plot(x1, y1, color = 'black', linewidth = 3)
    ax1.plot(x2, y2, color = 'black', linewidth = 3)
    ax1.scatter(x3, y3, color = 'black', s = 50)
    ax1.scatter(x1, y1, color = 'black')
    ax1.set_xlim(0.50, 0.90)
    ax1.set_ylim(0.35, 0.75)
    ax1.set_xticks([])
    ax1.set_yticks([])
    ax1.set_aspect('equal')
    return fig1, fig2

elements = sol.reactive(0)
@sol.component
def Page():
    sol.lab.theme.dark = False
    sol.lab.theme.themes.light.primary = "#000000"
    sol.Title('Algoritmo de mallado')
    with sol.AppBar():
        sol.Markdown('<span style="color:white">*Desarrollado por Junior A.H.*</span>')
    fig1, fig2 = mallado(elements.value)
    with sol.Card(title = '', subtitle = '', elevation = 5):
        sol.SliderInt('Nivel de refinamiento:', value = elements, min = 0, max = 7)
        with sol.Columns([1, 1]):
            with sol.Column(align = 'center'):
                sol.FigureMatplotlib(fig1)
            with sol.Column(align = 'center'):
                sol.FigureMatplotlib(fig2)                                    

    