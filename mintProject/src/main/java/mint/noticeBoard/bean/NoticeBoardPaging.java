package mint.noticeBoard.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class NoticeBoardPaging {
	private int currentPage;//현재페이지, ?pg=1
	private int pageBlock;//[이전][1][2][3][다음], int=3
	private int pageSize;//1페이지당 게시물 5개
	private int totalNotice;//총글수
	private StringBuffer pagingHTML;//아래 함수 실행후 생성되는 html태그 담는 객체
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalNotice+pageSize-1)/pageSize; //총페이지수 = 2
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1; //pg=1 일때 1
		int endPage = startPage+pageBlock-1; //2
		
		if(endPage > totalP)
			endPage = totalP; //1
		
		/* NOTICE LIST HTML : START */
		pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg=1'><<</a></li>");
		if(currentPage == 1) 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg=1'><</a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg="+(currentPage-1)+"'><</a></li>");
		
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<li class='page-item active'><a class='page-link' href='notice?pg="+i+"'>"+i+"</a></li>");
			else
				pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg="+i+"'>"+i+"</a></li>");
		}
		
		
		if(currentPage == endPage)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg="+(endPage)+"'>></a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg="+(currentPage+1)+"'>></a></li>");
		pagingHTML.append("<li class='page-item'><a class='page-link' href='notice?pg="+(endPage)+"'>>></a></li>");
		/* NOTICE LIST HTML : END */
	}
	
	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalNotice+pageSize-1)/pageSize;//총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > totalP) 
			endPage = totalP;
		
		/* NOTICE LIST HTML : START */
		pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(startPage)+")'><<</a></li>");
		if(currentPage == 1) 
			pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(startPage)+")'><</a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(currentPage-1)+")'><</a></li>");
		
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<li class='page-item active'><a class='page-link' onclick='noticeBoardSearchPaging("+(i)+")'>"+i+"</a></li>");
			else
				pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(i)+")'>"+i+"</a></li>");
		}
		
		
		if(currentPage == endPage)
			pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(endPage)+")'>></a></li>");
		else 
			pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(currentPage+1)+")'>></a></li>");
		pagingHTML.append("<li class='page-item'><a class='page-link' onclick='noticeBoardSearchPaging("+(endPage)+")'>>></a></li>");
		/* NOTICE LIST HTML : END */
	}
}
