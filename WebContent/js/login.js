var pCounter = 0;
var cCounter = 0;
function signUpBtn(){
	var login_panel = document.getElementById("login_panel");
	login_panel.style.display = "none";
	var register_panel = document.getElementById("register_panel");
	register_panel.style.display = "";

}

function goBackBtn(){
	var login_panel = document.getElementById("login_panel");
	login_panel.style.display = "";
	var register_panel = document.getElementById("register_panel");
	register_panel.style.display = "none";

}

function passwordCheck(){
	if(pCounter==0){
		pCounter++;
		}
	else{
		var pWord = document.getElementById("pWord").value;
		var cWord = document.getElementById("cWord").value;
		if(pWord == cWord){
				if(pWord==""){
					document.getElementById("pcs").style.display="none";
					document.getElementById("pcf").style.display="none";
					cCounter = 0;
					pCounter = 0;
				}
				else{
					document.getElementById("pcs").style.display="";
					document.getElementById("pcf").style.display="none";
				}
		}
		else{
			document.getElementById("pcf").style.display="";
			document.getElementById("pcs").style.display="none";
		}
		}

}

function keyPassCheck(){
	if(document.getElementById("cWord").value!=""){
		cpasswordCheck();
	}
	else{
		document.getElementById("pcs").style.display="none";
		document.getElementById("pcf").style.display="none";
		cCounter = 0;
		pCounter = 0;
	}
	
}

function cpasswordCheck(){
	if(document.getElementById("pWord").value==""){
		pCounter=0;
	}
	if(pCounter==0 && document.getElementById("pWord").value!=""){
		pCounter++;
		}
	else{
		var pWord = document.getElementById("pWord").value;
		var cWord = document.getElementById("cWord").value;
		if(pWord != ""){
			if(cWord.length >= pWord.length || cCounter > 0){
				cCounter++;
				if(pWord == cWord){
					
						document.getElementById("pcs").style.display="";
						document.getElementById("pcf").style.display="none";
					
				}
			else{
				
					document.getElementById("pcf").style.display="";
					document.getElementById("pcs").style.display="none";
				}
			}
		}
		else{
			if(pWord==cWord){
				document.getElementById("pcs").style.display="none";
				document.getElementById("pcf").style.display="none";
				cCounter = 0;
				pCounter = 0;
			}
		}
		}

}