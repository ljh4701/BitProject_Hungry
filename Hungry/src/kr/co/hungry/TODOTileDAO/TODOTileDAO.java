package kr.co.hungry.TODOTileDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.hungry.common.DBUtil;
import kr.co.hungry.TODOTileVO.TODOTileVO;

public class TODOTileDAO {
	
	public List<TODOTileVO> getTabTitleList(){
		List<TODOTileVO> tabTitleList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		TODOTileVO tabTitle;
		
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from title");
			rs = ps.executeQuery();
			
			while (rs.next()){
				tabTitle = new TODOTileVO();
				tabTitle.setTitleNo(rs.getString(1));
				tabTitle.setTitleContent(rs.getString(2));
				tabTitle.setProjectNo(rs.getString(3));
				tabTitleList.add(tabTitle);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps, rs);
		}
		
		return tabTitleList;
	}
	
	public List<TODOTileVO> getTabTitleList(String projectNo) {
		List<TODOTileVO> tabTitleList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		TODOTileVO tabTitle;
		
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from title where projectno = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, projectNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				tabTitle = new TODOTileVO();
				tabTitle.setTitleNo(rs.getString(1));
				tabTitle.setTitleContent(rs.getString(2));
				tabTitle.setProjectNo(rs.getString(3));
				tabTitleList.add(tabTitle);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return tabTitleList;
	}
	
	public int delTabTitle(String titleNo){
		int resultCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "delete title where titleNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, titleNo);
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		
		return resultCount;
	}
	
	public TODOTileVO getTabTitle(String titleNo){
		TODOTileVO getTitle=null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "select * from title where titleNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, titleNo);
			rs = ps.executeQuery();
			if (rs.next() == true){
				getTitle = new TODOTileVO();
				getTitle.setTitleNo(rs.getString(1));
				getTitle.setTitleContent(rs.getString(2));
				getTitle.setProjectNo(rs.getString(3));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return getTitle;
	}
	
	public int setTabTitle(TODOTileVO tabTitle){
		Connection conn = null;
		PreparedStatement ps = null;
		int resultCount = 0;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "insert into title values(title_sq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tabTitle.getTitleContent());
			ps.setString(2, tabTitle.getProjectNo());
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		return resultCount;
	}
}
