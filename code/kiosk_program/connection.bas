Attribute VB_Name = "Module1"


Public con As New ADODB.Connection
Public cmd As New ADODB.Command
Public rs As New ADODB.Recordset
Public Sub connect1()
con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + App.Path + "\railway.mdb;Persist Security Info=False"
rs.Open "select * from details", con, adOpenDynamic, adLockOptimistic
rs.Close
End Sub
