package com.dao.classpage;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassComment_rowDTO;
import com.dto.classpage.UpdateCommentDTO;

public class ClassCommentDAO {

	public List<ClassCommentDTO> view(SqlSession session) {
		List<ClassCommentDTO> list = session.selectList("ClassCommentMapper.view");
		return list;
	}

	public int cmtAdd(SqlSession session, ClassCommentDTO cmt_dto) {
		int n = session.insert("ClassCommentMapper.cmtAdd", cmt_dto);
		return n;
	}

	public int cmtUpdate(SqlSession session, UpdateCommentDTO cmtupdatedto) {
		int n = session.update("ClassCommentMapper,cmtUpdate",cmtupdatedto);
		return n;
	}

	public int cmtDelete(SqlSession session, String classnum) {
		int n = session.delete("ClassCommentMapper,cmtDelete",classnum);
		return n;
	}

	
	
	
}//end class
