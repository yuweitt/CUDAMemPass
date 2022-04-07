import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

y = []
mini = 999999
fName = "2022_03_31_23-18-time-10000-100000-20-wo-pdt"
filePath = "time/" + fName + "."
with open(filePath + "txt", "r") as f:
    lines = f.readlines()
    for i, line in enumerate(lines):
        num = float(line.replace("\n", ""))
        if num < mini:
            mini = num
        y.append(mini)
    idx = range(0, len(lines), 1)
    print(lines)
    print(idx)
    plt.plot(idx, y, 'r')
    # plt.show()
    plt.savefig(filePath + "png")


# def main():
#     with open(sys.argv[1]) as f:
#         data = json.load(f)
#     sorted_json_data = json.dumps(data, sort_keys=True)
#     print(sorted_json_data)

# if __name__ == '__main__':
#     main()