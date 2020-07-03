<%-- index.jsp --%>
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
	<body>
                
		<!-- container -->
		<div class="container">
			<div class="page-header">
                            <center><h1>¿Enter your credentials?</h1></center>
			</div>
		</div>
                <div class="container">
			<div class="panel panel-primary">
			        <form class="form-horizontal" method="post" action="Registration.jsp">
                                <div class="card-body">
                                  <div class="form-group row">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Key</label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" name="KeyKey" id="KeyKey" placeholder="Key" required="required">
                                    </div>
                                  </div>
                                  <div class="form-group row">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">Shared Secret</label>
                                    <div class="col-sm-10">
                                      <input type="password" class="form-control" name="shared_secret" id="shared_secret" placeholder="Shared Secret" required="required">
                                    </div>
                                  </div>
                                </div>
                                <div class="card-footer">
                                    <center><button type="submit" class="btn btn-info">Generate Credential.</button></center>
                                </div>
                            </form>
                        </div>
		</div>                             
                
	
                           
	</body>
</html>

