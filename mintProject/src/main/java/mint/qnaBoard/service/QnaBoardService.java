package mint.qnaBoard.service;

import java.util.List;
import java.util.Map;

import mint.qnaBoard.bean.QnaBoardDTO;

public interface QnaBoardService {

	public List<QnaBoardDTO> getQnaBoardList(Map<String, Object> map);

}
