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
	
	//공지사항 페이징
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
	
	//공지사항 검색후 페이징
	public void C_notice_searchPagingHTML(String keyword) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='C_notice_Search.do?pg="+(startPage-1)+"&keyword="+keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_notice_Search.do?pg="+i+"&keyword="+keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_notice_Search.do?pg="+i+"&keyword="+keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_notice_Search.do?pg="+(endPage+1)+"&keyword="+keyword+"'>다음</a>");
	}
	
	//고객의 소리 페이징
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
	
	//고객의 소리 검색후 페이징
	public void C_inquire_searchPagingHTML(String keyword, String searchOption) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='C_inquire_SearchList.do?pg="+(startPage-1)+"&searchOption="+searchOption+"&keyword="+keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_inquire_SearchList.do?pg="+i+"&searchOption="+searchOption+"&keyword="+keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_inquire_SearchList.do?pg="+i+"&searchOption="+searchOption+"&keyword="+keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_inquire_SearchList.do?pg="+(endPage+1)+"&searchOption="+searchOption+"&keyword="+keyword+"'>다음</a>");
	}
	
	//주요시설 연락처 페이징
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
	
	//주요시설 연락처 검색후 페이징
	public void C_contactList_searchPagingHTML(String keyword, String searchOption) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<a class='item' href='C_contactList_SearchList.do?pg="+(startPage-1)+"&searchOption="+searchOption+"&keyword="+keyword+"'>이전</a>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<a class='item' id=currentPaging href='C_contactList_SearchList.do?pg="+i+"&searchOption="+searchOption+"&keyword="+keyword+"'>"+i+"</a>");
			else
				pagingHTML.append("<a class='item' id=paging href='C_contactList_SearchList.do?pg="+i+"&searchOption="+searchOption+"&keyword="+keyword+"'>"+i+"</a>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<a class='item' href='C_contactList_SearchList.do?pg="+(endPage+1)+"&searchOption="+searchOption+"&keyword="+keyword+"'>다음</a>");
	}
	//사업자 페이징
	public void company_pagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span  id=paging onclick=CompanyList("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span id=currentPaging onclick=CompanyList("+i+")>"+"["+i+"]"+"</span>");
			else
				pagingHTML.append("<span id=paging onclick=CompanyList("+i+")>"+"["+i+"]"+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span id=paging onclick=CompanyList("+(endPage+1)+")>다음</span>");
	}
	
	//사업자 검색 페이징
	public void companySearch_pagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+(pageBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		if(startPage!=1) 
			pagingHTML.append("<span  id=paging onclick=CompanySearch("+(startPage-1)+")>이전</span>");
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<span id=currentPaging onclick=CompanySearch("+i+")>"+"["+i+"]"+"</span>");
			else
				pagingHTML.append("<span id=paging onclick=CompanySearch("+i+")>"+"["+i+"]"+"</span>");
		}
		if(endPage!=totalP) 
			pagingHTML.append("<span id=paging onclick=CompanySearch("+(endPage+1)+")>다음</span>");
	}
	
	//개인회원 페이징
		public void member_pagingHTML() {
			pagingHTML = new StringBuffer();
			
			int totalP = (totalA+pageSize-1)/pageSize;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage = startPage+(pageBlock-1);
			if(endPage > totalP) endPage = totalP;
			
			if(startPage!=1) 
				pagingHTML.append("<span  id=paging onclick=memberList("+(startPage-1)+")>이전</span>");
			for(int i=startPage; i<=endPage; i++) {
				if(i==currentPage)
					pagingHTML.append("<span id=currentPaging onclick=memberList("+i+")>"+"["+i+"]"+"</span>");
				else
					pagingHTML.append("<span id=paging onclick=memberList("+i+")>"+"["+i+"]"+"</span>");
			}
			if(endPage!=totalP) 
				pagingHTML.append("<span id=paging onclick=memberList("+(endPage+1)+")>다음</span>");
		}
		
		//개인회원 검색 페이징
		public void memberSearch_pagingHTML() {
			pagingHTML = new StringBuffer();
			
			int totalP = (totalA+pageSize-1)/pageSize;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage = startPage+(pageBlock-1);
			if(endPage > totalP) endPage = totalP;
			
			if(startPage!=1) 
				pagingHTML.append("<span  id=paging onclick=memberSearch("+(startPage-1)+")>이전</span>");
			for(int i=startPage; i<=endPage; i++) {
				if(i==currentPage)
					pagingHTML.append("<span id=currentPaging onclick=memberSearch("+i+")>"+"["+i+"]"+"</span>");
				else
					pagingHTML.append("<span id=paging onclick=memberSearch("+i+")>"+"["+i+"]"+"</span>");
			}
			if(endPage!=totalP) 
				pagingHTML.append("<span id=paging onclick=memberSearch("+(endPage+1)+")>다음</span>");
		}
}











