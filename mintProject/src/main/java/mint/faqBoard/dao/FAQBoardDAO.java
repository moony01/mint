package mint.faqBoard.dao;

import java.util.List;
import java.util.Map;

import mint.faqBoard.bean.FAQBoardDTO;

public interface FAQBoardDAO {

	public List<FAQBoardDTO> getBoardList(Map<String, Integer> map);

	public int getTotalArticle();

}
