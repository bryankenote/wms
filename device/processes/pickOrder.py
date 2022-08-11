from utils import dio, db

def pickOrder(whId, userCode):
    getOrder(whId, userCode)

    status = True
    while status:        
        pickDetails = pickLocation(whId, userCode)
        if pickDetails != False:
            item = pickDetails[2]
            pickItem(item)
            pickId = pickDetails[0]
            pickItmQty(whId, pickId) 
        else:
            return

def getOrder(whId, userCode):
    rows = db.execSP('sp_get_orders', [['paramWhId', whId]])
    orders = []
    for row in rows:
        orders.append(row[0].strip())

    # select order screen 
    error = 0
    while error is not None:
        selectedIndex = dio.listPrompt('select order: ', orders, error)
        order = orders[selectedIndex]
        error = db.execSP('sp_assign_pick', [['paramWhId', whId], ['paramUserCode', userCode], ['paramOrder', order]])[0][0]

    return order

def pickLocation(whId, userCode):
    result = db.execSP('sp_get_pick', [['paramWhId', whId], ['paramUserCode', userCode]])
    if len(result) > 0:
        row = result[0]
        pickId = row[0]
        location = row[1].strip()
        item = row[2].strip()

        # Go to location screen
        error = 0
        while error is not None:
            scannedLocation = dio.prompt(f'Go to location {location}', error)
            if scannedLocation != location:
                error = 'Wrong location'
            else:
                error = None

        return [pickId, location, item]
    else: 
        return False


def pickItem(item):
    # Scan item screen 
    error = 0
    while error is not None:
        scannedItem = dio.prompt(f'Scan item: {item}', error)
        if scannedItem != item:
            error = 'Wrong Item'
        else: 
            error = None

def pickItmQty(whId, pickId):
    # Choose qty of item 
    result = ''
    while result != 'D':
        qtyNeeded = db.execSP('sp_get_pkd_qty_needed', [['paramWhId', whId], ['paramPkdId', pickId]])[0][0]
        qtyScanned = int(dio.prompt(f'{qtyNeeded} to be picked', result)) 
        result = db.execSP('sp_update_qty_picked', [['paramWhId', whId], ['paramItmQty', qtyScanned], ['paramPkdId', pickId]])[0][0].strip()