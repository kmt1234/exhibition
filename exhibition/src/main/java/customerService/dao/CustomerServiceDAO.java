package customerService.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.ImageboardDTO;

public interface CustomerServiceDAO {
	
	public void C_notice_Write(Map<String, String> map);
	
	public List<CustomerServiceDTO> getNoticeList();
		
	public CustomerServiceDTO getInfo(String seq);

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

}