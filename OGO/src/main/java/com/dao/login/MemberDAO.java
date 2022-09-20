package com.dao.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.login.MemberDTO;
import com.dto.login.PageDTO;

public class MemberDAO {
	
	public MemberDTO login(SqlSession session, HashMap<String,String> map) {
		MemberDTO dto =  session.selectOne("MemberMapper.login", map );
		return dto;
	}	
	public int memberAdd(SqlSession session, MemberDTO dto) {
		int n = session.insert("MemberMapper.insertByMember", dto);
		return n;
	}
	public List<MemberDTO> select(SqlSession session) {
		List<MemberDTO> list =  session.selectList("MemberMapper.selectAllMember");
		return list;
	}
	public int idCheck(SqlSession session, String userId) {
		int n =  session.selectOne("MemberMapper.idCheck" , userId );
		return n;
	}
	public int nicknameCheck(SqlSession session, String nickname) {
		int n =  session.selectOne("MemberMapper.nicknameCheck" , nickname );
		return n;
	}

	public int delete(SqlSession session, String userId) {		
		int n = session.delete("MemberMapper.deleteByMember", userId);
		return 1;
	}
    public int deleteAll(SqlSession session, List<String> list) {		
    	int n = session.delete("MemberMapper.deleteByAllMember", list);
		return 1;
	}
    public MemberDTO mypage(SqlSession session, String userid) {
		MemberDTO n = session.selectOne("MemberMapper.mypage", userid);
		return n;
	}
	
    public int memberUpdate(SqlSession session, MemberDTO dto) {  
	  int n = session.update("MemberMapper.memberUpdate", dto); 
	  return n; 
	}
	 
	  public boolean deleteID(String id, String pw) {
		  String driver = "oracle.jdbc.driver.OracleDriver";
		  /*String url = "jdbc:oracle:thin:@localhost:1521:xe";
		  String userid = "mouse";
		  String passwd = "mouse";*/
		  String url = "jdbc:oracle:thin:@ogo_medium?TNS_ADMIN=C:/eclipse/Wallet/Wallet_ogo";
		  String userid = "ADMIN";
		  String passwd = "OGOogo1234567";
		 
		  
		  Boolean result=false;
		String dbpw="";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url, userid, passwd);
			String sql="select USERPASSWD from member where USERID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw=rs.getString("USERPASSWD");
				if(dbpw.equals(pw)) {
					String delsql = "delete from member where USERID=?";
					pstmt=con.prepareStatement(delsql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result=true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		  
		return result;  
		  
	  }
	public MemberDTO findId(SqlSession session, HashMap<String, String> map) {
		MemberDTO dto =  session.selectOne("MemberMapper.findId", map );
		return dto;
	}
	public MemberDTO findPw(SqlSession session, HashMap<String, String> map) {
		MemberDTO dto =  session.selectOne("MemberMapper.findPw", map );
		return dto;
	}
	public int newPw(SqlSession session, HashMap<String, String> map) {
		int n = session.update("MemberMapper.newPw", map); 
		return n; 
	}
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		 int n = session.selectOne("MemberMapper.totalCount",map);
		 System.out.println("totalCount : "+n);
		 return n;
	}
	
	public PageDTO search(SqlSession session , HashMap<String, String> map, int curPage) {		
		PageDTO pDTO = new PageDTO();		// perPage = 2
		int perPage = pDTO.getPerPage();   //한페이지 10개씩 
		int offset = (curPage - 1) * perPage; // 최초curPage=1, offset= 1페이지=0, 2페이지면 =2, 3페이지면 =4
		System.out.println("map : "+map+"curPage : "+curPage);
		List<MemberDTO> list =  session.selectList("MemberMapper.search" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		System.out.println("list : "+list);
		pDTO.setCurPage(curPage);//현재 페이지번호 1
		pDTO.setList(list);//페이지 에 해당 데이터 (0, 1)
		pDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
		
		return pDTO;
	}
	public List<MemberDTO> order(SqlSession session, HashMap<String, String> map) {
		List<MemberDTO> list =  session.selectList("MemberMapper.order" , map);
		return list;
	}

	  
	  
	  
	  
}
