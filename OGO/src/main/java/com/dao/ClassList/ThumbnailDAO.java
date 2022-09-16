package com.dao.ClassList;

import org.apache.ibatis.session.SqlSession;

import com.dto.ClassList.ThumbnailDTO;

public class ThumbnailDAO {

	public int uploadImg(SqlSession session, ThumbnailDTO iDTO) {
		int num=session.insert("ThumbnailMapper.uploadImg", iDTO);
		return num;
	}

}
