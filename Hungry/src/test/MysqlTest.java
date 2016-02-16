package test;

import kr.co.hungry.TODOTileDAO.DetailDAO;
import kr.co.hungry.TODOTileDAO.SubjectDAO;

public class MysqlTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubjectDAO sDao = new SubjectDAO();
		DetailDAO dDao = new DetailDAO();
		
		dDao.setTabDetail(dDao.getTabDetailList().get(0));
	}

}
