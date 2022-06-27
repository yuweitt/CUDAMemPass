#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

application = []
kernel = []
HtoD = []
DtoH = []
NUM = 12
fName = "P"
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
                print(lines[idx])
                application.append(lines[idx].replace("\n", ""))
                idx += 1
            case = 1
            continue
        elif case == 1:
            for i in range(NUM):
                print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                kernel.append(float(num[-1]))
                idx += 1
            case = 2
            continue
        elif case == 2:
            for i in range(NUM):
                print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                HtoD.append(float((num[-1])))
                idx += 1
            case = 3
            continue
        elif case == 3:
            for i in range(NUM):
                print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                DtoH.append(float(num[-1]))
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
# for i, num in enumerate(UM):
#     n = float(num)/float(Tuned[i])
#     Speedup.append(round(n, 1))
print(application)
print(kernel)
print(HtoD)
print(DtoH)
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
# width = 0.3
# xpos = np.arange(len(application))


# fig, ax = plt.subplots(figsize=(10,8))
# bars1 = plt.bar(xpos, kernel, align='center', width=width, alpha=0.9, color='#1f77b4', label = 'kernel',)
# bars2 = plt.bar(xpos, HtoD, align='center', width=width, alpha=0.9, color='#ff7f0e', label = 'HtoD', bottom=kernel)
# bars3 = plt.bar(xpos, DtoH, align='center', width=width, alpha=0.9, color='#FFFF00', label = 'DtoH', bottom=HtoD)

# plt.bar(x, math_scores, color='blue', label='Math')
# plt.bar(x, history_scores, color='green', label='History', bottom=math_scores)



# ax.set_xticks(xpos) 
# ax.set_xticklabels(application)  


# def autolabel(rects):
#     """Attach a text label above each bar in *rects*, displaying its height."""
#     for rect in rects:
#         height = rect.get_height()
#         ax.annotate('{}'.format(height),
#               xy=(rect.get_x() + rect.get_width() / 2, height),
#               xytext=(0, 3),  # 3 points vertical offset
#               textcoords="offset points",
#               ha='center', va='bottom'
#               )
# autolabel(bars1)
# autolabel(bars2)
# autolabel(bars3)

plt.figure(figsize=(16,8))
plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')

plt.xticks(rotation=30, fontsize=12)
plt.yticks(fontsize=14)
plt.ylabel('Percentage of Function in runtime', fontsize=18, fontname = 'Padauk Book')

plt.margins(x=0.05)
plt.ylim(0,1.05)

plt.legend(loc=2,bbox_to_anchor=(-0.165,1.0), fontsize = 16)



filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()