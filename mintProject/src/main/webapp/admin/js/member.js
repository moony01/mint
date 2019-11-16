let table = document.forms[0].name;
//회원 & 판매자 목록 =====================================================================================
//ajax로 처음 로드했을 때 list 가져옴. 
$().ready(function(){
	getList(0)
	.then(printList)
	.catch();
});

//ajax로 옵션에 따라 list 가져옴. 
function getListByOption(select){
	let option = option.children('option:selected').val();
	getList(option)
	.then(printList)
	.catch();	
}


function getList(option){	
	return $.ajax({
		type: 'post',
		url: '/mintProject/admin/member/'+table+'/all/'+option,
		//data: {'pg':  pg},
		dataType: 'json',

	});
}

function printList(result){
	console.log(result.list);
	
	let pg = result.pg;
	let list = result.list;
	let totalArticle = result.totalArticle;
	let currentPage = pg;
	let addr = result.addr;
	
	$('.table-member tr:gt(0)').remove();
	$('.pagination li').remove();
	let $frag = $(document.createDocumentFragment());
	for (let i = 0; i < list.length; i++) {
		if(table == 'supplier'){
			let {CATEGORY, SUPPLIERID, STAR, LOGTIME, STATUS} = list[i];	
			
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
	            <td><a href="#">${SUPPLIERID}</a></td>
	            <td class="table--left">${STAR}</td>
	            <td>${LOGTIME}</td>
	            <td>${STATUS}</td>
	        </tr>`;

			$frag.append($(supplier));
		}
		
		else if(table == 'member'){
			let {ID, MEMLEVEL, ISAGREEDSMS, LOGTIME} = list[i];		
			
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
	            <td><a href="#">${ID}</a></td>
	            <td class="table--left">${ISAGREEDSMS}</td>
	            <td>${LOGTIME}</td>
	        </tr>`;

			$frag.append($(member));
			
		}
		
	}
	$('.table-member').append($frag);
	//paging(totalArticle, currentPage, addr);

}