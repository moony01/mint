package mint.event.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

/**
 * FAQBoardPaging
 * 
 * FAQ게시판 페이징 처리를 위한 로직
 * pageBlock, pageSize로 페이징 처리 세부 조절
 */
@Data
@Component
public class EventPaging {
	private int currentPage; // 현재페이지, ?pg=1
	private int pageBlock; // if [이전][1][2][3][다음], int=3
	private int pageSize; // 1페이지당 게시물 10개
	private int totalEvent; // 총글수
	private String addr; // 주소 구분용
	private StringBuffer pagingHTML; // 아래 함수 실행후 생성되는 html태그 담는 객체
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalEvent+pageSize-1)/pageSize; // 총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1; // pg=1 일때 1
		int endPage = startPage+pageBlock-1;
		
		if(endPage > totalP) endPage = totalP;
		
		pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg=1'><<</a></li>");
		
		if(currentPage == 1) 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg=1'><</a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg="+(currentPage-1)+"'><</a></li>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<li class='page-item active'><a class='page-link' href='"+addr+"?pg="+i+"'>"+i+"</a></li>");
			else
				pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg="+i+"'>"+i+"</a></li>");
		}
		
		if(currentPage == endPage)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg="+(endPage)+"'>></a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg="+(currentPage+1)+"'>></a></li>");
			pagingHTML.append("<li class='page-item'><a class='page-link' href='"+addr+"?pg="+(endPage)+"'>>></a></li>");
	}
	
}
