from utils import dio
from processes import login, assignFork

def main():
    userCode = login()
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