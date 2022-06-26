from utils import dio, db

def assignDevice(whId, deviceId):
    error = 0
    while error is not None:
        userCode = dio.prompt('user code: ', error)
        error = db.execSP('sp_assign_device', [['paramWhId', whId], ['paramDeviceId', deviceId], ['paramUserCode', userCode]])

    return userCode