package mint.faqBoard.service;

import java.util.List;
import java.util.Map;

import mint.faqBoard.bean.FAQBoardDTO;

public interface FAQBoardService {

	public List<FAQBoardDTO> getBoardList(Map<String, Integer> map);

	public int getTotalArticle();

}
