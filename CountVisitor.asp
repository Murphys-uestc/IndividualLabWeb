

<%
Dim DB,MM_conn_STRING
' MM_conn_STRING = "dsn=individualWeb;"
DB = "/IndividualLabWeb/DataBase/WebSite.accdb"
MM_conn_STRING = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" &server.MapPath(DB)
set conn = Server.CreateObject("ADODB.Connection")
conn.open MM_conn_STRING 
%>

<%
dim sql
dim rs
sql="SELECT Visitor FROM VisitorInfo" 
set rs=conn.execute(sql)
count=rs("Visitor")
%>

 
<!--读取表格访问数量，并在html中输出-->
document.write("<%=count%>")


<!--更新访问数量,刷新不重新计数-->
<%
if session("iscount")="" then
sql="update VisitorInfo set Visitor=Visitor+1"
rs.close
set rs=nothing
conn.execute(sql)
conn.close
set conn=nothing
session("iscount")="iscount"
end if

%>


