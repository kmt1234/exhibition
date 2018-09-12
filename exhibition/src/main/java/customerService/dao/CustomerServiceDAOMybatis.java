package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.HotelboardDTO;
import customerService.bean.ImageboardDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public CustomerServiceDTO getNoticeInfo(String seq) {
	      return sqlSession.selectOne("customerServiceSQL.getNoticeInfo", seq);
   }
   public void C_notice_Write(Map<String, String> map) {
      sqlSession.insert("customerServiceSQL.C_notice_Write", map);      
   }
   public void C_notice_Modify(Map<String, String> map) {
      sqlSession.update("customerServiceSQL.C_notice_Modify", map);
   }
   public int getTotalC_notice() {
		return sqlSession.selectOne("customerServiceSQL.getTotalC_notice");
	}
   public void C_checkInquire(CustomerServiceDTO customerServiceDTO) {
      sqlSession.insert("customerServiceSQL.C_checkInquire", customerServiceDTO);
   }
   public List<CustomerServiceDTO> getQnA_Classify(String classify) {
      return sqlSession.selectList("customerServiceSQL.getQnA_Classify", classify);
   }
   public void C_QnA_checkWrite(Map<String, String> map) {
      sqlSession.insert("customerServiceSQL.C_QnA_checkWrite", map);      
   }

   public void C_contactList_checkWrite(Map<String, String> map) {
      sqlSession.insert("customerServiceSQL.C_contactList_checkWrite", map);      
   }


   public List<CustomerServiceDTO> getNoticeList(Map<String, Integer> map) {
      return sqlSession.selectList("customerServiceSQL.getNoticeList", map);
   }


   public CustomerServiceDTO getInfo(String seq) {
      return sqlSession.selectOne("customerServiceSQL.getInfo", seq);
   }


   public void C_notice_Delete(String seq) {
      sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
   }




   public List<CustomerServiceDTO> getInquireList() {
      return sqlSession.selectList("customerServiceSQL.getInquireList");
   }


   public CustomerServiceDTO getInquireInfo(String seq) {
      return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
   }
   
   public CustomerServiceDTO getReplyInfo(String seq) {
      return sqlSession.selectOne("customerServiceSQL.getReplyInfo", seq);
   }

   public List<CustomerServiceDTO> getQnAList() {
      return sqlSession.selectList("customerServiceSQL.getQnAList");
   }


   public List<CustomerServiceDTO> getContactList() {
      return sqlSession.selectList("customerServiceSQL.getContactList");
   }

	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```*/
	
	
	
	
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		sqlSession.insert("customerServiceSQL.imageboardWrite",imageboardDTO);
	}
	public int getImageboardTotalA() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getImageboardTotalA");
		return totalA;
	}

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.imageboardList",map);
	}

	public void imageboardDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.imageboardDelete",list);
	}

	public List<ImageboardDTO> getList(List<Integer> list) {
		return sqlSession.selectList("customerServiceSQL.getList",list);
		
	}
		
	//박람회 정보 등록
	public void eventInfoWrite(EventboardDTO eventboardDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite", eventboardDTO);
	}
	
	//메인(슬라이드 이미지 불러오기)
	public List<ImageboardDTO> getImageboardSlide() {
		return sqlSession.selectList("customerServiceSQL.getImageboardSlide");
	}
	
	//박람회 업로드 리스트 가져오기
	public List<EventboardDTO> eventboardList(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.eventboardList", map);
	}
	
	//박람회 업로드 리스트 총 글수 가져오기
	public int getEventboardTotalA() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getEventboardTotalA"); 
		return totalA;
	}

	//박람회 업로드 리스트 삭제 
	public void eventboardDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.eventboardDelete", list);
		
	}

	//연극 업로드 리스트 가져오기
	public List<EventboardDTO> eventboardList_play(Map<String, Integer> map) {
		return sqlSession.selectList("customerServiceSQL.eventboardList_play", map);
	}
	
	//연극 업로드 리스트 총 글수 가져오기
	public int getEventboardTotalA_play() {
		int totalA = sqlSession.selectOne("customerServiceSQL.getEventboardTotalA_play"); 
		return totalA;
	}
	
	//연극 정보 등록
	public void eventInfoWrite_play(EventboardDTO eventboardDTO) {
		sqlSession.insert("customerServiceSQL.eventInfoWrite_play", eventboardDTO);
	}
	
	//연극 업로드 리스트 삭제
	public void eventboardDelete_play(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.eventboardDelete_play", list);
	}	
	//호텔정보등록
	public void hotelInfoWrite(HotelboardDTO hotelboardDTO) {
		sqlSession.insert("customerServiceSQL.hotelInfoWrite", hotelboardDTO);
	}
	//호텔리스트
	public List<HotelboardDTO> hotelList() {
		return sqlSession.selectList("customerServiceSQL.hotelList");
	}
	//호텔리스트 삭제
	public void hotelDelete(List<Integer> list) {
		sqlSession.delete("customerServiceSQL.hotelDelete", list);
	}
	//호텔이미지 삭제하기 위해 리스트 불러오기
		public List<HotelboardDTO> hotelImageDel(List<Integer> list) {
			return sqlSession.selectList("customerServiceSQL.hotelImageDel",list);
	}
	
	
	

}