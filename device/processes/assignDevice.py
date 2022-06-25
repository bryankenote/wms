from utils import dio, db

def assignDevice(deviceId):
    error = 0
    while error is not None:
        dio.clearConsole()

        userCode = dio.prompt('user code: ')

        error = db.execSP('sp_assign_device', [['paramDeviceId', deviceId], ['paramUserCode', userCode]])
        if error is not None:
            print(error)

    return userCode