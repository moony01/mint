package mint.noticeBoard.dao;

import java.util.List;
import java.util.Map;

import mint.noticeBoard.bean.NoticeBoardDTO;

public interface NoticeBoardDAO {

	public List<NoticeBoardDTO> noticeBoardList(Map<String, Integer> map);
	
}
