// UI METHODS
RestClient = function(baseUrl){
	
   this.baseUrl = baseUrl;
	
	//GET PRINTERS METHODS
	this.getPrinters = function(callback, data){
		var url = this.baseUrl + '/print/printer';
		$.get(url, data, callback);
	}

	// PRINT CONFIG METHODS
	this.addPrintConfig = function(callback, data){
		var url = this.baseUrl + '/print/config';
		$.post(url, data, callback);
	}

	this.updatePrintConfig = function(callback, data){
		var url = this.baseUrl + '/print/config';
		$.put(url, data, callback);
	}

	this.deletePrintConfig = function(callback, data){
		var url = this.baseUrl + '/print/config';
		$.delete(url, data, callback);
	}


	// PRINT METHODS
	this.printUrl = function(callback, data){
		var url = this.baseUrl + '/print/url';
		$.post(url, data, callback);
	}

	this.printBlob = function(callback, data){
		var url = this.baseUrl + '/print/blob';
		$.post(url, data, callback);
	}
}



