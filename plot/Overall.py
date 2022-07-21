#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

application = []

TunedHtoD = []
UMHtoD = []
EDMHtoD = []
TunedDtoH = []
UMDtoH = []
EDMDtoH = []
UMPageFault = []
TunedPageFault = []

Tuned = []
UM = []
EDM = []

NUM = 8
fName = "memory"
filePath = "" + fName + "."

def getList(lst, idx):
    for i in range(NUM):
        # print(lines[idx])
        num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
        lst.append(float(num[-1]))
        idx += 1

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
                # print(lines[idx])
                application.append(lines[idx].replace("\n", ""))
                idx += 1
            case = 1
            continue
        elif case == 1:
            getList(TunedHtoD, idx)
            idx += NUM
            case = 2
            continue
        elif case == 2:
            getList(UMHtoD, idx)
            idx += NUM
            case = 3
            continue
        elif case == 3:
            getList(EDMHtoD, idx)
            idx += NUM
            case = 4
            continue
        elif case == 4:
            getList(TunedDtoH, idx)
            idx += NUM
            case = 5
            continue
        elif case == 5:
            getList(UMDtoH, idx)
            idx += NUM
            case = 6
            continue
        elif case == 6:
            getList(EDMDtoH, idx)
            idx += NUM
            case = 7
            continue
        elif case == 7:
            getList(UMPageFault, idx)
            idx += NUM
            case = 8
            continue
        elif case == 8:
            getList(TunedPageFault, idx)
            case = 9
            continue
        elif case == 9:
            getList(Tuned, idx)
            case = 10
            continue
        elif case == 10:
            getList(UM, idx)
            case = 11
            continue
        elif case == 11:
            getList(EDM, idx)
            case = 12
            break
        else:
            continue

# print(TunedHtoD)
# print(UMHtoD)
# print(EDMHtoD)
# print(TunedDtoH)
# print(UMDtoH)
# print(EDMDtoH)
# print(UMPageFault)
# print(TunedPageFault)


TunedAll = []
UMAll = []
EDMAll = []
# num = 0
for i in range(NUM):
    num = 0
    num += TunedHtoD[i]
    num += TunedDtoH[i]
    num += TunedPageFault[i]
    num += Tuned[i]
    TunedAll.append(num)

for i in range(NUM):
    num = 0
    num += UMHtoD[i]
    num += UMDtoH[i]
    num += UMPageFault[i]
    num += UM[i]
    UMAll.append(num)

for i in range(NUM):
    num = 0
    num += EDMHtoD[i]
    num += EDMDtoH[i]
    num += EDM[i]
    EDMAll.append(num)

SpeedupOverEDM = []
SpeedupOverUM = []

average = 0

for i, num in enumerate(EDMAll):
    EDMAll[i] = round(float(EDMAll[i])/float(TunedAll[i]), 1)
    # EDMAll[i] = round(float(UMAll[i])/float(num), 1)
    average += round(float(EDMAll[i])/float(TunedAll[i]), 1)
    TunedAll[i] = round(float(UMAll[i])/float(TunedAll[i]), 1)
    UMAll[i] = 1
    # En = round(float(num)/float(TunedAll[i]), 1)
    # Un = round(float(UMAll[i])/float(TunedAll[i]), 1)
    # SpeedupOverEDM.append(round(En, 1))
    # SpeedupOverUM.append(round(Un, 1))
print(application)
print(UMAll)
print(TunedAll)
print(EDMAll)
print(average/NUM)
colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(len(application))


fig, ax = plt.subplots(figsize=(14,8))
bars2 = plt.bar(xpos-1.1*width, UMAll, align='center', width=width, alpha=0.9, color='#4073FF', label = 'UM')
bars3 = plt.bar(xpos, EDMAll, align='center', width=width, alpha=0.9, color='#FAD000', label = 'EDM')
bars1 = plt.bar(xpos+1.1*width, TunedAll, align='center', width=width, alpha=0.9, color='#7ECC49', label = 'Tuned',)



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
plt.ylabel('Speedup over UM', fontsize=20, fontname = 'Padauk Book', labelpad=20)
plt.title("Overall Speedup", fontsize = 24, fontname = 'Padauk Book', y = 1.02)


plt.margins(x=0.05)
# plt.ylim(0,1.05)

# plt.legend(loc="lower left",bbox_to_anchor=(1.0,1.0))



plt.legend(fontsize = 16, loc=1)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)