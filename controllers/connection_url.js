$(function() {
    getValues();

   
});

var jsonResponseT;
var tamObj;

function getValues() {
	// conexion a elace 
		var url = "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow"
	
	//Variables 
	    
		var is_answered="";
		var is_answeredTrue=0;
		var is_answeredFalse=0;	
    //soliictud http sincrona
		var req = new XMLHttpRequest();
		req.open('GET', url, false);
		req.setRequestHeader("Content-Type", "text/xml");
		req.send(null);
		if (req.status == 200){
			//console.log(req.responseText);
			var data = req.responseText;

			var jsonResponse = JSON.parse(data);
            console.log(jsonResponse);
            jsonResponseT=jsonResponse;
		}
		try{

			tamObj = jsonResponse.items.length;
		 }catch(e){
			alert('Error:'+e.message);
		}


		//Obtiene el número de respuestas contestadas y no contestadas -->
		for(var i=0; i<tamObj; i++){
			is_answered = jsonResponse.items[i].is_answered;
			
			if(is_answered==true){
				is_answeredTrue = is_answeredTrue + 1;
			}else{
				is_answeredFalse = is_answeredFalse + 1;
			}
			
		}

         


		$("#respuesta_c").text(is_answeredTrue);
		$("#respuesta_nc").text(is_answeredFalse);
	}


		

	

	
		