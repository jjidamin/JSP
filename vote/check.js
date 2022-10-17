function TryVote() {
	if(document.frm.jumin.value.length === 0) {
		alert("주민번호가 입력되지 않았습니다!");
		frm.jumin.focus();
		return false;
	}
	else if(document.frm.name.value.length === 0) {
		alert("성명이 입력되지 않았습니다!");
		frm.name.focus();
		return false;
	}
	else if(document.frm.voteNum.value.length === 0) {
		alert("후보번호가 선택되지 않았습니다!");
		frm.voteNum.focus();
		return false;
	}
	else if(document.frm.time.value.length === 0) {
		alert("투표시간이 입력되지 않았습니다.");
		frm.time.focus();
		return false;
	}
	else if(document.frm.area.value.length === 0) {
		alert("투표장소가 입력되지 않았습니다.");
		frm.area.focus();
		return false;
	}
	else if(frm.confirm[0].checked === false && frm.confirm[1].checked === false) {
		alert("유권자확인이 선택되지 않았습니다.");
		return false;
	}
	else {
		alert("투표하기 정보가 정상적으로 등록 되었습니다!");
		document.frm.submit();
	}
	return true;
}

function TryReset() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.reset();
	frm.jumin.focus();

}

function TryCheck() {
	alert("확인하였습니다");
}