<%@page import="java.io.PrintWriter"%>
<%@page import="MURL.ClsURL"%>
<%@page import="com.mashape.unirest.http.HttpResponse"%>
<%@page import="com.mashape.unirest.http.Unirest"%>
<%@page import="com.mashape.unirest.http.exceptions.UnirestException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>

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
                    <title>Proyect Client API</title>
		</head>
                
                <script type="text/javascript">
                    function alertName(){
                    alert("Form has been submitted");
                    }
                </script> 
	<body>
            
            <% 
                request.setCharacterEncoding("UTF-8"); 

                Unirest.setTimeouts(0, 0);
                try {
                    HttpResponse<String> responseAPI = Unirest.put(ClsURL.getUrl()+"api/login/Credential")
                            .header("Content-Type", "application/json")
                            .body("{\n    \"Key\":\""+request.getParameter("KeyKey")+"\",\n    \"Shared_Secret\":\""+request.getParameter("shared_secret")+"\"\n}")
                            .asString();
                    String mSalida = responseAPI.getBody();
                    String StatusCode = Integer.toString(responseAPI.getStatus());
                    System.out.println("mSalida>>>"+mSalida+" StatusCode>>>"+StatusCode);
                    JSONObject jsonObj = null;
                                       

                    if(responseAPI.getStatus()== 200){
                    try {
                            jsonObj = new JSONObject(mSalida);
                            
                            Cookie mkey      = new Cookie("mkey", request.getParameter("KeyKey"));
                            Cookie mfirma = new Cookie("mfirma", jsonObj.getString("X_Signature"));
                            mkey.setMaxAge(60*60); 
                            mfirma.setMaxAge(60*60); 
                            response.addCookie(mkey);
                            response.addCookie(mfirma);

            %>
                
		<!-- container -->
		<div class="container">
			<div class="page-header">
	 			 <h1>Authenticate user</h1>
			</div>
		</div>
		<div class="container">
                <div class="panel panel-primary">
                    <form method="post" action="MessagesIndex.jsp">
                    <div class="panel-heading">Authenticate user</div>
                            <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-6">
                                            Key <input class="form-control" type="text" name="KeyKey" value="<%= request.getParameter("KeyKey") %>" readonly><br>
                                        </div>
                                        <div class="col-md-6">
                                            Shared Secret <input class="form-control" type="password" name="shared_secret" value="<%= request.getParameter("shared_secret") %>" readonly><br>
                                        </div>
                                        <div class="col-md-6">
                                           X-Signature  <input class="form-control" type="text" name="X_Signature" value="<%= jsonObj.getString("X_Signature") %>" readonly/></br>
                                        </div>
                                        <div class="col-md-6">
                                           Status Code Credential <input class="form-control" type="text" name="StatusCode" value="<%=  StatusCode %>" readonly/></br>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <input class="btn btn-primary" type="submit" value="Log in">
                                        </div>
                                    </div>

                            </div>
                    </form>
                                           
                </div>
                </div>
                <% 
                       } catch (JSONException e){
                       System.out.println(e.getMessage());
                    }
                    
                }else{
                     %>
                    
   		<!-- error 403 -->
		<div class="container">
			<div class="page-header">
	 			 <h1>Authenticate user</h1>
			</div>
		</div>
		<div class="container">
                <div class="panel panel-primary">
                    <form method="post" action="MessagesIndex.jsp">
                    <div class="panel-heading">Authenticate user</div>
                            <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-6">
                                            Key <input class="form-control" type="text" name="KeyKey" value="${cookie['mkey'].getValue()}" readonly><br>
                                        </div>
                                        <div class="col-md-6">
                                           X-Signature  <input class="form-control" type="text" name="X_Signature" value="${cookie['mfirma'].getValue()}" readonly/></br>
                                        </div>
                                        <div class="col-md-6">
                                           Status Code Credential  <input class="form-control" type="text" name="StatusCode" value="<%=  StatusCode %>" readonly/></br>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <input class="btn btn-primary" type="submit" value="Log in">
                                        </div>
                                    </div>

                            </div>
                    </form>
                                           
                </div>
                </div>                 
                     <%
                    }
                    
                } catch (UnirestException ex) {
                    System.out.println(ex.getMessage());
                }
                %>
	</body>
</html>
