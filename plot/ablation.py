#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

ALL = []
UM = [10582.5791]
Tuned = [3607.538623]
woAdvise = [10850.56797]
woPrefetch = [3484.87749]
NAME = ["UM", "Tuned", "Tuned w/o Advise", "Tuned w/o Prefetch"]

Tuned[0] = (round(float(UM[0])/float(Tuned[0]), 1))
woAdvise[0] = (round(float(UM[0])/float(woAdvise[0]), 1))
woPrefetch[0] = (round(float(UM[0])/float(woPrefetch[0]), 1))
UM[0] = 1


print(Tuned)
print(woAdvise)
print(woPrefetch)

colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(1)


fig, ax = plt.subplots(figsize=(16,8))
bars1 = plt.bar(xpos - 1.5 * width, UM, align='center', width=width/2, alpha=0.9, color='#7ECC49', label = 'UM',)
bars2 = plt.bar(xpos - 0.5 * width, Tuned, align='center', width=width/2, alpha=0.9, color='#EB96EB', label = 'Tuned',)
bars3 = plt.bar(xpos + 0.5 * width, woAdvise, align='center', width=width/2, alpha=0.9, color='#299438', label = 'Tuned w/o Advise',)
bars4 = plt.bar(xpos + 1.5 * width, woPrefetch, align='center', width=width/2, alpha=0.9, color='#4073FF', label = 'Tuned w/o Prefetch',)

# For your case
plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")

plt.ylabel('Speedup Over UM') 

plt.title('nw', fontsize = 24)

plt.tick_params(
    axis='x',          # changes apply to the x-axis
    which='both',      # both major and minor ticks are affected
    bottom=False,      # ticks along the bottom edge are off
    top=False,         # ticks along the top edge are off
    labelbottom=False)

# plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
# plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
# plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')

plt.yticks(fontsize=16)
plt.ylabel('Speedup over UM', fontsize=20, fontname = 'Padauk Book')

plt.margins(x=0.05)
# plt.ylim(0,1.05)



plt.legend(loc=2, fontsize = 14)
filePath = "./draw."
plt.savefig(filePath + "png")
# plt.show()