package customerService.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ImageboardDTO;


public interface CustomerServiceDAO {
	
	public void C_notice_Write(Map<String, String> map);
	
	public List<CustomerServiceDTO> getNoticeList();
		
	public void C_notice_Delete(String seq);

	public void C_notice_Modify(Map<String, String> map);

	public List<CustomerServiceDTO> getInquireList();

	public void C_inquire(CustomerServiceDTO customerServiceDTO);
	
	public void C_QnA_Write(Map<String, String> map);
	
	public CustomerServiceDTO getInquireInfo(String seq);

	public List<CustomerServiceDTO> getQnAList();
	
	public void C_contactList_Write(Map<String, String> map);

	public List<CustomerServiceDTO> getContactList();

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public int getImageboardTotalA();

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map);

	public void imageboardDelete(List<Integer> list);

	public List<ImageboardDTO> getList(List<Integer> list);
	
	public void eventInfoWrite(EventboardDTO eventboardDTO);	//박람회 정보 등록
	
	public List<ImageboardDTO> getImageboardSlide();	//메인(슬라이드 이미지 불러오기)

	public List<EventboardDTO> eventboardList(Map<String, Integer> map);	//박람회 업로드 리스트 가져오기

	public int getEventboardTotalA();	//박람회 업로드 리스트 총 글수 가져오기
	
	public CustomerServiceDTO getInfo(String seq);
	
	public void eventboardDelete(List<Integer> list);	//박람회 업로드 리스트 삭제 
	
	public List<EventboardDTO> eventboardList_play(Map<String, Integer> map);	//박람회 업로드 리스트 가져오기

	public int getEventboardTotalA_play();	//연극 업로드 리스트 총 글수 가져오기
}