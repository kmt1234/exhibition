package performance.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PerformancePaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;	
	private int totalA;		
	private StringBuffer pagingHTML;
	
	//공연 리스트 페이징
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=performancePaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=performancePaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=performancePaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=performancePaging("+(endPage+1)+")>이전</span>]");
	}
	
	//박람회 리스트 페이징
	public void makePagingHTML_exhibition() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=performancePaging_exhibition("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=performancePaging_exhibition("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=performancePaging_exhibition("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=performancePaging_exhibition("+(endPage+1)+")>이전</span>]");
	}
	
	//공연 리스트 (다음 3개월) 페이징
	public void makeNextPagingHTML_play() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=performanceNextPaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=performanceNextPaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=performanceNextPaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=performanceNextPaging("+(endPage+1)+")>이전</span>]");
	}
	
	//공연 리스트 (이전 3개월) 페이징
	public void makePrevPagingHTML_play() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=performancePrevPaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=performancePrevPaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=performancePrevPaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=performancePrevPaging("+(endPage+1)+")>이전</span>]");
	}
	
	// 전시회 리스트 (다음 3개월) 페이징
	public void makeNextPagingHTML_exhibition() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=exhibitionNextPaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=exhibitionNextPaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=exhibitionNextPaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=exhibitionNextPaging("+(endPage+1)+")>이전</span>]");
	}
	
	// 전시회 리스트 (이전 3개월) 페이징
	public void makePrevPagingHTML_exhibition() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=exhibitionPrevPaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=exhibitionPrevPaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=exhibitionPrevPaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=exhibitionPrevPaging("+(endPage+1)+")>이전</span>]");
	}
	
}


