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
print(data_numpy)
plt.plot(data_numpy[:,0], data_numpy[:,1], color = "green")


circle = plt.Circle((0.5, 0.5), 0.173, color=np.array([97, 76, 117])/255)
ax = plt.gca()

ax.add_patch(circle)
plt.xlim([0, 1])
plt.ylim([0, 1])

plt.gca().set_aspect('equal')
plt.show()
