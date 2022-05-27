#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

application = []
EDM = []
UM = []
Tuned = []
Speedup = []
fName = "time"
filePath = "" + fName + "."
with open(filePath + "txt", "r") as f:
    lines = f.readlines()
    length = len(lines)
    idx = 0
    case = 0

    while idx < length:
        if(lines[idx] == '' or lines[idx] == "\n"):
            idx = idx + 1
            continue
        if case == 0:
            for i in range(11):
                print(i, lines[idx])
                application.append(lines[idx].replace("\n", ""))
                idx += 1
            case = 1
            continue
        elif case == 1:
            for i in range(11):
                print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                UM.append(num[-1])
                idx += 1
            case = 2
            continue
        elif case == 2:
            for i in range(11):
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                Tuned.append(num[-1])
                idx += 1
            break
        else:
            continue

        # l0 = lines[idx].replace("\n", "")
        # l1 = re.findall("\d+\.\d+", lines[idx + 1].replace("\n", ""))
        # l2 = re.findall("\d+\.\d+", lines[idx + 2].replace("\n", ""))
        # l3 = re.findall("\d+\.\d+", lines[idx + 3].replace("\n", ""))
        # # print(l1)
        # # print(l2)
        # # print(l3)
        # application.append(l0)
        # EDM.append(float(l1[-1]))
        # UM.append(float(l2[-1]))
        # Tuned.append(float(l3[-1]))
        # idx = idx + 5
for i, num in enumerate(UM):
    n = float(num)/float(Tuned[i])
    Speedup.append(round(n, 1))
print(application)
# print(EDM)
# print(UM)
# print(Tuned)
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.3
xpos = np.arange(len(application))


fig, ax = plt.subplots(figsize=(10,8))
# bars1 = plt.bar(xpos-width, EDM, align='center', width=width, alpha=0.9, color='#1f77b4', label = 'EDM')
bars2 = plt.bar(xpos, Speedup, align='center', width=width, alpha=0.9, color='#ff7f0e', label = 'Speedup')
# bars3 = plt.bar(xpos+width, Tuned, align='center', width=width, alpha=0.9, color='#FFFF00', label = 'Tuned')

ax.set_xticks(xpos) 
ax.set_xticklabels(application)  

def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
              xy=(rect.get_x() + rect.get_width() / 2, height),
              xytext=(0, 3),  # 3 points vertical offset
              textcoords="offset points",
              ha='center', va='bottom'
              )
# autolabel(bars1)
autolabel(bars2)
# autolabel(bars3)

plt.legend()
filePath = "./draw."
plt.savefig(filePath + "png")
# plt.show()