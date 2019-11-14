package mint.suggestBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.suggestBoard.bean.SuggestBoardDTO;
import mint.suggestBoard.dao.SuggestBoardDAO;

@Service("suggestBoardService")
public class SuggestBoardServiceImpl implements SuggestBoardService {
	@Autowired
	private SuggestBoardDAO suggestBoardDAO;

	@Override
	public void writeSuggestBoard(SuggestBoardDTO suggestBoardDTO) {
		suggestBoardDAO.writeSuggestBoard(suggestBoardDTO);
	}

	@Override
	public List<SuggestBoardDTO> getSuggestBoardList(Map<String, Object> map) {
		return suggestBoardDAO.getSuggestBoardList(map);
		
	}
	
	@Override
	public List<SuggestBoardDTO> getAllSuggestBoardList(Map<String, Object> map) {
		return suggestBoardDAO.getAllSuggestBoardList(map);
	}

	@Override
	public int getSuggestBoardTotArticle(Map<String, Object> map) {
		return suggestBoardDAO.getSuggestBoardTotArticle(map);
	}
	
	@Override
	public int getAllSuggestBoardTotArticle() {
		return suggestBoardDAO.getAllSuggestBoardTotArticle();
	}
	@Override
	public SuggestBoardDTO getSuggestBoard(int seq) {
		return suggestBoardDAO.getSuggestBoard(seq);
	}

	@Override
	public void updateSuggestBoard(SuggestBoardDTO suggestBoardDTO) {
		suggestBoardDAO.updateSuggestBoard(suggestBoardDTO);
		
	}

	@Override
	public void deleteSuggestBoard(int seq) {
		suggestBoardDAO.deleteSuggestBoard(seq);
		
	}

	@Override
	public void updateReplySuggestBoard(Map<String, String> map) {
		suggestBoardDAO.updateReplySuggestBoard(map);
		
	}

	

	

}
