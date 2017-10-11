<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sortable</title>
<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="tablednd/jquery.tablednd.js"></script>

 
<style type="text/css">
  #sortable-1{
  list-style-type : none;
  margin : 0;
  }
  
  #sortable-1 li{
  margin :0 3px 3px 3px;
  padding: 0.4em;
  display : inline; 
  }
</style>
 
<script type="text/javascript">
$(function(){
	//tableDnD(이안에 여러 옵션들을 지정해 줄 수 있다.)
	/*
		example : 
		tableDnD(
			{
				//드래그 기능이 동작하는 동안 특정 CLASS를 드래그하는 TR에 적용해준다.
				onDragStyle : 'css제어',
				onDropStyle : '드롭기능시 스타일',
			        onDragClass: '클래스지정',
			        //드래그한 후 드롭이벤트가 일어날 경우의 이벤트
			        onDrop: function(table, row) {
			        	console.log("드롭!!");
			        },
			        onDragStart: function(table, row) {
			        	console.log("드래그 시작!");
			        }
			}
		);
	*/
	$("#tableId").tableDnD();
})


</script>
</head>
<body>
 
<table id="tableId" border="1" style="width: 800px;"> 
<tr style="background-color: red;"> <td width="100%">1</td> </tr> 
<tr style="background-color: yellow;"> <td>2</td> </tr> 
<tr style="background-color: blue;"> <td>3</td> </tr> 
<tr style="background-color: green;"> <td>4</td> </tr> 
</table>

</body>
</html>