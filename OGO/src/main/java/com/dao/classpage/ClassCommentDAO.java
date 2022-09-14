package com.dao.classpage;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassComment_rowDTO;

public class ClassCommentDAO {

	public List<ClassCommentDTO> view(SqlSession session) {
		List<ClassCommentDTO> list = session.selectList("ClassCommentMapper.view");
		return list;
	}


	
	
	
}//end class
