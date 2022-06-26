## Setup

install python3
`pip3 install obdc`
`pip3 install dotenv`
add a `.env` file to `./device` and put in your sql server connection string

Windows `.env`:

```
connection_string = "Driver={SQL Server};Server=YOUR_SQLSERVER_IP;Database=wms;Trusted_Connection=no;Uid=SA;Pwd=YOUR_SA_PASSWORD;"
```

linux `.env`:

```
connection_string = "Driver={ODBC Driver 18 for SQL Server};Server=YOUR_SQLSERVER_IP;Database=wms;Trusted_Connection=no;TrustServerCertificate=yes;Uid=SA;Pwd=YOU_SA_PASSWORD;"
```
