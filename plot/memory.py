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
            break
            # continue
        # elif case == 9:
        #     getList(Tuned, idx)
        #     case = 10
        #     continue
        # elif case == 10:
        #     getList(UM, idx)
        #     case = 11
        #     continue
        # elif case == 11:
        #     getList(EDM, idx)
        #     case = 12
        #     break
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
    # num += Tuned[i]
    TunedAll.append(num)

for i in range(NUM):
    num = 0
    num += UMHtoD[i]
    num += UMDtoH[i]
    num += UMPageFault[i]
    # num += UM[i]
    UMAll.append(num)

for i in range(NUM):
    num = 0
    num += EDMHtoD[i]
    num += EDMDtoH[i]
    # num += EDM[i]
    EDMAll.append(num)

print(UMAll)
print(TunedAll)
print(EDMAll)

for i in range(NUM):
    TunedHtoD[i] /=  UMAll[i]
    UMHtoD[i] /= UMAll[i]
    EDMHtoD[i] /= UMAll[i]
    TunedDtoH[i] /= UMAll[i]
    UMDtoH[i] /= UMAll[i]
    EDMDtoH[i] /= UMAll[i]
    UMPageFault[i] /= UMAll[i]
    TunedPageFault[i] /= UMAll[i]

# print((EDMHtoD[5]+EDMDtoH[5])/(TunedHtoD[5]+TunedDtoH[5]+TunedPageFault[5]))
print(UMHtoD[5]/UMAll[5])
print(UMDtoH[5]/UMAll[5])
print(UMPageFault[5]/UMAll[5])
# print(TunedHtoD[0])
# print(TunedDtoH[0])
# print(UMAll[0])
# print(UMHtoD)
# print(EDMHtoD)

colors = ['#1f77b4', '#ff7f0e', '#2ca02c', 'r', 'b']



# plt.figure(figsize=(16,8))
# plt.bar(application,UMHtoD,color="#4073FF",label="UMHtoD", edgecolor='black')
# plt.bar(application,UMDtoH,color="#7ECC49",bottom=np.array(UMHtoD),label="UMDtoH", edgecolor='black')
# plt.bar(application,UMPageFault,color="#FAD000",bottom=np.array(UMHtoD)+np.array(UMDtoH),label="UMPageFault", edgecolor='black')

width = 0.2
xpos = np.arange(len(application))
fig, ax = plt.subplots(figsize=(36,20))
handles, labels = plt.gca().get_legend_handles_labels()

UM_hatch = 'x'
Tuned_hatch = '+'
EDM_hatch = '.'

x = xpos-1.1*width
y = xpos
z = xpos+1.1*width

barsUM_1 = plt.bar(x, UMHtoD, align='center', width=width, alpha=0.9, color='#4073FF', label = 'HtoD', hatch=UM_hatch)
barsUM_2 = plt.bar(x, UMDtoH, bottom=np.array(UMHtoD), align='center', width=width, alpha=0.9, color='#7ECC49', label = 'UM', hatch=UM_hatch)
barsUM_3 = plt.bar(x, UMPageFault, bottom=np.array(UMHtoD)+np.array(UMDtoH), align='center', width=width, alpha=0.9, color='#FAD000', label = 'UM', hatch=UM_hatch)

barsTuned_1 = plt.bar(z, TunedHtoD, align='center', width=width, alpha=0.9, color='#4073FF', label = 'HtoD', hatch=Tuned_hatch)
barsTuned_2 = plt.bar(z, TunedDtoH, bottom=np.array(TunedHtoD), align='center', width=width, alpha=0.9, color='#7ECC49', label = 'UM', hatch=Tuned_hatch)
barsTuned_3 = plt.bar(z, TunedPageFault, bottom=np.array(TunedHtoD)+np.array(TunedDtoH), align='center', width=width, alpha=0.9, color='#FAD000', label = 'UM', hatch=Tuned_hatch)


barsEDM_1 = plt.bar(y, EDMHtoD, align='center', width=width, alpha=0.9, color='#4073FF', label = 'HtoD', hatch=EDM_hatch)
barsEDM_2 = plt.bar(y, EDMDtoH, bottom=np.array(EDMHtoD), align='center', width=width, alpha=0.9, color='#7ECC49', label = 'UM', hatch=EDM_hatch)


# For your case
plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")
# plt.grid(axis='y')

ax.set_xticks(xpos) 
ax.set_xticklabels(application)  

plt.xticks(rotation=30, fontsize=24)
plt.yticks(fontsize=32)
plt.ylabel('Normalized Traffic Time', fontsize=54, fontname = 'Padauk Book', labelpad=30)
plt.title("Memory Movement Time", fontsize=54, y=1.04, fontname = 'Padauk Book')
plt.margins(x=0.05)

HtoD_patch = mpatches.Patch(color='#4073FF', label='HtoD')
DtoH_patch = mpatches.Patch(color='#7ECC49', label='DtoH')
Fault_patch = mpatches.Patch(color='#FAD000', label='GPU Page Fault')


UM_patch = mpatches.Patch(facecolor='white', alpha = 0.9, label='UM', hatch=UM_hatch)
Tuned_patch = mpatches.Patch(facecolor='white', label='Tuned', hatch=Tuned_hatch)
EDM_patch = mpatches.Patch(facecolor='white', label='EDM', hatch=EDM_hatch)

handles.extend([HtoD_patch, DtoH_patch, Fault_patch, UM_patch,  EDM_patch, Tuned_patch])


plt.legend(fontsize=40, ncol=2, handles=handles, loc=2)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()