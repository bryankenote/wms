import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

conn = pyodbc.connect(os.environ.get('connection_string'))

def execSP(sp, parameters):
    cursor = conn.cursor()

    sql = f'exec {sp} '
    for param in parameters:
        sql += f' @{param[0]}=\'{param[1]}\','

    result = cursor.execute(sql[:-1]).fetchall()
    cursor.commit()

    cursor.close()

    return result