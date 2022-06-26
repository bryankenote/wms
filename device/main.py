from utils import dio
from processes import assignDevice, assignFork

WH_ID = 1
DEVICE_ID = 1

def main():
    userCode = assignDevice.assignDevice(WH_ID, DEVICE_ID)
    fork = assignFork.assignFork(WH_ID, userCode)

    processes = ['pick order', 'replen/putaway', 'exit']

    while True:
        selectedIndex = int(dio.listPrompt('Select job', processes)) - 1
        selectedProcess = processes[selectedIndex]

        if selectedProcess == 'pick order':
            print('pick order')
        elif selectedProcess == 'replen/putaway':
            print('replen/putaway')
        elif selectedProcess == 'exit':
            exit()

if __name__ == "__main__":
   main()