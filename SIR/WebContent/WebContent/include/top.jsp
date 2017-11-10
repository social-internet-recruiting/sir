<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<html>
<header>

<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
<a class="navbar-brand" href="main.jsp"><img src="images/sir.gif" height="100" width="200"></a>
<button class="navbar-toggler" aria-expanded="false" aria-controls="navbarColor01" aria-label="Toggle navigation" type="button" data-toggle="collapse" data-target="#navbarColor01">
	<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarColor01">
    	<ul class="navbar-nav mr-auto">
    	<form class="form-inline my-2 my-lg-0" style="margin-left:130px;">
    	<input class="form-control mr-sm-2" type="text" placeholder="Search">
     	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    	</form>
			<li class="nav-item active">
    	    	<a class="nav-link" href="main.jsp" style="margin-left:100px;">Home <span class="sr-only">(current)</span></a>
    	  	</li>
    	  	<li class="nav-item">
    	    	<a class="nav-link" href="#">About</a>
   			</li>
   		 </ul>
    	<form class="form-inline my-2 my-lg-0">
      	<div class="input-group">
      		<span class="input-group-addon"><img src="images/login.jpg"></span>
			<input id="email" type="email" class="form-control" name="email" value="" placeholder="Email Address">                                        
		</div>
	 	<div class="input-group">
      		<span class="input-group-addon"><img src="images/password.jpg"></span>
         	<input id="password" type="password" class="form-control" name="password" value="" placeholder="Password">                                        
      	</div>
	 	<button type="submit" class="btn btn-primary">Login</button>
    	</form>
	</div>
</nav>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</header>
</html>