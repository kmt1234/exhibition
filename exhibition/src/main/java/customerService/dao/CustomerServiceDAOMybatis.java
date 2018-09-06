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
	
	public void C_Inquire(CustomerServiceDTO customerServiceDTO) {
		sqlSession.insert("customerServiceSQL.C_Inquire", customerServiceDTO);				
		
	}
	
	//고객센터 - 게시판 추가 - 메인 이미지 슬라이드 추가
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