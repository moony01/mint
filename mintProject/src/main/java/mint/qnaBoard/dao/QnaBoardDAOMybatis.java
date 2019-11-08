package mint.qnaBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.qnaBoard.bean.OrderAndSalesDTO;
import mint.qnaBoard.bean.QnaBoardDTO;

@Transactional
@Repository(value="qndBoardDAO")
public class QnaBoardDAOMybatis implements QnaBoardDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<QnaBoardDTO> getQnaBoardList(Map<String, Object> map) {
		return sqlsession.selectList("qnaBoardSQL.getQnaBoardList");
	}

	@Override
	public List<OrderAndSalesDTO> getOrderList(String email) {
		//회원가입이 일단 없으므로 임시로 테스트함..
		String eemail = "sonsangz@naver.com";
		
		return sqlsession.selectList("qnaBoardSQL.getOrderList", eemail);
	}

	@Override
	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO) {
		sqlsession.insert("qnaBoardSQL.qnaBoardWrite", qnaBoardDTO);
	}

	@Override
	public QnaBoardDTO getQnaModify(int seq) {
		return sqlsession.selectOne("qnaBoardSQL.getQnaModify", seq);
	}

	@Override
	public void qnaBoardModify(QnaBoardDTO qnaBoardDTO) {
		sqlsession.update("qnaBoardSQL.qnaBoardModify", qnaBoardDTO);
		
	}

	@Override
	public void qnaBoardDelete(int seq) {
		sqlsession.delete("qnaBoardSQL.qnaBoardDelete", seq);
		
	}                                            

}
