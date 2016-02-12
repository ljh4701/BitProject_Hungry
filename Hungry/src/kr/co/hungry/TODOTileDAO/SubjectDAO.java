package kr.co.hungry.TODOTileDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.hungry.common.DBUtil;
import kr.co.hungry.TODOTileVO.SubjectVO;

public class SubjectDAO {
	public List<SubjectVO> getTabSubjectList(){
		List<SubjectVO> tabSubjectList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SubjectVO tabSubject;
		
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from subject");
			rs = ps.executeQuery();
			
			while (rs.next()){
				tabSubject = new SubjectVO();
				tabSubject.setSubjectNo(rs.getString(1));
				tabSubject.setSubjectContent(rs.getString(2));
				tabSubject.setTitleNo(rs.getString(3));
				tabSubjectList.add(tabSubject);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps, rs);
		}
		
		return tabSubjectList;
	}
	
	public List<SubjectVO> getTabSubjectList(String ProjectNo){
		List<SubjectVO> tabSubjectList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SubjectVO tabSubject;
		
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from subject where PROJECTNO=?");
			ps.setString(1, ProjectNo);
			rs = ps.executeQuery();
			
			while (rs.next()){
				tabSubject = new SubjectVO();
				tabSubject.setSubjectNo(rs.getString(1));
				tabSubject.setSubjectContent(rs.getString(2));
				tabSubject.setTitleNo(rs.getString(3));
				tabSubjectList.add(tabSubject);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps, rs);
		}
		
		return tabSubjectList;
	}
	
	public int delTabSubject(String subjectNo){
		int resultCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "delete subject where subjectNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, subjectNo);
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		
		return resultCount;
	}
	
	public SubjectVO getTabSubject(String subjectNo){
		SubjectVO getSubject=null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "select * from subject where subjectNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, subjectNo);
			rs = ps.executeQuery();
			if (rs.next() == true){
				getSubject = new SubjectVO();
				getSubject.setSubjectNo(rs.getString(1));
				getSubject.setSubjectContent(rs.getString(2));
				getSubject.setTitleNo(rs.getString(3));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return getSubject;
	}
	
	public int setTabSubject(SubjectVO tabSubject){
		Connection conn = null;
		PreparedStatement ps = null;
		int resultCount = 0;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "insert into subject values(subject_sq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tabSubject.getSubjectContent());
			ps.setString(2, tabSubject.getTitleNo());
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		return resultCount;
	}
}
