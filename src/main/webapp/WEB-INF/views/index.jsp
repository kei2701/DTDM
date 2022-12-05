<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {theme: "light2", // "light2", "dark1", "dark2"
    	animationEnabled: true,
    	zoomEnabled: true,
      title:{
       text: "Chart With Date-Time Stamps Inputs"       
     },

     data: [
     {        
      type: "line",
      xValueType: "dateTime",
      dataPoints: ${json }
    }
    ]
  });

    chart.render();
  }
  </script>
<script type="text/javascript"
	src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
	<div style="height: 50vh; width: 100vw">
		<form action="">
			<label for="fromCode">From:</label> 
			<select name="fromCode" id="fromCode">
				<c:forEach items="${symbols }" var="s">
					<c:set var="id1" value="${fromCode }" />
					<c:set var="id2" value="${s.code }" />
					<c:if test="${id1 == id2}">
						<option value="${ s.code}" selected="selected">${s.code} - ${s.description }</option>
					</c:if>
					<c:if test="${id1 != id2}">
						<option value="${ s.code}">${s.code} - ${s.description }></option>
					</c:if>
				</c:forEach>
			</select> 
			<label for="toCode">To:</label> 
			<select name="toCode" id="toCode">
				<c:forEach items="${symbols }" var="s">				
					<c:set var="id1" value="${toCode }" />
					<c:set var="id2" value="${s.code }" />
					<c:if test="${id1 == id2}">
						<option value="${ s.code}" selected="selected">${s.code} - ${s.description }</option>
					</c:if>
					<c:if test="${id1 != id2}">
						<option value="${ s.code}">${s.code} - ${s.description }></option>
					</c:if>
				</c:forEach>
			</select> 
			
			<br>			
			<label for="amount">Amount:</label>
			 <input type="text" id="amount" name="amount" value="${amount }">
			 <label>Results:</label>
			 <input type="text" readonly="readonly" value="${result }">
			<br> <input type="submit" value="Submit">
		</form>
	</div>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
</html>