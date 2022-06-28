from utils import dio, db

def assignFork(whId, userCode):
    error = 0
    while error is not None:
        fork = dio.prompt('fork: ', error)
        error = db.execSP('sp_assign_fork', [['paramWhId', whId], ['paramUserCode', userCode], ['paramFork', fork]])[0][0]

    return fork
  