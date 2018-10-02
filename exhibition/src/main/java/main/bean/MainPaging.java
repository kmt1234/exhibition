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
	
	public void index_notice_searchPlusPagingHTML(String index_keyword) {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='index_notice_Plus.do?pg="+(startPage-1)+"&index_keyword="+index_keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='index_notice_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='index_notice_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='index_notice_Plus.do?pg="+(endPage+1)+"&index_keyword="+index_keyword+"'>다음</a>");
	}
	
	public void index_QnA_searchPlusPagingHTML(String index_keyword) {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='index_QnA_Plus.do?pg="+(startPage-1)+"&index_keyword="+index_keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='index_QnA_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='index_QnA_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='index_QnA_Plus.do?pg="+(endPage+1)+"&index_keyword="+index_keyword+"'>다음</a>");
	}
	
	public void index_contactList_searchPlusPagingHTML(String index_keyword) {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='index_contactList_Plus.do?pg="+(startPage-1)+"&index_keyword="+index_keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='index_contactList_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='index_contactList_Plus.do?pg="+i+"&index_keyword="+index_keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='index_contactList_Plus.do?pg="+(endPage+1)+"&index_keyword="+index_keyword+"'>다음</a>");
	}
}











