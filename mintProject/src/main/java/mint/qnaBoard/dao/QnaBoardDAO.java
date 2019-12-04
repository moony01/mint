package mint.qnaBoard.dao;

import java.util.List;
import java.util.Map;

import mint.qnaBoard.bean.QnaBoardDTO;

public interface QnaBoardDAO {

	public List<QnaBoardDTO> getQnaBoardList(Map<String, String> map);

	public List<Map<String,String>> getOrderList(String memId);

	public void qnaBoardWrite(QnaBoardDTO qnaBoardDTO);

	public QnaBoardDTO getQnaModify(int seq);

	public void qnaBoardModify(QnaBoardDTO qnaBoardDTO);

	public void qnaBoardDelete(int seq);

	public int getAdminQnaBoardCnt(Map<String, String> map);

	public List<QnaBoardDTO> getAdminQnaBoardList(Map<String, String> map);

	public QnaBoardDTO getAdminQnaReply(Map<String, String> map);

	public int updateAdminReply(Map<String, String> map);

}
