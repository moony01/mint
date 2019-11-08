package mint.faqBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.faqBoard.bean.FAQBoardDTO;
import mint.faqBoard.dao.FAQBoardDAO;

@Service(value="faqBoardService")
public class FAQBoardServiceImpl implements FAQBoardService {
	@Autowired
	private FAQBoardDAO faqBoardDAO;
	
	@Override
	public List<FAQBoardDTO> getBoardList(Map<String, Integer> map) {
		return faqBoardDAO.getBoardList(map);
	}

	@Override
	public int getTotalArticle() {
		return faqBoardDAO.getTotalArticle();
	}

}
