import pyodbc

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=172.18.224.1,1433;'
                      'Database=wms;'
                      'Trusted_Connection=no;'
                      'Uid=SA;'
                      'Pwd=BJKg03569041')

def execSP(sp, parameters):
    cursor = conn.cursor()

    sql = f'exec {sp} '
    for param in parameters:
        sql += f' @{param[0]}=\'{param[1]}\','

    error = cursor.execute(sql[:-1]).fetchone()[0]
    cursor.close()

    return error