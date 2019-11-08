package mint.qnaBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.qnaBoard.bean.OrderAndSalesDTO;
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

	@Override
	public List<OrderAndSalesDTO> getOrderList(String email) {
		return qndBoardDAO.getOrderList(email);
	}

	@Override
	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO) {
		qndBoardDAO.qnaBoardWrite(qnaBoardDTO);
		
	}

	@Override
	public QnaBoardDTO getQnaModify(int seq) {
		return qndBoardDAO.getQnaModify(seq);
	}

	@Override
	public void qnaBoardModify(QnaBoardDTO qnaBoardDTO) {
		qndBoardDAO.qnaBoardModify(qnaBoardDTO);
	}

	@Override
	public void qnaBoardDelete(int seq) {
		qndBoardDAO.qnaBoardDelete(seq);
		
	}

}
