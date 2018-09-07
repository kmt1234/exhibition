package customerService.dao;

import java.util.List;
import java.util.Map;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.ImageboardDTO;

public interface CustomerServiceDAO {
	public void C_Inquire(CustomerServiceDTO customerServiceDTO);

	public void imageboardWrite(ImageboardDTO imageboardDTO); //고객센터-게시판 추가-메인 이미지 등록

	public int getImageboardTotalA();

	public List<ImageboardDTO> imageboardList(Map<String, Integer> map);

	public void imageboardDelete(List<Integer> list);

	public List<ImageboardDTO> getList(List<Integer> list);

}