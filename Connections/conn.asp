<%
' FileName="Connection_odbc_conn_dsn.htm"
' Type="ADO" 
' DesigntimeType="ADO"
' HTTP="false"
' Catalog=""
' Schema=""
Dim DB,MM_conn_STRING
' MM_conn_STRING = "dsn=individualWeb;"
DB = "/IndividualLabWeb/DataBase/WebSite.accdb"
MM_conn_STRING = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" &server.MapPath(DB)
set conn = Server.CreateObject("ADODB.Connection")
conn.open MM_conn_STRING
If Err Then
err.Clear
Set Conn = Nothing
Response.Write "Error connection!"
Response.End
End If

%>
