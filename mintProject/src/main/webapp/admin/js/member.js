let table = document.forms[0].name;
let option = $('.select-box option:selected').val();
let searchValue;

//회원 & 판매자 목록 =====================================================================================
//ajax로 처음 로드했을 때 list 가져옴. 
$().ready(function(){
	getList(option)
	.then(printList)
	.catch();
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
	alert(searchValue);
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
			let {CATEGORY, ID, STAR, LOGTIME, STATUS} = list[i];	
			
			let date = JSON.parse(LOGTIME);
			let parseDate = new Date(date).toISOString().slice(0,10);
			
			if(CATEGORY == 101) { CATEGORY = '농산물';
			} else if(CATEGORY == 102){ CATEGORY = '수산물';
			} else if(CATEGORY == 103){	CATEGORY = '축산물';
			} else if(CATEGORY == 104) { CATEGORY = '일반식품';
			} else if(CATEGORY == 104) {CATEGORY = '반찬류';
			}
			
			if(STATUS == 0) { STATUS = '판매중';
			} else if(STATUS == 1){ STATUS = '판매중지';
			} else if(STATUS == 2) { STATUS = '계약만료';
			}
			
			let supplier = `<tr>
				<td><input type="checkbox" name="" id=""></td>
	            <td>${CATEGORY}</td>
	            <td><a href="/mintProject/admin/member/supplierView?id=${ID}">${ID}</a></td>
	            <td>${parseDate}</td>
	            <td>${STATUS}</td>
	        </tr>`;
			//${ID} 를 td의 class 속성으로 부여한 뒤, td :first-child() 를 제외하고 모두 remove() or display: none; 
			//eq(0). 

			$frag.append($(supplier));
		}
		
		else if(table == 'member'){ //회원 목록 
			let {ID, MEMLEVEL, ISAGREEDSMS, LOGTIME} = list[i];		
			
			let date = JSON.parse(LOGTIME);
			let parseDate = new Date(date).toISOString().slice(0,10);
			
			if(MEMLEVEL == 0) { MEMLEVEL = '일반';
			} else if(MEMLEVEL == 1) { MEMLEVEL = '우수';
			} else if(MEMLEVEL == 2) { MEMLEVEL = '최우수';
			} else if(MEMLEVEL == 3) { MEMLEVEL = '웽..';
			}
			
			if(ISAGREEDSMS == 0) { ISAGREEDSMS = '수신거부';
			} else if(ISAGREEDSMS == 1) { ISAGREEDSMS = '수신';
			}
			
			let member = `<tr>
				<td><input type="checkbox" name="" id=""></td>
	            <td>${MEMLEVEL}</td>
	            <td><a href="/mintProject/admin/member/memberView/${ID}">${ID}</a></td>
	            <td>${ISAGREEDSMS}</td>
	            <td>${parseDate}</td>
	        </tr>`;

			$frag.append($(member));
			
		}
		
	}
	$('.table-member').append($frag);
	//paging(totalArticle, currentPage, addr);

}

