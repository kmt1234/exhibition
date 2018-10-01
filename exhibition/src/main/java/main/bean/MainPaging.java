package main.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MainPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	// 공지사항 페이징
	public void index_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
	}
	
	public void index_notice_searchPlusPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span class='item' id=paging onclick=index_notice_Search("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span class='item' id=currentPaging onclick=index_notice_Search("+i+")>"+i+"</span>");
			else
				pagingHTML.append("<span class='item' id=paging onclick=index_notice_Search("+i+")>"+i+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span class='item' id=paging onclick=index_notice_Search("+(endPage+1)+")>다음</span>");
	}
	
	public void index_contactList_searchPlusPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span class='item'>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span class='item'>"+i+"</span>");
			else
				pagingHTML.append("<span class='item'>"+i+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span class='item'>다음</span>");
	}
}











