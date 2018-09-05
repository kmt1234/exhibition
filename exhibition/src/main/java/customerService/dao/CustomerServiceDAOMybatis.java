package customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import customerService.bean.CustomerServiceDTO;

@Transactional
@Component
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void C_Inquire(CustomerServiceDTO customerServiceDTO) {
		sqlSession.insert("customerServiceSQL.C_Inquire", customerServiceDTO);				
		
	}
}