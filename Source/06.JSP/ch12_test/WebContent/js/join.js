/** join.js
 * join_frm.id는 3글자 이상, join_frm.pw==join_frm, 이름, 메일
 */
function infoConfirm(){
	
	if(join_frm.cpw.value!=join_frm.cpwChk.value){
		alert('비밀번호를 확인하세요');
		join_frm.cpw.value = '';
		join_frm.cpwChk.value = '';
		join_frm.cpw.focus();
		return;
	}
	join_frm.submit(); // 강제로 submit 이벤트 발생
}
