package com.dao.classpage;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassImgDTO;

public class ClassImgDAO {

	public int uploadImg(SqlSession session, ClassImgDTO iDTO) {
		int num=session.insert("ClassImgMapper.uploadImg", iDTO);
		return num;
	}

}
