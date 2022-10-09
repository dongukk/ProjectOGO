package com.dao.classpage;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassCommentPageDTO;
import com.dto.classpage.DeleteCommentDTO;
import com.dto.classpage.UpdateCommentDTO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

public class ClassCommentDAO {


	public int cmtAdd(SqlSession session, ClassCommentDTO cmt_dto) {
		int n = session.insert("ClassCommentMapper.cmtAdd", cmt_dto);
		return n;
	}

	public int cmtUpdate(SqlSession session, UpdateCommentDTO cmtupdatedto) {
		int n = session.update("ClassCommentMapper.cmtUpdate",cmtupdatedto);
		return n;
	}

	public int cmtDelete(SqlSession session, DeleteCommentDTO cmtdto) {
		int n = session.delete("ClassCommentMapper.cmtDelete",cmtdto);
		return n;
	}

	public ClassCommentPageDTO viewPage(SqlSession session, int curpage) {
		ClassCommentPageDTO cmtpagedto = new ClassCommentPageDTO();
		int perpage = cmtpagedto.getPerPage();
		int offset = (curpage - 1) * perpage; //index 번호
		
		
		List<ClassCommentDTO> listcmtdto = session.selectList("ClassCommentMapper.viewPage",null,new RowBounds(offset,perpage));
		System.out.println("dao: "+listcmtdto);
		cmtpagedto.setCurPage(curpage);
		cmtpagedto.setList(listcmtdto);
		cmtpagedto.setTotalPage( totalcount(session) );
		return cmtpagedto;
	}

	private int totalcount(SqlSession session) {
		int total = session.selectOne("ClassCommentMapper.viewTotal");
		return total;
	}



	
	
	
}//end class
