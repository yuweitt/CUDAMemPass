import matplotlib.pyplot as plt
import random, math
import matplotlib
import plottools
matplotlib.use('Agg')

y = []
fName = "GESUMMV"
minList = []
filePath = "" + fName + "."
with open(filePath + "txt", "r") as f:
    lines = f.readlines()
    MIN = float(lines[0].replace("\n", ""))
    minList.append(0)
    for i, line in enumerate(lines):
        # y.append(float(line.replace("\n", "")))
        num = float(line.replace("\n", ""))
        # 238 27
        # if i > 117:
        #     break
        # if num > 15000:
        #     continue
        if num < MIN:
            MIN = num
            minList.append(i)
        y.append(MIN-1)

    idx = range(0, len(y), 1)
    print(idx)
    print(minList)

def plot(ax):
    ax.plot(idx, y, color="blue", markevery=minList, \
        marker='.', linestyle='solid',  mfc='none', \
        mec='black', markersize=15)

fig, (ax1, ax2) = plt.subplots(2, 1, figsize = (8, 6))
plot(ax1)
plot(ax2)


ax1.set_ylim(4800, 5500) # Top graph
ax2.set_ylim(800, 1500) # Bottom graph
# ax1.set_ylim(9000, 11000) # Top graph
# ax2.set_ylim(3000, 5000) # Bottom graph

ax1.spines['bottom'].set_visible(False)
ax2.spines['top'].set_visible(False)
ax1.xaxis.tick_top()
ax1.tick_params(labeltop=False)  # don't put tick labels at the top
ax2.xaxis.tick_bottom()

ax_zoom = plottools.zoom_axes(fig,ax2,[0,25],[800,1100],[400,800],[1200,1800])
# ax_zoom = plottools.zoom_axes(fig,ax2,[0,60],[3200,5000],[200,350],[4500,6000])
ax_zoom.tick_params(axis="both", labelsize=8)
# ax_zoom.grid(color='gray')

# ax_zoom.set_xticklabels(x_ticks, fontsize=8)
# ax_zoom.plot(idx, y)
ax_zoom.plot(idx, y, color="blue", markevery=minList, \
    marker='.', linestyle='solid',  mfc='none', \
    mec='black', markersize=12)

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
# ax1.grid(color='gray')
# ax2.grid(color='gray')

# ax1.title.set_text(fName)
# fig.tight_layout()
fig.subplots_adjust(top=0.9, bottom=0.12, left=0.14, right=0.95)
fig.text(0.04, 0.5, 'Execution Time (ms)', ha='center', va='center', rotation='vertical', fontsize = 16)
fig.text(0.5, 0.95, fName, ha='center', va='center', fontsize = 16)
fig.text(0.5, 0.04, 'Tuning Iteration', ha='center', va='center', fontsize = 16)
matplotlib.rc('xtick', labelsize=10) 
matplotlib.rc('ytick', labelsize=20) 
# plt.figure(figsize=(12,9))
# plt.yticks(fontsize=14)
# plt.ylabel('Execution Time (ms)', fontsize=20, labelpad=20)
# plt.xticks(fontsize=14)
# plt.xlabel('Tuning Iteration', fontsize=20, labelpad=20)
# plt.margins(x=0.05)

# plt.title(fName, fontsize=24)


# plt.show()
plt.savefig(fName + "_Tuning.png", transparent=True)

# def main():
#     with open(sys.argv[1]) as f:
#         data = json.load(f)
#     sorted_json_data = json.dumps(data, sort_keys=True)
#     print(sorted_json_data)

# if __name__ == '__main__':
#     main()