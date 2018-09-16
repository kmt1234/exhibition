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
			pagingHTML.append("<a class='item' href='C_notice.do?pg="+(startPage-1)+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_notice.do?pg="+i+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_notice.do?pg="+i+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_notice.do?pg="+(endPage+1)+"'>다음</a>");
	}
	
	public void C_notice_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span class='item' id=paging onclick=C_notice_Search("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span class='item' id=currentPaging onclick=C_notice_Search("+i+")>"+i+"</span>");
			else
				pagingHTML.append("<span class='item' id=paging onclick=C_notice_Search("+i+")>"+i+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span class='item' id=paging onclick=C_notice_Search("+(endPage+1)+")>다음</span>");
	}
	
	public void C_inquire_PagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='C_inquire_List.do?pg="+(startPage-1)+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_inquire_List.do?pg="+i+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_inquire_List.do?pg="+i+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_inquire_List.do?pg="+(endPage+1)+"'>다음</a>");
	}
	
	public void C_inquire_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span class='item' id=paging onclick=C_inquire_Search("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span class='item' id=currentPaging onclick=C_inquire_Search("+i+")>"+i+"</span>");
			else
				pagingHTML.append("<span class='item' id=paging onclick=C_inquire_Search("+i+")>"+i+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span class='item' id=paging onclick=C_inquire_Search("+(endPage+1)+")>다음</span>");
	}
	
	public void C_contactList_PagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='C_contactList.do?pg="+(startPage-1)+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_contactList.do?pg="+i+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_contactList.do?pg="+i+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_contactList.do?pg="+(endPage+1)+"'>다음</a>");
	}
	
	public void C_contactList_searchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span class='item' id=paging onclick=C_contactList_Search("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span class='item' id=currentPaging onclick=C_contactList_Search("+i+")>"+i+"</span>");
			else
				pagingHTML.append("<span class='item' id=paging onclick=C_contactList_Search("+i+")>"+i+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span class='item' id=paging onclick=C_contactList_Search("+(endPage+1)+")>다음</span>");
	}
}











