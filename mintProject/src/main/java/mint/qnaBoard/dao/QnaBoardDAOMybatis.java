package mint.qnaBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.qnaBoard.bean.QnaBoardDTO;

@Repository(value="qndBoardDAO")
public class QnaBoardDAOMybatis implements QnaBoardDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<QnaBoardDTO> getQnaBoardList(Map<String, Object> map) {
		System.out.println("aa");
		return sqlsession.selectList("qnaBoardSQL.getQnaBoardList");
	}                                            

}
