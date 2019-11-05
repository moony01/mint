package mint.noticeBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.noticeBoard.bean.NoticeBoardDTO;
import mint.noticeBoard.dao.NoticeBoardDAO;

@Service(value="noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;
	
	@Override
	public List<NoticeBoardDTO> noticeBoardList(Map<String, Integer> map) {
		return noticeBoardDAO.noticeBoardList(map);
	}

	@Override
	public int getTotalNotice() {
		return noticeBoardDAO.getTotalNotice();
	}

}
