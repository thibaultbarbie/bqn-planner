import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, PillowWriter
import csv
import numpy as np

data = []
with open('solution.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        d = []
        d.append(float(row[0]))
        d.append(float(row[1]))
        d.append(float(row[2]))
        data.append(d)

data_numpy = np.array(data)

l = np.array([0.5, 0.5, 0.5])
def FK(q):
    res = np.zeros((2, l.shape[0]+1))
    q_vec = np.add.accumulate(q)
    res[0,1:] = np.add.accumulate(l * np.cos(q_vec))
    res[1,1:] = np.add.accumulate(l * np.sin(q_vec))
    return res

fig = plt.figure()
ax = plt.axes(xlim=(-2, 2), ylim=(-1, 2))

circle = plt.Circle((0, 1), 0.173, color=np.array([97, 76, 117])/255)
ax.add_patch(circle)

circle2 = plt.Circle((-0.5, 0), 0.173, color=np.array([97, 76, 117])/255)
ax.add_patch(circle2)

circle3 = plt.Circle((1, 1.1), 0.08, color=np.array([97, 76, 117])/255)
ax.add_patch(circle3)

circle4 = plt.Circle((-1, 1), 0.08, color=np.array([97, 76, 117])/255)
ax.add_patch(circle4)

line, = ax.plot([], [])

def init():
    line.set_data([], [])
    return line,

def animate(i):
    p = FK(data_numpy[i]*np.pi)
    line.set_data(p[0,:], p[1,:])
    return line,

plt.gca().set_aspect("equal")
ax.get_xaxis().set_ticks([])
ax.get_yaxis().set_ticks([])
anim = FuncAnimation(fig, animate, init_func=init, frames=data_numpy.shape[0],
                     interval=20, blit=True)
#anim.save("workspace_plan.gif", dpi=100, writer=PillowWriter(fps=25))
plt.show()

