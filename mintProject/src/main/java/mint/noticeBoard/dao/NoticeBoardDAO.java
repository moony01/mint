package mint.noticeBoard.dao;

import java.util.List;
import java.util.Map;

import mint.noticeBoard.bean.NoticeBoardDTO;

public interface NoticeBoardDAO {

	public List<NoticeBoardDTO> noticeBoardList(Map<String, Integer> map);

	public int getTotalNotice();

	public List<NoticeBoardDTO> noticeBoardSearch(Map<String, Object> map);

	public int getSearchTotalNotice(Map<String, Object> map);

	public NoticeBoardDTO getNoticeBoardView(String seq);

	public void noticeBoardDelete(Map<String, Object> map);
	
}
