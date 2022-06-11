import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')

y = []
fName = "8192-8192-0-1023-0-1023-0.5-3"
filePath = "time/" + fName + "."
with open(filePath + "txt", "r") as f:
    lines = f.readlines()
    for i, line in enumerate(lines):
        y.append(float(line.replace("\n", "")))
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