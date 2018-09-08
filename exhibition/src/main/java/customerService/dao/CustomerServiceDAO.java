package customerService.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.EventboardDTO;
import customerService.bean.ImageboardDTO;

public interface CustomerServiceDAO {
	public void C_Inquire(CustomerServiceDTO customerServiceDTO);

	public void imageboardWrite(ImageboardDTO imageboardDTO); //메인 이미지 등록(슬라이드)

	public int getImageboardTotalA();

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map);

	public void imageboardDelete(List<Integer> list);

	public List<ImageboardDTO> getList(List<Integer> list);

	public void eventInfoWrite(EventboardDTO eventboardDTO);	//박람회 정보 등록
	
	public List<ImageboardDTO> getImageboardSlide();	//메인(슬라이드 이미지 불러오기)

	public List<EventboardDTO> eventboardList(Map<String, Integer> map);	//박람회 업로드 리스트 가져오기

	public int getEventboardTotalA();	//박람회 업로드 리스트 총 글수 가져오기

	public void eventboardDelete(List<Integer> list);	//박람회 업로드 리스트 삭제 

}