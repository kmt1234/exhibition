package member.dao;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberTicketListPaging {
	private int currentPage;
	private int pageBlock;
	private int pageSize;	
	private int totalA;		
	private StringBuffer pagingHTML;
	
	//예매리스트 페이징
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage =(currentPage-1)/pageBlock*pageBlock+1;

		
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage>pageBlock)	
			pagingHTML.append("[<span id=paging onclick=MemberTicketListPaging("+(startPage-1)+")>다음</span>]");
	
		for(int i = startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id=currentPaging onclick=MemberTicketListPaging("+i+")>"+i+"</span>]");
			}else {
				pagingHTML.append("[<span id=paging onclick=MemberTicketListPaging("+i+")>"+i+"</span>]");
			}
		}
		if(endPage < totalP)
			pagingHTML.append("[<span id=paging onclick=MemberTicketListPaging("+(endPage+1)+")>이전</span>]");
	}

}

