from utils import dio
from processes import assignDevice, assignFork

def main():
    userCode = assignDevice()
    fork = assignFork()

    processes = ['pick order', 'replen/putaway', 'exit']

    while True:
        selectedIndex = dio.listPrompt('Select job', processes)
        selectedProcess = processes[selectedIndex]

        if selectedProcess == 'pick order':
            print('pick order')
        elif selectedProcess == 'replen/putaway':
            print('replen/putaway')
        elif selectedProcess == 'exit':
            exit()

if __name__ == "__main__":
   main()