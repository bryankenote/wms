from utils import dio, db

def pickOrder(whId, deviceId):
    rows = db.execSP('sp_get_orders', [['paramWhId', whId]])
    orders = []
    for row in rows:
        orders.append(row[0].strip())

    # select order screen 
    selectedIndex = dio.listPrompt('select order: ', orders, error)
    order = orders[selectedIndex]

    return order