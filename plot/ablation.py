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
UM = [7545.939355, 10582.5791]
Tuned = [3380.263403, 3607.538623]
woAdvise = [3529.652124, 10850.56797]
woPrefetch = [9939.78584, 3484.87749]
NAME = ["UM", "Tuned", "Tuned w/o Advise", "Tuned w/o Prefetch"]
application = ["NW", "GESUMMV"]

for i in range(0, 2):
    Tuned[i] = (round(float(UM[i])/float(Tuned[i]), 1))
    woAdvise[i] = (round(float(UM[i])/float(woAdvise[i]), 1))
    woPrefetch[i] = (round(float(UM[i])/float(woPrefetch[i]), 1))
UM[0] = 1
UM[1] = 1


print(Tuned)
print(woAdvise)
print(woPrefetch)

colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(2)
divWidth = 1.2


fig, ax = plt.subplots(figsize=(12,8))
bars1 = plt.bar(xpos - 1.5 * width, UM, align='center', width=width/divWidth, color='#5579c6', label = 'UM',hatch='\\')
bars2 = plt.bar(xpos - 0.5 * width, Tuned, align='center', width=width/divWidth, color='#2a9df4', label = 'Tuned',hatch='/')
bars3 = plt.bar(xpos + 0.5 * width, woAdvise, align='center', width=width/divWidth, color='#1167b1', label = 'Tuned w/o Advise',hatch='/\\')
bars4 = plt.bar(xpos + 1.5 * width, woPrefetch, align='center', width=width/divWidth, color='#1c4c74', label = 'Tuned w/o Prefetch',hatch='\\-')

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
ax.set_xticklabels(application, fontsize = 16)  

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