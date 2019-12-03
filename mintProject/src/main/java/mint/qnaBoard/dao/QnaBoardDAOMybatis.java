package mint.qnaBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.order.bean.OrderAndSalesDTO;
import mint.qnaBoard.bean.QnaBoardDTO;

@Transactional
@Repository(value="qndBoardDAO")
public class QnaBoardDAOMybatis implements QnaBoardDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<QnaBoardDTO> getQnaBoardList(Map<String, String> map) {
		return sqlsession.selectList("qnaBoardSQL.getQnaBoardList",map);
	}

	@Override
	public List<Map<String,String>> getOrderList(String memId) {
		return sqlsession.selectList("qnaBoardSQL.getOrderList", memId);
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

	@Override
	public int getAdminQnaBoardCnt(Map<String, String> map) {
		return sqlsession.selectOne("qnaBoardSQL.getAdminQnaBoardCnt", map);
	}

	@Override
	public List<QnaBoardDTO> getAdminQnaBoardList(Map<String, String> map) {
		return sqlsession.selectList("qnaBoardSQL.getAdminQnaBoardList", map);
	}

	@Override
	public QnaBoardDTO getAdminQnaReply(Map<String, String> map) {
		return sqlsession.selectOne("qnaBoardSQL.getAdminQnaReply", map);
	}

	@Override
	public int updateAdminReply(Map<String, String> map) {
		return sqlsession.update("qnaBoardSQL.updateAdminReply", map);
	}                                            

}
