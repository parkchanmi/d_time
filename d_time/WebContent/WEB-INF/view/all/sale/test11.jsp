<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cafe. CiCHA</title>

<link
	href="/d_time/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="/d_time/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/d_time/resources/bootstrap/css/sb-admin.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cafe. CiCHA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.9.0.min.js"
	integrity="sha256-f6DVw/U4x2+HjgEqw5BZf67Kq/5vudRZuRkljnbF344="
	crossorigin="anonymous"></script>
	
	
	
	
<script type="text/javascript" src="/d_time/jqplot/js/jquery.jqplot.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DaengDaeng/jqplot/css/jquery.jqplot.css" />
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.enhancedPieLegendRenderer.js"></script>

<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.categoryAxisRenderer.js"></script>
	
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<jsp:include page="/admin_header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						<i class="fa fa-th-large"></i>지점관리
					</h3>
				</div>


	<!-- 9,10 -->
	<script>
	var test = new Array();
	var date_temp;
	
	
		var list_y1 = new Array();
		<c:forEach items="${list_y1}" var="y1">
		list_y1.push({
			date : "${y1.date}",
			cost : "${y1.sum_cost}"
		});
		</c:forEach> 
		
		
		for(var i=1;i<=12;i++){
			var date_find = false;
			
			if(i<10)
				date_temp="2017-0"+i;
			else
				date_temp="2017-"+i;
			
			for(var j=0;j<list_y1.length;j++){
				if(list_y1[j].date==date_temp){
					test.push(list_y1[j].cost);
					date_find=true;
					break;
				}
			}
			if(date_find==false)
				test.push(0);
			
		}
	alert(test);
	</script>

	<header class="w3-container" style="padding-top: 22px">
		<!-- <h5><b><i class="fa fa-dashboard"></i>통계</b></h5> -->
	</header>

	<div class="w3-panel" style="float: left; width: 50%"">
		<div class="w3-third" style="float: none; width: 100%">
			<div id="barchart" style="width: 750px; height: 324px;">
				<script type="text/javascript">    
                                         jQuery(document).ready(function () {                                                 
                                                    jQuery("#barchart").jqplot([test], {
                                                          title:"직영점 매출"
                                                        , seriesColors:['#00CC99']    // 두개 이상의 색을 적어도 최상의 2개의 색만 반영됨
                                                        , stackSeries : false
                                                        , seriesDefaults:{
                                                              renderer:jQuery.jqplot.BarRenderer
                                                        }
                                                        , axes:{
                                                            xaxis:{
                                                                  renderer:jQuery.jqplot.CategoryAxisRenderer
                                                                , ticks:['1월', '2월 ', '3월 ', '4월 ', '5월 ', '6월 ' , '7월 ' , '8월 ' , '9월 ' , '10월 ' , '11월 ', '12월 ' ]
                                                            },
                                                        	yaxis:{
                                                        		min : 0,
                                                        		max : 50000,
                                                        		numberTicks : 6
                                                        	}

                                                        }
                                                    });
                                                });
                                         </script>
                                         </div>
                                         </div>
                                         </div>
                                         
		<!-- /.content-wrapper-->
		
		<!-- Scroll to Top Button-->
 		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- <script src="/d_time/resources/bootstrap/vendor/jquery/jquery.min.js"></script> -->
		<script src="/d_time/resources/bootstrap/vendor/popper/popper.min.js"></script>
		<script
			src="/d_time/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
		
		<script
			src="/d_time/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		<script
			src="/d_time/resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
		<script
			src="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
		
		<script src="/d_time/resources/bootstrap/js/sb-admin.min.js"></script>
		
		<script
			src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>
	</div>
</body>

</html>