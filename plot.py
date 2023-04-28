import matplotlib.pyplot as plt
import csv
import numpy as np

data = []
with open('solution.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        d = []
        d.append(float(row[0]))
        d.append(float(row[1]))
        data.append(d)

data_numpy = np.array(data)
plt.plot(data_numpy[:,0], data_numpy[:,1], color = "green")

ax = plt.gca()

circle = plt.Circle((0.5, 0.5), 0.173, color=np.array([97, 76, 117])/255)
ax.add_patch(circle)

start_circle = plt.Circle((data_numpy[0,0], data_numpy[0,1]), 0.01, color="blue")
ax.add_patch(start_circle)

goal_circle = plt.Circle((data_numpy[-1,0], data_numpy[-1,1]), 0.01, color="red")
ax.add_patch(goal_circle)

plt.xlim([0, 1])
plt.ylim([0, 1])

plt.gca().set_aspect('equal')
plt.show()
