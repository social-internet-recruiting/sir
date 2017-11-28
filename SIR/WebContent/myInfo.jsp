<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>Insert title here</title>
</head>
<style>
.right {
    left: 10px;
    width: auto;
    border: 3px solid #73AD21;
    padding: 10px;
}
header ul{
	float: right;
}
header:after{
	display: block;
	content:"";
	clear: both;
}
.myInfo {
  width: 600px; 
  padding-left:15px;
  padding-right:15px;
  margin: 50px auto 50px auto;
}

.tag {
	center:0;
	float:left;
	margin-left:10px;
}



/*  bhoechie tab */
div.bhoechie-tab-container1{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.bhoechie-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.bhoechie-tab-menu div.list-group{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a .glyphicon,
div.bhoechie-tab-menu div.list-group>a .fa {
  color: #5A55A3;
}
div.bhoechie-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a.active,
div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
div.bhoechie-tab-menu div.list-group>a.active .fa{
  background-color: #5A55A3;
  background-image: #5A55A3;
  color: #ffffff;
}
div.bhoechie-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #5A55A3;
}

div.bhoechie-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.bhoechie-tab div.bhoechie-tab-content:not(.active){
  display: none;
}
 
 

</style>

<body>
	<jsp:include page="/include/top.jsp"/>
	<header>
	<div class="myInfo">
	<div>
		<div style="float:left">
			<a><img src="./images/profile.jpg" height="180px" weight="180px"></a>
		</div>		
		<div class="tag">
			<div>
				<h1>nespia@nate.com</h1>
			</div>
			<div style="margin:10px auto 10px auto;">
				<span >�Խù�<span>0</span></span>
				<span >ģ��<span>0</span></span>
			</div>
			<div>
				<a>ȫ�浿</a>
			</div>
			<div style="margin:10px auto 10px auto;">
				<a>010-0000-0000</a>
			</div>
				<div style="margin-left:100px">
					<button class="btn btn-outline-success" type="button"
						data-toggle="modal" data-target="#myModal">��������</button>
				</div>

				<!-- Modal -->
				<div class="modal" id="myModal" role="dialog" >
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content" style="width:700px">
							<div class="modal-header" style="width:700px">
							
								<h2>ȸ������ ����</h2>
								<button type="button" class="close btn btn-danger" style="float:right; weight:100px; height:50px;" data-dismiss="modal">&nbsp;&nbsp;&nbsp;&times;&nbsp;&nbsp;&nbsp;</button>
							</div>
<div class="row" style="margin-top:20px">
<div class="col-sm-2">							
<div style="width:1000px;">
	<div style="margin-right:30px">
    <div class="active"><button class="btn btn-info" style="width:100px" data-toggle="tab" href="#home">������ ����</button></div>
    <div style="margin-top:30px"><button class="btn btn-success" style="width:100px" data-toggle="tab" href="#menu1">�߰� ����</button></div>
    <div style="margin-top:30px"><button class="btn btn-danger" style="width:100px" data-toggle="tab" href="#menu2">��� ����</button></div>
    <div style="margin-top:30px"><button class="btn btn-warning" style="width:100px" data-toggle="tab" href="#menu3">���� ����</button></div>
	</div>
	</div>
</div>

<div class="col-sm-10">
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3 style="text-align:center">������ ����</h3>
        <center style="width:500px; margin-left:auto; margin-right:auto;">
    	<div>
      		<img src="./images/profile.jpg" height="180px" weight="180px" >
     	</div>
    	<div class="form-group" align="left">
     		<label for="name">�̸�</label>
     		<input class="form-control" id="name" name="name" type="text" placeholder="Name" required />
    	</div>
    	<div class="form-group" align="left">
     		<label for="introduction">�Ұ�</label>
     		<td><textarea class="form-control" id="introduction" name="introduction" placeholder="introduction"  maxlength="2048" cols="40" rows="13" style="height:100px"></textarea></td>
        </div>
        <div class="form-group" align="left">
     		<label for="gender">����</label><div></div>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="btn btn-info active">
     		<input type="radio" id="gender" name="gender" autocomplete="off" value="��" > ����  
     		</label>
     		<label class="btn btn-danger">
     		<input type="radio" id="gender" name="gender" autocomplete="off" value="��" > ����
     		</label>
    	</div>
        <div class="form-group" align="left">
     		<label for="email">�̸���</label>
     		<input class="form-control" id="email" name="email" type="email" placeholder="Email" required />
    	</div>
    	
    	<div class="form-group" align="left">
     		<label for="phone">��ȭ��ȣ</label><div></div>
					<select class="col-sm-3" id="m_phone1" name="m_phone1" style="height:30px;" size=1>
								<option value="">TEL</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
					</select>
							<div class="col-sm-1">-</div>
							<input class="col-sm-3" type="text" id="m_phone2" name="m_phone2" style="height:30px;" size="4" maxlength="4" onkeypress="onlyNumber();">
							<div class="col-sm-1">-</div>
				    		<input class="col-sm-3" type="text" id="m_phone3" name="m_phone3" style="height:30px;" size="4" maxlength="4" onkeypress="onlyNumber();">
		</div>
    	</center>
    	
    </div>
    <div id="menu1" class="tab-pane fade">
    <center style="width:500px; margin-left:auto; margin-right:auto;">
      <h3>�߰� ����</h3>
      <h4 align="left">�з�</h4>
		<div class="form-group" align="left">
     		<label for="name">����б�</label>
     		<input class="form-control" id="name" name="name" type="text" placeholder="High School" required />
    	</div>
    	<div>
    		<label for="name">���б�</label>
    		<input class="form-control" id="name" name="name" type="text" placeholder="High School" required/>
    	</div>
    	
    	</center>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>��� ����</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>���� ����</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>    </div>
  </div>
</div>
</div>							


							<div class="modal-footer">
								<input type="submit" class="btn btn-outline-dark" value="����" />
							</div>
						</div>

					</div>
				</div>

			</div>
	</div>
	</div>
	</header>
	<jsp:include page="/include/footer.jsp"/>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>