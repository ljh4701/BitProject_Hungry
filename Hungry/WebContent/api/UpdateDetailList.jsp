<%@page import="kr.co.hungry.TODOTileVO.DetailVO"%>
<%@page import="kr.co.hungry.TODOTileDAO.DetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	DetailDAO dao = new DetailDAO();
	DetailVO vo = new DetailVO();
	
	request.setCharacterEncoding("utf-8");
	vo.setDetailContent(request.getParameter("detail"));
	
%>