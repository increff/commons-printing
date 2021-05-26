// UI METHODS
UI = function(baseUrl){
	
	this.client = new RestClient(baseUrl);
	
	// PRINTERS
	this.getPrinters = function(){
		alert("getPrinters");
	}

	// PRINT CONFIG
	this.getPrintConfig = function(){
		alert("getPrintConfig");
	}

	this.addPrintConfig = function(name){
		alert("addPrintConfig");
	}

	this.updatePrintConfig = function(name){
		alert("updatePrintConfig");
	}

	this.deletePrintConfig = function(name){
		alert("deletePrintConfig");
	}
	
	// TESTING
	this.testUrlPrinting = function(name){
		alert("testUrlPrinting");
	}

	this.testBlobPrinting = function(name){
		alert("testBlobPrinting");
	}	
	
	$('#button-refresh-printers').click(this.getPrinters);
	
	$('#button-config-get').click(this.getPrintConfig);
	$('#button-config-add').click(this.addPrintConfig);
	$('#button-config-edit').click(this.updatePrintConfig);
	$('#button-config-delete').click(this.deletePrintConfig);

	$('form[name="form-print-url"]').find('button[name="submit"').click(this.testUrlPrinting);
	$('form[name="form-print-blob"]').find('button[name="submit"').click(this.testBlobPrinting);

}
