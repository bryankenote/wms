import pyodbc
import secret

conn = pyodbc.connect(secret.connectionString)

def execSP(sp, parameters):
    cursor = conn.cursor()

    sql = f'exec {sp} '
    for param in parameters:
        sql += f' @{param[0]}=\'{param[1]}\','

    error = cursor.execute(sql[:-1]).fetchone()[0]
    cursor.close()

    return error