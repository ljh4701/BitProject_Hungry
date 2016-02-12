package kr.co.hungry.TODOTileDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.hungry.common.DBUtil;
import kr.co.hungry.TODOTileVO.DetailVO;

public class DetailDAO {
	public List<DetailVO> getTabDetailList(){
		List<DetailVO> tabDetailList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DetailVO tabDetail;
		
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from detail");
			rs = ps.executeQuery();
			
			while (rs.next()){
				tabDetail = new DetailVO();
				tabDetail.setDetailNo(rs.getString(1));
				tabDetail.setDetailContent(rs.getString(2));
				tabDetail.setSubjectNo(rs.getString(3));
				tabDetail.setDetailChecked(rs.getInt(4));
				tabDetailList.add(tabDetail);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps, rs);
		}
		
		return tabDetailList;
	}
	
	public List<DetailVO> getTabDetailList(String SubjectNo){
		List<DetailVO> tabDetailList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DetailVO tabDetail;
		
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from detail where SubjectNo=?");
			ps.setString(1, SubjectNo);
			rs = ps.executeQuery();
			
			while (rs.next()){
				tabDetail = new DetailVO();
				tabDetail.setDetailNo(rs.getString(1));
				tabDetail.setDetailContent(rs.getString(2));
				tabDetail.setSubjectNo(rs.getString(3));
				tabDetail.setDetailChecked(rs.getInt(4));
				tabDetailList.add(tabDetail);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps, rs);
		}
		
		return tabDetailList;
	}
	
	public int delTabDetail(String detailNo){
		int resultCount = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "delete detail where detailNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, detailNo);
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		
		return resultCount;
	}
	
	public DetailVO getTabDetail(String detailNo){
		DetailVO getDetail=null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "select * from detail where detailNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, detailNo);
			rs = ps.executeQuery();
			if (rs.next() == true){
				getDetail = new DetailVO();
				getDetail.setDetailNo(rs.getString(1));
				getDetail.setDetailContent(rs.getString(2));
				getDetail.setSubjectNo(rs.getString(3));
				getDetail.setDetailChecked(rs.getInt(4));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		
		return getDetail;
	}
	
	public int setTabDetail(DetailVO tabDetail){
		Connection conn = null;
		PreparedStatement ps = null;
		int resultCount = 0;
		
		try{
			conn = DBUtil.getConnection();
			String sql = "insert into detail values(detail_sq.nextval,?,?, 0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tabDetail.getDetailContent());
			ps.setString(2, tabDetail.getSubjectNo());
			resultCount = ps.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.close(conn, ps);
		}
		return resultCount;
	}
}
