/**
 * 	
 */

function infoConfirm(){
	if(!add_frm.fname.value){
		alert('You must enter a name');
		add_frm.fname.focus();
		return;
	}
	if(!add_frm.fphone.value){
		alert('You must enter a phone number');
		add_frm.fphone.focus();
		return;
	}
	add_frm.submit(); 
	}