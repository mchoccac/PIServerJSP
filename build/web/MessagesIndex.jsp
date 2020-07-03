<%@page import="MURL.ClsURL"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="bootstrap/dist/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <link href="favicon.ico" rel="shortcut icon" type=>
        <script src="jquery/jquery-1.12.4.min.js"></script>
        <script src="bootstrap/dist/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="DataTables/datatables.css">
        <script type="text/javascript" charset="utf8" src="DataTables/datatables.js"></script>
         
        <title>Proyect Client API</title>
    </head>
    <body>
       
        <div class="container">
                <div class="page-header">
                         <h1>Message listing</h1>
                </div>
        </div>        
        <div class="table-responsive">
        <table id="table_id" class="table table-bordered"  width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>
                           id
                        </th>
                        <th>
                           Route
                        </th>
                        <th>
                            Params
                        </th>
                        <th>
                            Description
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <form method="post" action="message.jsp">
                        <td>
                             1
                        </td>
                        <td>
                            <%out.println("<b>" + ClsURL.getUrl()+"api/Messages/message" + "</b>");%>
                            
                        </td>
                        <td>
                            <input type="text" class="form-control" name="Message" id="Message" placeholder="Message" required="required">
                        </td>
                        <td>
                            set Message, get to id.
                        </td>
                        <td>
                            <button class="btn btn-success">
                                New
                            </button>
                            <input type="hidden" name="KeyKey" value="${cookie['mkey'].getValue()}"/>
                            <input type="hidden" name="X_Signature" value="${cookie['mfirma'].getValue()}"/>                                   
                        </td>
                        </form>
                    </tr>
                    
                    <tr>
                        <form method="post" action="id.jsp">
                        <td>
                             2
                        </td>                            
                        <td>
                            <%out.println("<b>" + ClsURL.getUrl()+"api/Messages/id" + "</b>");%>
                            
                        </td>
                        <td>
                            <input type="text" class="form-control" name="Id" id="Id" placeholder="Id" required="required">
                        </td>
                        <td>
                           Obtained from the result of the message
                        </td>
                        <td>
                            <button class="btn btn-success">
                                New
                            </button>
                            <input type="hidden" name="KeyKey" value="${cookie['mkey'].getValue()}"/>
                            <input type="hidden" name="X_Signature" value="${cookie['mfirma'].getValue()}"/>      
                        </td>
                        </form>
                    </tr>
                    
                    <tr>
                        <form method="post" action="tag.jsp">
                        <td>
                             3
                        </td>                            
                        <td>
                            <%out.println("<b>" + ClsURL.getUrl()+"api/Messages/tag" + "</b>");%>
                            
                        </td>
                        <td>
                            <input type="text" class="form-control" name="Tag" id="Tag" placeholder="Tag" required="required">
                        </td>
                        <td>
                            get Tag:<br>
                            value,key
                        </td>
                        <td>
                            <button class="btn btn-success">
                                New
                            </button>
                            <input type="hidden" name="KeyKey" value="${cookie['mkey'].getValue()}"/>
                            <input type="hidden" name="X_Signature" value="${cookie['mfirma'].getValue()}"/>                            
                        </td>
                        </form>
                    </tr>                    
                </tbody>
        </table>        

        </div>   

        <center>
            
            <table>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                </tr>
                <tr>
                    <td>
                        <form method="post" action="index.jsp">
                            <button class="btn btn-success">Back Credential</button>
                        </form>
                    </td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td>
                        <form method="post" action="Registration.jsp">
                            <button class="btn btn-info">Back Login ...</button>
                        </form>                        
                  </td>
                </tr>
            </table>
                        

 
        </center>                    

    <script type="text/javascript">
        $(document).ready( function () {
            $('#table_id').DataTable({
                responsive: true
            });
        });
    </script>
    
    </body>
</html>
