package customerService.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CustomerServicePaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	public void C_notice_PagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(endPage+1)+"'>다음</a>]");
	}
	
	public void C_notice_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(endPage+1)+"'>다음</a>]");
	}
	
	public void C_inquire_PagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_inquire_List.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_inquire_List.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_inquire_List.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_inquire_List.do?pg="+(endPage+1)+"'>다음</a>]");
	}
	
	public void C_inquire_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_notice.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_notice.do?pg="+(endPage+1)+"'>다음</a>]");
	}
	
	public void C_contactList_PagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_contactList.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_contactList.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_contactList.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_contactList.do?pg="+(endPage+1)+"'>다음</a>]");
	}
	
	public void C_contactList_searchPagingHTML(){
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("[<a href='C_contactList.do?pg="+(startPage-1)+"'>이전</a>]");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id=currentPaging href='C_contactList.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id=paging href='C_contactList.do?pg="+i+"'>"+i+"</a>]");
		}
		if(endPage!=totalP) 
			pagingHTML.append("[<a href='C_contactList.do?pg="+(endPage+1)+"'>다음</a>]");
	}
}











