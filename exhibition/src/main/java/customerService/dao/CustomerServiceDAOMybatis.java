package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.CustomerServiceDTO;
import customerService.bean.ImageboardDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void C_notice_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_notice_Write", map);		
	}
	

	public void C_inquire(CustomerServiceDTO customerServiceDTO) {
		sqlSession.insert("customerServiceSQL.C_inquire", customerServiceDTO);
	}
	
	public void C_QnA_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_QnA_Write", map);		
	}

	public void C_contactList_Write(Map<String, String> map) {
		sqlSession.insert("customerServiceSQL.C_contactList_Write", map);		
	}


	public List<CustomerServiceDTO> getNoticeList() {
		return sqlSession.selectList("customerServiceSQL.getNoticeList");
	}


	public CustomerServiceDTO getInfo(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getInfo", seq);
	}


	public void C_notice_Delete(String seq) {
		sqlSession.delete("customerServiceSQL.C_notice_Delete", seq);
	}


	public void C_notice_Modify(Map<String, String> map) {
		sqlSession.update("customerServiceSQL.C_notice_Modify", map);
	}


	public List<CustomerServiceDTO> getInquireList() {
		return sqlSession.selectList("customerServiceSQL.getInquireList");
	}


	public CustomerServiceDTO getInquireInfo(String seq) {
		return sqlSession.selectOne("customerServiceSQL.getInquireInfo", seq);
	}


	public List<CustomerServiceDTO> getQnAList() {
		return sqlSession.selectList("customerServiceSQL.getQnAList");
	}


	public List<CustomerServiceDTO> getContactList() {
		return sqlSession.selectList("customerServiceSQL.getContactList");
	}

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

}