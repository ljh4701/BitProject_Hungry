<%@page import="java.util.List"%>
<%@ page import="org.json.*" %>
<%@ page import="kr.co.hungry.TODOTileDAO.*" %>
<%@ page import="kr.co.hungry.TODOTileVO.*" %>
<%@ page import="kr.co.hungry.common.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	JSONObject json = new JSONObject();
	
	JSONArray TODOTileArray;
	JSONObject TODOTile;
	JSONArray TODOSubjectArray;
	JSONObject TODOSubject;
	JSONArray TODODetailArray;
	JSONObject TODODetail;
	
	TODOTileDAO tiledao = new TODOTileDAO();
	SubjectDAO subjectdao = new SubjectDAO();
	DetailDAO detaildao = new DetailDAO();		
	TODOTileVO tilevo;
	SubjectVO subjectvo;
	DetailVO detailvo;
	
	String ProjectNo = "";
	response.setContentType("application/json");
	
	try {
		ProjectNo = request.getParameter("projectNo");
		
		if (ProjectNo.trim().equals(""))
			throw new Exception();
		else if(Integer.parseInt(ProjectNo) < 0)
			throw new Exception();
	}
	catch (Exception e) {
		json.put("RESULT", "ERROR_projectNO");
		response.getWriter().write(json.toString());
		return;
	}
	
	json.put("PROJECTNO", ProjectNo);
	json.put("RESULT", "SUCCESS");
	response.getWriter().write(json.toString());
	
	List<TODOTileVO> tile = tiledao.getTabTitleList(ProjectNo);
	
	if (tile.size() == 0) {
		json.put("RESULT", "SUCCESS_EMPTY");
		response.getWriter().write(json.toString());
		return;
	}
	
	json.put("RESULT", "SUCCESS");
	
	for (int i = 0; i < tile.size(); i++) {
		List<SubjectVO> subject = subjectdao.getTabSubjectList(tile.get(i).getTitleNo());
			
		if (subject.size() == 0) {
			
		}
		
		for (int j = 0; j < subject.size(); j++) {
			List<DetailVO> detail = detaildao.getTabDetailList(subject.get(j).getSubjectNo());
			
			if (detail.size() == 0) {
				
			}
						
			for (int k = 0; k < detail.size(); k++) {
				TODODetail = new JSONObject();
				detailvo = detail.get(k);
				
				TODODetail.put("id", detailvo.getDetailNo());
				TODODetail.put("content", detailvo.getDetailContent());
				TODODetail.put("checked", detailvo.getDetailChecked());
				TODODetail.put("subjectno", detailvo.getSubjectNo());
								
			}
		}
	}
%>