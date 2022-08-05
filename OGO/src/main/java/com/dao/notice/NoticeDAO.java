package com.dao.notice;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

public class NoticeDAO {
	public List<NoticeDTO> selectAll(SqlSession session) {
		List<NoticeDTO> list = session.selectList("noticeMapper.selectAll");
		return list;
	}

	public NoticeDTO selectContent(SqlSession session, String nnum) {
		NoticeDTO dto = session.selectOne("noticeMapper.selectContent",nnum);
		return dto;
	}

	public PageDTO selectP(SqlSession session, int curPage) {
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;

		System.out.println(offset+""+perPage);
		
		List<NoticeDTO> list = session.selectList("noticeMapper.selectP", null ,new RowBounds(offset,perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount( totalcount(session) );
		return pDTO;
	}
	
	public int totalcount( SqlSession session ) {
		int count = session.selectOne("noticeMapper.totalcount");
		System.out.println(count);
		return count;
	}

	public int new_notice(SqlSession session, NoticeDTO ndto) {
		int Cnum = session.insert("noticeMapper.new_notice",ndto);
		return Cnum;
	}

	public int update(SqlSession session, NoticeDTO ndto) {
		int num = session.update("noticeMapper.update",ndto);
		return num;
	}

	public int delete(SqlSession session, String nnum) {
		int num = session.delete("noticeMapper.delete",nnum);
		return num;
	}
}
