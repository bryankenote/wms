from utils import dio, db

def assignFork(userCode):
    error = 0
    while error is not None:
        fork = dio.prompt('fork: ')

        error = db.execSP('sp_assign_fork', [['paramUserCode', userCode], ['paramFork', fork]])
        if error is not None:
            print(error)

    return fork
  