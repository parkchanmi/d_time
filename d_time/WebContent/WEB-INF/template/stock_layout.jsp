<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title><tiles:getAsString name="title" /></title>
<!-- Bootstrap core CSS-->
<link href="/d_time/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
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
<link href="/d_time/resources/bootstrap/css/sb-admin.css" rel="stylesheet">
<script src="/d_time/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
</head>
<body>

	<tiles:insertAttribute name="body" />

</body>
<script src="/d_time/resources/bootstrap/vendor/popper/popper.min.js"></script>
		<script src="/d_time/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script
			src="/d_time/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="/d_time/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>
		<script
			src="/d_time/resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
		<script
			src="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="/d_time/resources/bootstrap/js/sb-admin.min.js"></script>
		<!-- Custom scripts for this page-->
		<script src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>
		<script src="/d_time/resources/bootstrap/js/sb-admin-charts.min.js"></script>
</html>