from utils import dio, db
from processes import assignDevice, assignFork, pickOrder

WH_ID = 1
DEVICE_ID = 1

def main():
    userCode = assignDevice.assignDevice(WH_ID, DEVICE_ID)
    fork = assignFork.assignFork(WH_ID, userCode)

    processes = ['pick order', 'replen/putaway', 'exit']

    while True:
        selectedIndex = dio.listPrompt('Select job', processes, 0)
        selectedProcess = processes[selectedIndex]

        if selectedProcess == 'pick order':
            pickOrder.pickOrder(WH_ID,DEVICE_ID)
        elif selectedProcess == 'replen/putaway':
            print('replen/putaway')
        elif selectedProcess == 'exit':
            break
    
    error = db.execSP('sp_unassign_fork', [['paramWhId', WH_ID], ['paramUserCode', userCode]])[0][0]
    if error is not None:
        print(error)

    error = db.execSP('sp_unassign_device', [['paramWhId', WH_ID], ['paramUserCode', userCode]])[0][0]
    if error is not None:
        print(error)

if __name__ == "__main__":
   main()