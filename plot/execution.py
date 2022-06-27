#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

application = []
EDM = []
UM = []
Tuned = []
SpeedupOverEDM = []
SpeedupOverUM = []
NUM = 9
fName = "time_kernel"
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
            for i in range(NUM):
                application.append(lines[idx].replace("\n", ""))
                idx += 1
            case = 1
            continue
        elif case == 1:
            for i in range(NUM):
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                EDM.append(float(num[-1]))
                idx += 1
            case = 2
            continue
        elif case == 2:
            for i in range(NUM):
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                UM.append(float((num[-1])))
                idx += 1
            case = 3
            continue
        elif case == 3:
            for i in range(NUM):
                print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                Tuned.append(float(num[-1]))
                idx += 1
            break
        else:
            continue

for i, num in enumerate(EDM):
    EDM[i] = round(float(num)/float(UM[i]), 1)
    Tuned[i] = round(float(Tuned[i])/float(UM[i]), 1)
    UM[i] = 1
print(application)
print(EDM)
print(UM)
print(Tuned)
colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(len(application))


fig, ax = plt.subplots(figsize=(14,8))
bars1 = plt.bar(xpos+width, UM, align='center', width=width, alpha=0.9, color='#4073FF', label = 'UM')
bars2 = plt.bar(xpos, Tuned, align='center', width=width, alpha=0.9, color='#7ECC49', label = 'Tuned')
bars3 = plt.bar(xpos-width, EDM, align='center', width=width, alpha=0.9, color='#FAD000', label = 'EDM')

# For your case
plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")
plt.grid(axis='y')

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
# autolabel(bars2)
# autolabel(bars3)

# plt.figure(figsize=(14,8))
# plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
# plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
# plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')

plt.xticks(rotation=30, fontsize=12)
plt.yticks(fontsize=16)
plt.ylabel('Execution Time', fontsize=20, fontname = 'Padauk Book')

plt.margins(x=0.05)
# plt.ylim(0,1.05)

# plt.legend(loc="lower left",bbox_to_anchor=(1.0,1.0))



plt.legend(fontsize=16)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()