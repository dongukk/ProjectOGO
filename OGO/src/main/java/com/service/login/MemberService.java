package com.service.login;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.login.MySqlSessionFactory;
import com.dao.login.MemberDAO;
import com.dto.login.MemberDTO;
import com.dto.login.PageDTO;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new   MemberDAO();
	}

	public MemberDTO login(HashMap<String,String> map) {
		MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 MemberDTO dto = null; 
		 try {
		      dto = dao.login(session, map);
		 }catch (Exception e) {
			e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return dto;
		}
	
	public int idCheck(String userId) {
		MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 int n = 0; 
		 try {
		      n = dao.idCheck(session, userId);
		       session.commit();	  
		      }finally {
				session.close();
		      }
		      return n;
			}
	public int nicknameCheck(String nickname) {
		MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 int n = 0; 
		 try {
		      n = dao.nicknameCheck(session, nickname);
		       session.commit();	  
		      }finally {
				session.close();
		      }
		      return n;
			}
	public List<MemberDTO> select() {
	 SqlSession session = MySqlSessionFactory.getSession();
	 List<MemberDTO> list = null; 
	 try {
      list = dao.select(session);
    	  
//      }catch(Exception e) {
//    	  e.printStackTrace();
      }finally {
		session.close();
      }
      return list;
	}//end select
	
	public int memberAdd(MemberDTO dto) {
		 SqlSession session = MySqlSessionFactory.getSession();
		 int n = 0; 
		 try {
	      n = dao.memberAdd(session, dto);
	        session.commit();	  
	      }finally {
			session.close();
	      }
	      return n;
	}
	
	public int delete(String userId) {
		 SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		 try {
	      n = dao.delete(session, userId);
	    	 session.commit();
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return n;
		}//end select
	
	public int deleteAll(List<String> list) {
		 SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		 try {
	      n = dao.deleteAll(session, list);
	    	 session.commit();
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return n;
		}//end select

	
	public MemberDTO mypage(String userid) {
		 SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto=null;
		try {
			MemberDAO dao=new MemberDAO();
			dto = dao.mypage(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}

	public int memberUpdate(MemberDTO dto) {
		SqlSession session=MySqlSessionFactory.getSession();
		int n=0;
		try {
			MemberDAO dao=new MemberDAO();
			n=dao.memberUpdate(session, dto);
			session.commit();
		
		}finally {
			session.close();
		}
		return n;
	}

	public MemberDTO findId(HashMap<String, String> map) {
		MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 MemberDTO dto = null; 
		 try {
		      dto = dao.findId(session, map);
		 }catch (Exception e) {
			e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return dto;
	}

	public MemberDTO findPw(HashMap<String, String> map) {
		MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 MemberDTO dto = null; 
		 try {
		      dto = dao.findPw(session, map);
		 }catch (Exception e) {
			e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return dto;
	}

	public int newPw(HashMap<String, String> map) {
		SqlSession session=MySqlSessionFactory.getSession();
		int n=0;
		try {
			MemberDAO dao=new MemberDAO();
			n=dao.newPw(session, map);
			session.commit();
		
		}finally {
			session.close();
		}
		return n;
	}

	public PageDTO search(String searchName, String searchValue, int curPage) {		
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		 MemberDAO dao = new MemberDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 PageDTO pDTO = null;
		 try {
			 pDTO = dao.search(session,map, curPage);	// map:검색결과, 최초 실행시curPage = 1
	    	  
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return pDTO;
		}//end select



	
}
