<%@page import="com.mashape.unirest.http.exceptions.UnirestException"%>
<%@page import="com.mashape.unirest.http.Unirest"%>
<%@page import="com.mashape.unirest.http.HttpResponse"%>
<%@page import="MURL.ClsURL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

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

                try {
                    
                    HttpResponse<String> responseAPI = Unirest.get(ClsURL.getUrl()+"api/Messages/tag")
                   .header("Content-Type", "application/x-www-form-urlencoded")
                   .queryString("X_Signature", request.getParameter("X_Signature"))
                   .queryString("X_Key", request.getParameter("KeyKey"))
                   .queryString("Tag", request.getParameter("Tag"))
                   .asString();
                 
                  
                    String mSalida = responseAPI.getBody();
                    String StatusCode = Integer.toString(responseAPI.getStatus());
                    System.out.println("mSalida>>>"+mSalida+" StatusCode>>>"+StatusCode);
                  

                    if(responseAPI.getStatus()== 200){
                            
            %>
                
		<!-- container -->
		<div class="container">
			<div class="page-header">
	 			 <h1>Tag user</h1>
			</div>
		</div>
		<div class="container">
                <div class="panel panel-primary">
                    <form method="post" action="MessagesIndex.jsp">
                    <div class="panel-heading"></div>
                            <div class="panel-body">

                                    <div class="row">
                                        
                                        <div class="col-md-6">
                                            <textarea id="w3review" name="Message" rows="6" cols="50" readonly><%= mSalida %> </textarea>
                                        </div>
                                        <div class="col-md-6">
                                           Status Code Tag <input class="form-control" type="text" name="StatusCode" value="<%=  StatusCode %>" readonly/></br>
                                           
        
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <input class="btn btn-primary" type="submit" value="Back">
                                        </div>
                                    </div>

                            </div>
                    </form>
                                           
                </div>
                </div>
                <% 
                    
                }else{
                     %>
                    
   		<!-- error 403 -->
		<div class="container">
                <div class="panel panel-primary">
                    <form method="post" action="MessagesIndex.jsp">
                    <div class="panel-heading">Status Code Tag</div>
                            <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-6">
                                           Status Code Tag<input class="form-control" type="text" name="StatusCode" value="<%=  StatusCode %>" readonly/></br>
                                        </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <input class="btn btn-primary" type="submit" value="Back">
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
