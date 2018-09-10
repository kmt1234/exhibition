package customerService.bean;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

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
		
		int totalP = (totalA-1)/pageSize+1;
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
}











