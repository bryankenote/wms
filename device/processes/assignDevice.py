from utils import dio, db

def login():
    error = 0
    while error is not None:
        dio.clearConsole()

        userCode = dio.prompt('user code: ')

        error = db.execSP('sp_assign_device', [['paramUserCode', userCode]])
        if error is not None:
            print(error)

    return userCode