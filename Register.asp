<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/conn.asp" -->  <!--包含数据库连接-->
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "INSERT INTO UsrInfo (UserName, Institute, Email) VALUES (?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("UserName")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 255, Request.Form("Institute")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, 255, Request.Form("Email")) ' adVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "DownLoad.asp" '插入后跳转到该页面
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
	Session("submit") = "OK" '传递session到Download并跳转到该页面
    Response.Redirect(MM_editRedirectUrl)
	
  End If
End If
%>
<%
Dim Recordset1 '建立记录集变量名称
Dim Recordset1_cmd
Dim Recordset1_numRows  '建立记录集行数变量

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command") '建立记录集对象
Recordset1_cmd.ActiveConnection = MM_conn_STRING '指定数据库连接对象
Recordset1_cmd.CommandText = "SELECT * FROM UsrInfo" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RegisterUsrInfo</title>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<style type="text/css">



.FormBox {
	
	width: 280px;
	height: 170px;
	z-index: 1;
	margin: 200px 500px 400px 500px;
	background:green;
	text-align:center;
	color:#FFF;
	
}
.left_div{width:30%;float:left;padding-bottom:3px;}
.right_div{width:70%;float:right;padding-bottom:3px;}
.ok_div{padding-top:100px;}

</style>
</head>



<body bgcolor="#030303">
<div class="FormBox">
<form action="<%=MM_editAction%>" method="post" id="form1" name="form1">
  <p>Please register your information !</p>
 
  
  <!--User Name-->
  <div class = "left_div"> Name:</div>
  <div class = "right_div"> <span id="sprytextfield4">
    <input type="text" name="UserName" id="UserName" required="required"/>
    <span class="textfieldRequiredMsg"></span></span><span class="textfieldRequiredMsg"></span></span> </div>
    
   <!--Institute--> 
  <div class = "left_div">  Institute:</div>
  <div class = "right_div"> <span id="sprytextfield3">
    <input type="text" name="Institute" id="Institute" required="required"/>
  <span class="textfieldRequiredMsg"></span></span></div>
  
  <!--Email address-->
  <div class = "left_div"> Email:</div>
   <div class = "right_div"> <span id="sprytextfield1">
    <input type="text" name="Email" id="Email" required="required"/>
  <span class="textfieldRequiredMsg"></span><span class="textfieldInvalidFormatMsg"><br />Not a valide email!</span></span></div>
<div class = "ok_div">
    <input type="submit" name="button" id="button" value="OK" />  
    </div>
 
  </p>
  <p>
    <input type="hidden" name="MM_insert" value="form1" /> 
    <!--设置隐藏元素,用来标记进行插入操作-->
    
  </p>

  <p>&nbsp;</p>
</form>
</div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "email", {validateOn:["change"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {validateOn:["change"]});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "none", {validateOn:["change"]});
</script>

</body>
</html>



<%
Recordset1.Close()
Set Recordset1 = Nothing
%>



