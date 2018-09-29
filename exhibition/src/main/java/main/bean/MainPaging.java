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
	
	
}











