import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

print(os.environ.get('connection_string'))
conn = pyodbc.connect(os.environ.get('connection_string'))

def execSP(sp, parameters):
    cursor = conn.cursor()

    sql = f'exec {sp} '
    for param in parameters:
        sql += f' @{param[0]}=\'{param[1]}\','

    error = cursor.execute(sql[:-1]).fetchone()[0]
    cursor.close()

    return error