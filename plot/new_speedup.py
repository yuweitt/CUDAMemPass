#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt
import matplotlib

application = []
EDM = []
UM = []
Tuned = []
EDMs = []
UMs = []
Tuneds = []
NUM = 8
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
                Tuned.append(float(num[-1]))
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
                # print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                EDM.append(float(num[-1]))
                idx += 1
            break
        else:
            continue

for i, num in enumerate(EDM):
    # EDM[i] = round(float(num)/float(UM[i]), 1)
    # Tuned[i] = round(float(Tuned[i])/float(UM[i]), 1)
    En = round(float(UM[i])/float(EDM[i]), 1)
    Tn = round(float(UM[i])/float(Tuned[i]), 1)
    UM[i] = 1
    print(En)
    print(Tn)
    EDMs.append(round(En, 1))
    Tuneds.append(round(Tn, 1))
print(application)
# print(Tuned)
colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(len(application))

def draw(ax):
    ax.bar(xpos-width, UM, align='center', width=width, alpha=0.9, color='#4073FF', label = 'UM',)
    ax.bar(xpos, EDMs, align='center', width=width, alpha=0.9, color='#FAD000', label = 'EDM',)
    ax.bar(xpos+width, Tuneds, align='center', width=width, alpha=0.9, color='#7ECC49', label = 'Tuned')

fig, (ax1, ax2) =plt.subplots(2, 1, figsize = (14,8), gridspec_kw={'height_ratios': [1, 2]}) 
# bars1 = plt.bar(xpos-width, SpeedupOverEDM, align='center', width=width, alpha=0.9, color='#7ECC49', label = 'Tuned/EDM',)
# bars2 = plt.bar(xpos, SpeedupOverUM, align='center', width=width, alpha=0.9, color='#4073FF', label = 'Tuned/UM')
# bars3 = plt.bar(xpos-width, EDM, align='center', width=width, alpha=0.9, color='#FAD000', label = 'Tuned/UM')
draw(ax1)
draw(ax2)


# For your case
plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")
# plt.grid(axis='y')

ax1.set_xticks(xpos) 
ax1.set_xticklabels(application)  

ax1.spines['bottom'].set_visible(False)
ax2.spines['top'].set_visible(False)
ax1.xaxis.tick_top()
ax1.tick_params(labeltop=False)  # don't put tick labels at the top
ax2.xaxis.tick_bottom()
# plt.figure(figsize=(14,8))
# plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
# plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
# plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')
ax1.set_ylim(40, 46) # Top graph
ax2.set_ylim(0, 10) # Bottom graph

# Adds slanted lines to axes
d = .5  # proportion of vertical to horizontal extent of the slanted line
kwargs = dict(
    marker=[(-1, -d), (1, d)],
    markersize=12,
    linestyle='none',
    color='k',
    mec='k',
    mew=1,
    clip_on=False
)
ax1.plot([0, 1], [0, 0], transform=ax1.transAxes, **kwargs)
ax2.plot([0, 1], [1, 1], transform=ax2.transAxes, **kwargs)
ax1.tick_params(direction='out', length=6, width=2)


ax2.set_xticks(xpos) 
ax2.set_xticklabels(application, fontsize = 12, rotation = 30)  

fig.tight_layout(pad=.5)


fig.subplots_adjust(top=0.9, bottom=0.12, left=0.1, right=0.92)
fig.text(0.05, 0.5, 'Speedup over UM', ha='center', va='center', rotation='vertical', fontsize = 20, fontname = 'Padauk Book')
fig.text(0.5, 0.95, "Kernel Execution Speedup", ha='center', va='center', fontsize = 20, fontname = 'Padauk Book')
# fig.text(0.5, 0.04, 'Tuning Iteration', ha='center', va='center', fontsize = 16)
matplotlib.rc('xtick', labelsize=40) 
matplotlib.rc('ytick', labelsize=40) 

# plt.xticks(rotation=30, fontsize=12)
# plt.yticks(fontsize=16)
# plt.ylabel('Speedup over UM and EDM', fontsize=20, fontname = 'Padauk Book')

plt.margins(x=0.05)
# plt.ylim(0,1.05)

# plt.legend(loc="lower left",bbox_to_anchor=(1.0,1.0))



ax1.legend(fontsize = 16, loc=2)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()