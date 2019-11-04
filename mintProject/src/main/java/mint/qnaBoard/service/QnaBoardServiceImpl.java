package mint.qnaBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.qnaBoard.bean.QnaBoardDTO;
import mint.qnaBoard.dao.QnaBoardDAO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	@Autowired
	private QnaBoardDAO qndBoardDAO;
	
	@Override
	public List<QnaBoardDTO> getQnaBoardList(Map<String, Object> map) {
		return qndBoardDAO.getQnaBoardList(map);
	}

}
