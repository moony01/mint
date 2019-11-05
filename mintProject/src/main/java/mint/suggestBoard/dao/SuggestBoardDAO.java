package mint.suggestBoard.dao;

import java.util.List;
import java.util.Map;

import mint.suggestBoard.bean.SuggestBoardDTO;

public interface SuggestBoardDAO {

	public void writeSuggestBoard(SuggestBoardDTO suggestBoardDTO);

	public List<SuggestBoardDTO> getSuggestBoardList(Map<String, Integer> map);

	public int getSuggestBoardTotArticle();

}
