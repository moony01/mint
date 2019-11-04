package mint.suggestBoard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.suggestBoard.bean.SuggestBoardDTO;

@Repository("suggestBoardDAO")
public class SuggestBoardDAOMybatis implements SuggestBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeSuggestBoard(SuggestBoardDTO suggestBoardDTO) {
		//sqlSession.insert("suggestSQL.writeSuggestBoard", suggestBoardDTO);
	}

}
