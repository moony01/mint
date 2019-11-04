package mint.noticeBoard.service;

import java.util.List;
import java.util.Map;

import mint.noticeBoard.bean.NoticeBoardDTO;

public interface NoticeBoardService {

	List<NoticeBoardDTO> noticeBoardList(Map<String, Integer> map);

}
