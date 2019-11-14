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

	@Override
	public List<FAQBoardDTO> faqBoardSearch(Map<String, Object> map) {
		return faqBoardDAO.faqBoardSearch(map);
	}

	@Override
	public int getSearchTotalArticle(Map<String, Object> map) {
		return faqBoardDAO.getSearchTotalArticle(map);
	}

	@Override
	public void faqBoardWrite(Map<String, String> map) {
		faqBoardDAO.faqBoardWrite(map);		
	}

	@Override
	public FAQBoardDTO getFAQArticle(int seq) {
		return faqBoardDAO.getFAQArticle(seq);
	}

	@Override
	public List<FAQBoardDTO> faqCategory(Map<String, Object> map) {
		return faqBoardDAO.faqCategory(map);
	}

	@Override
	public int getCategoryTotalArticle(Map<String, Object> map) {
		return faqBoardDAO.getFAQCategoryTotalArticle(map);
	}

	@Override
	public void faqDelete(Map<String, String[]> map) {
		faqBoardDAO.faqDelete(map);
	}

	@Override
	public void faqModify(Map<String, String> map) {
		faqBoardDAO.faqModify(map);
		
	}

}
