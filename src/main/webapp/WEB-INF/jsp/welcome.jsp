<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<!DOCTYPE html>
	<html lang="en-US">

	<head>
		<!-- JQuery -->
		<script src="<c:url value="/resources/jquery/jquery-3.2.0.min.js" />"></script>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"/>
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
		<!-- Application and Service -->
		<script src="<c:url value="/resources/app.js" />"></script>
		<script src="<c:url value="/resources/rest.js" />"></script>

		<!-- Get the full URL for AJAX -->
		<c:set var="req" value="${pageContext.request}" />
		<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
		<script type="text/javascript">
			baseUrl = '<c:out value="${baseURL}"/>';
			$( document ).ready(initialize);
			var ui;
			function initialize(){
				ui = new UI(baseUrl);
			}
		</script>
	</head>

	<body>
		<div class="container">
			<h1>NextSCM Printing Service</h1>
			
			<h2>Printing Configuration</h2>

			<h3>Available Printers</h3>
			<button id="button-refresh-printers" class="btn btn-default"><span class="glyphicon glyphicon-refresh"></span></button>		
			<table class="table table-bordered">
				<thead>
					<tr><th>Printer Name</th></tr>
				</thead>
				<tbody>
					<tr><td>Dummy Printer Name</td></tr>
				</tbody>
			</table>		
			
			<h3>Current Config</h3>
			<button id="button-config-get" class="btn btn-default"><span class="glyphicon glyphicon-refresh"></span></button>
			<button id="button-config-add" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>
			<table class="table table-bordered">
				<thead>
					<tr><th>Print Type</th><th>Printer Name</th><th>Actions</th></tr>
				</thead>
				<tbody>
					<tr>
						<td>PDF</td><td>Dummy Printer Name</td>
						<td>
							<button id="button-config-edit"><span class="glyphicon glyphicon-pencil"></span></button>
							<button id="button-config-delete"><span class="glyphicon glyphicon-trash"></span></button>
						</td>
					</tr>
				</tbody>
			</table>		
			
			<h3>Edit Config</h3>
			<form class="form-inline">
				<div class="form-group">
				<label for="printType">Print Type</label>
					<select class="form-control" name="printType" id="printType">
						<option value="PDF">PDF</option>
						<option value="BARCODE">BARCODE</option>
					</select>					  
				</div>
				<div class="form-group">
					<label for="printType">Printer Name</label>
					<input type="text" class="form-control" name="printerName" placeholder="Enter Printer Name">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>		
			
			<h2>Test Printing</h2>
			<h3>Print from URL</h3>
			<form id="form-print-url" class="form">
				<div class="form-group">
					<label for="printType">Print Type</label>
						<select class="form-control" name="printType" id="printType">
						  <option value="PDF">PDF</option>
						  <option value="BARCODE">BARCODE</option>
						</select>					  
				  </div>
				  <div class="form-group">
					  <label for="dataUrl">Document URL</label>
					  <input type="text" class="form-control" name="dataUrl" placeholder="Enter Document URL">
				  </div>					
				<button name="submit" class="btn btn-default"><span class="glyphicon glyphicon-print"></span></button>
			</form>
			
			<h3>Printing from Text</h3>
			<form id="form-print-blob" class="form">
				<div class="form-group">
					<label for="printType">Print Type</label>
						<select class="form-control" name="printType" id="printType">
						  <option value="PDF">PDF</option>
						  <option value="BARCODE">BARCODE</option>
						</select>
				</div>
				<div class="form-group">
					<label for="dataBlob">Document URL</label>
					<textarea class="form-control" rows="3" name="dataBlob">
GAP 3 mm, 0 mm\nDIRECTION 0,0
REFERENCE 0,0
OFFSET 0 mm
SET PEEL OFF
SET CUTTER OFF
SET PARTIAL_CUTTER OFF
SET TEAR ON
CLS
CODEPAGE 1252
TEXT 303,579,"ROMAN.TTF",180,1,12,"Sample Text"
BARCODE 380,533,"128M",102,0,180,2,4,"!104ABCDEFGHIJKLM"
TEXT 333,427,"ROMAN.TTF",180,1,12,"ABCDEFGHIJKLM"
PRINT 1,1
					</textarea>
				</div>					
				<button name="submit" class="btn btn-default"><span class="glyphicon glyphicon-print"></span></button>			
			</form>
		
		</div><!-- /.container -->
		</body>
	</html>