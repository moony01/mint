/**
 * 191115
 * 홍소연(@hhhongso)
 */

let table = document.forms[0].name;
let option = $('.select-box option:selected').val();
let searchValue;
let cbxOne;

//회원 & 판매자 목록 =====================================================================================
//ajax로 처음 로드했을 때 list 가져옴. 
$().ready(function(){
	getList(option)
	.then(printList)
	.catch();
});

//엔터키 입력 가능
$('#sword_m').keypress(function(e) {
    if (e.keyCode == 13) {
    	searchValue = $('#sword_m').val();
        
        getList(option, searchValue)
    	.then(printList)
    	.catch();
    }
});

//ajax로 옵션에 따라 list 가져옴. 
function getListByOption(select){
	option = select.children('option:selected').val();
	getList(option, searchValue)
	.then(printList)
	.catch();	
}

function getListBySearch(btn){
	searchValue = btn.parent().prev().val();
	getList(option, searchValue)
	.then(printList)
	.catch();
}

function getList(option, searchValue){
	if(searchValue == '') searchValue = 'undefined'; // 검색어가 입력되어 있지 않으면 'undefined'로 설정. 
	return $.ajax({
		type: 'post',
		url: '/mintProject/admin/member/' +table+ '/' +searchValue+ '/' +option,
		//data: {'pg':  pg},
		dataType: 'json',

	});
}

function printList(result){
	let pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	let addr = result.addr;
	
	$('.table-member tr:gt(0)').remove();
	$('.pagination li').remove();
	let $frag = $(document.createDocumentFragment());
	for (let i = 0; i < list.length; i++) {
		if(table == 'supplier'){ // 판매자 목록 
			let {SUPPLIERCODE, CATEGORY, ID, STAR, LOGTIME, STATUS} = list[i];	
			
			
			let date = new Date(LOGTIME);
			let parseDate = new Date(date - (date.getTimezoneOffset() * 60000)).toISOString().slice(0,10);
			
			if(CATEGORY == 101) { CATEGORY = '농산물';
			} else if(CATEGORY == 102){ CATEGORY = '수산물';
			} else if(CATEGORY == 103){	CATEGORY = '축산물';
			} else if(CATEGORY == 104) { CATEGORY = '일반식품';
			} else if(CATEGORY == 105) {CATEGORY = '반찬류';
			}
			
			if(STATUS == 0) { STATUS = '판매중';
			} else if(STATUS == 1){ STATUS = '판매중지';
			} else if(STATUS == 2) { STATUS = '계약만료';
			}
			
			let supplier = `<tr>
				<td><input type="checkbox" class="checkbox-one" value="${SUPPLIERCODE}"></td>
	            <td>${CATEGORY}</td>
	            <td><a href="/mintProject/admin/member/supplierView?supplierCode=${SUPPLIERCODE}">${ID}</a></td>
	            <td>${parseDate}</td>
	            <td>${STATUS}</td>
	        </tr>`;

			$frag.append($(supplier));
		}
		
		else if(table == 'member'){ //회원 목록 
			let {ID, MEMLEVEL, ISAGREEDSMS, LOGTIME} = list[i];		
			let date = new Date(LOGTIME);
			let parseDate = new Date(date - (date.getTimezoneOffset() * 60000)).toISOString().slice(0,10);
			
			if(MEMLEVEL == 0) { MEMLEVEL = '일반';
			} else if(MEMLEVEL == 1) { MEMLEVEL = '우수';
			} else if(MEMLEVEL == 2) { MEMLEVEL = '최우수';
			} else if(MEMLEVEL == 5) { MEMLEVEL = '관리자';
			}
			
			if(ISAGREEDSMS == 0) { ISAGREEDSMS = '수신거부';
			} else if(ISAGREEDSMS == 1) { ISAGREEDSMS = '수신';
			}
			
			let member = `<tr>
				<td><input type="checkbox" class="checkbox-one" value="${ID}"></td>
	            <td>${MEMLEVEL}</td>
	            <td><a href="/mintProject/admin/member/memberView?id=${ID}">${ID}</a></td>
	            <td>${ISAGREEDSMS}</td>
	            <td>${parseDate}</td>
	        </tr>`;

			$frag.append($(member));
			
		}
		
	}
	$('.table-member').append($frag);
	//paging(totalArticle, currentPage, addr);

}

//전체선택
$('.checkbox-all').on('change', function cbxChecked(){
	let cbxOne  = $('.checkbox-one');
	if(this.checked) {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', true);
		}
	} else {
		for (var i = 0; i < cbxOne.length; i++) {
			cbxOne.eq(i).prop('checked', false);
		}
	}
	
});

//상태변경 or 포인트지급
$('.btn-update').click(function(){
	$('input[name=id]').remove();
	$('input[name=supplierCode]').remove();
	let check = $('.checkbox-one:checked');
	
	if(check.length == 0){
		alert('선택된 항목이 없습니다 !! ');
	} else {
		//데이터 가공 
		let form = document.forms[1];
		let data = document.createElement('input'); 
		let data2 = document.createElement('input'); 
		
		data2.name = 'value';
		data2.type = 'hidden';
		
		if(table == 'member') {
			data.name = 'id';
			data.type = 'hidden';
			data2.value = document.getElementsByName("point")[0].value ;
		} else if(table == 'supplier') {
			data.name = 'supplierCode';
			data.type = 'hidden';
			data2.value = document.getElementsByName("status")[0].value ;
		}
		let checkValue = [];
		for (var i = 0; i < check.length; i++) {
			let value = $('.checkbox-one:checked').eq(i).val();
			checkValue.push("'"+value+"'");
		}
		data.value = checkValue;
		form.appendChild(data);
		form.appendChild(data2);
		form.method = 'post';
		form.action = '/mintProject/admin/member/update/'+table;
		
		form.submit();
	}
});
