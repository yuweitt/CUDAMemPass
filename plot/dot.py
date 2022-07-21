#Group Bar chart
import re
import random
import numpy as np
import matplotlib.pyplot as plt

INPUT = ["2048", "4096", "8192", "16384", "32768"]
EDM_INPUT = ["2048", "4096", "8192", "16384"]
EDM = [2.57631,	6.05008,	58.9122,	573.919]
UM = [10.337,	34.4695,	129.661,	755.835,	7854.938]
Tuned = [2.8084,	6.59051,	52.5987,	515.528,	3089.735]


print(EDM)
print(UM)
print(Tuned)
colors = ['#96C3EB', '#7ECC49', '#EB96EB', 'r', 'b']
colors = ['#AFB83B', '#299438', '#4073FF', 'r', 'b']
# labels = ['AAA','BBB','CCC','DDD','EEE','FFF','GGG','HHH','III','JJJ']
# data1 = [7, 17, 4, 9, 14, 6, 14, 16, 12, 9]
# data2 = [22,  0, 26, 14, 21, 12,  6, 24,  0, 22]
width = 0.2
xpos = np.arange(len(INPUT))

fig, ax = plt.subplots(figsize=(14,8))
# plt.figure(figsize=(15,10),dpi=100,linewidth = 2)
bars1 = plt.plot(INPUT, UM,'s-', color='#4073FF', label = 'UM',)
bars3 = plt.plot(EDM_INPUT, EDM, 's-', color='#FAD000', label = 'EDM')
bars2 = plt.plot(INPUT, Tuned,'s-', color='#7ECC49', label = 'Tuned')

# For your case
# plt.axhline(y=1.0,linewidth=1, color='k', linestyle ="--")



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

# plt.figure(figsize=(14,8))
# plt.bar(application,kernel,color="#1f77b4",label="Kernel", edgecolor='black')
# plt.bar(application,HtoD,color="#ff7f0e",bottom=np.array(kernel),label="HtoD", edgecolor='black')
# plt.bar(application,DtoH,color="#FFFF00",bottom=np.array(kernel)+np.array(HtoD),label="DtoH", edgecolor='black')

ax.set_xticks(xpos) 
ax.set_xticklabels(INPUT)  
# plt.xlabel('Input Size', fontsize=20)

plt.xticks(rotation=30, fontsize=12)
plt.yticks(fontsize=16)
plt.ylabel('Execution Time (ms)', fontsize=20, labelpad=20)#, fontname = 'Padauk Book')

# plt.margins(x=0.05)
# plt.ylim(0,1.05)

# plt.legend(loc="lower left",bbox_to_anchor=(1.0,1.0))



plt.legend(fontsize = 20)
filePath = "./draw."
plt.savefig(filePath + "png", transparent=True)
# plt.show()