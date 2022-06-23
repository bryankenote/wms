import db
import utils

userCode = utils.prompt('user code: ')

fork = utils.prompt('fork: ')

error = db.execSP('AssignFork', [['paramUserCode', userCode], ['paramFork', fork]])
if error is not None:
    print(error)
    exit()

job = utils.listPrompt('Select job', ['pick order', 'replen/putaway'])
