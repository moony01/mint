package mint.qnaBoard.dao;

import java.util.List;
import java.util.Map;

import mint.qnaBoard.bean.OrderAndSalesDTO;
import mint.qnaBoard.bean.QnaBoardDTO;

public interface QnaBoardDAO {

	public List<QnaBoardDTO> getQnaBoardList(Map<String, Object> map);

	public List<OrderAndSalesDTO> getOrderList(String email);

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

}
