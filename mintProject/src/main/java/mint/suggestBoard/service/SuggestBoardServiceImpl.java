package mint.suggestBoard.service;

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

}
