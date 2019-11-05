package mint.suggestBoard.service;

import java.util.List;
import java.util.Map;

import mint.suggestBoard.bean.SuggestBoardDTO;

public interface SuggestBoardService {

	public void writeSuggestBoard(SuggestBoardDTO suggestBoardDTO);

	public List<SuggestBoardDTO> getSuggestBoardList(Map<String, Integer> map);

	public int getSuggestBoardTotArticle();

}
