#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

# ALL = []
# UM = [10582.5791]
# Tuned = [3607.538623]
# woAdvise = [10850.56797]
# woPrefetch = [3484.87749]
# NAME = ["UM", "Tuned", "Tuned w/o Advise", "Tuned w/o Prefetch"]


ALL = []
UM = []
Tuned = []
Advise = []
Prefetch = []
NAME = ["UM", "Tuned", "Advise only", "Prefetch only"]
application = []

NUM = 8
fName = "ablation"
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
                UM.append(float(num[-1]))
                idx += 1
            case = 2
            continue
        elif case == 2:
            for i in range(NUM):
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                Tuned.append(float((num[-1])))
                idx += 1
            case = 3
            continue
        elif case == 3:
            for i in range(NUM):
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                Advise.append(float((num[-1])))
                idx += 1
            case = 4
            continue
        elif case == 4:
            for i in range(NUM):
                # print(lines[idx])
                num = re.findall("\d+\.\d+", lines[idx].replace("\n", ""))
                Prefetch.append(float(num[-1]))
                idx += 1
            break
        else:
            continue

print(application)
print(Advise)





for i in range(NUM):
    Tuned[i] = (round(float(UM[i])/float(Tuned[i]), 2))
    Advise[i] = (round(float(UM[i])/float(Advise[i]), 2))
    Prefetch[i] = (round(float(UM[i])/float(Prefetch[i]), 2))
    UM[i] = 1


print(Tuned)
print(Advise)
print(Prefetch)

colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(len(application))
divWidth = 1.2


fig, ax = plt.subplots(figsize=(14,8))
bars2 = plt.bar(xpos - 0.5 * width, Tuned, align='center', width=width/divWidth, color='#7ECC49', label = 'Tuned')#,hatch='/')
bars1 = plt.bar(xpos - 1.5 * width, UM, align='center', width=width/divWidth, color='#4073FF', label = 'UM')#,hatch='\\')
bars3 = plt.bar(xpos + 0.5 * width, Advise, align='center', width=width/divWidth, color='#FAD000', label = 'Advise only')#,hatch='/\\')
bars4 = plt.bar(xpos + 1.5 * width, Prefetch, align='center', width=width/divWidth, color='#FF9933', label = 'Prefetch only')#,hatch='\\-')

# For your case
plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")

plt.ylabel('Speedup Over UM') 

# plt.title('Ablation', fontsize = 24)


# plt.tick_params(
#     axis='x',          # changes apply to the x-axis
#     which='both',      # both major and minor ticks are affected
#     bottom=False,      # ticks along the bottom edge are off
#     top=False,         # ticks along the top edge are off
#     labelbottom=False)

ax.set_xticks(xpos) 
ax.set_xticklabels(application, fontsize = 12, rotation = 30)  

# plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
# plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
# plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')

plt.yticks(fontsize=16)
plt.ylabel('Speedup over UM', fontsize=20, fontname = 'Padauk Book')

# plt.grid(axis='y', color = "black")
plt.margins(x=0.05)
# plt.ylim(0,1.05)



plt.legend(loc=2, fontsize = 14)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()