<%@page import="java.util.List"%>
<%@ page import="org.json.*" %>
<%@ page import="kr.co.hungry.TODOTileDAO.*" %>
<%@ page import="kr.co.hungry.TODOTileVO.*" %>
<%@ page import="kr.co.hungry.common.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	JSONObject json = new JSONObject();
	
	JSONObject TODOTile;
	JSONObject TODOSubject;
	JSONObject TODODetail;
	
	JSONArray TODOTileArray;
	JSONArray TODOSubjectArray;
	JSONArray TODODetailArray;
	
	JSONObject TODOTileArrayObject;
	JSONObject TODOSubjectArrayObject;
	JSONObject TODODetailArrayObject;
	
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
		json.put("RESULT", "ERROR_PROJECTNO");
		response.getWriter().write(json.toString());
		return;
	}
	
	json.put("PROJECTNO", ProjectNo);
	
	TODOTile = new JSONObject();
	List<TODOTileVO> tile = tiledao.getTabTitleList(ProjectNo);
	
	if (tile.size() == 0) {
		TODOTile.put("RESULT", "SUCCESS_EMPTY");
		json.put("TILES", TODOTile);
		response.getWriter().write(json.toString());
		return;
	}
	
	TODOTile.put("RESULT", "SUCCESS");
	TODOTileArray = new JSONArray();
	
	for (int i = 0; i < tile.size(); i++) {
		TODOTileArrayObject = new JSONObject();
		
		TODOSubject = new JSONObject();
		List<SubjectVO> subject = subjectdao.getTabSubjectList(tile.get(i).getTitleNo());
			
		if (subject.size() == 0) {
			TODOSubject.put("RESULT", "SUCCESS_EMPTY");
		}
		else {
			TODOSubject.put("RESULT", "SUCCESS");
			TODOSubjectArray = new JSONArray();
			for (int j = 0; j < subject.size(); j++) {
				TODOSubjectArrayObject = new JSONObject();
				
				TODODetail = new JSONObject();
				List<DetailVO> detail = detaildao.getTabDetailList(subject.get(j).getSubjectNo());
				
				if (detail.size() == 0) {
					TODODetail.put("RESULT", "SUCCESS_EMPTY");
				}
				else {
					TODODetail.put("RESULT", "SUCCESS");
					
					TODODetailArray = new JSONArray();
					for (int k = 0; k < detail.size(); k++) {
						TODODetailArrayObject = new JSONObject();
						detailvo = detail.get(k);
						
						TODODetailArrayObject.put("DETAILNO", detailvo.getDetailNo());
						TODODetailArrayObject.put("DETAILCONTENT", detailvo.getDetailContent());
						TODODetailArrayObject.put("DETAILCHECKED", detailvo.getDetailChecked());
						
						TODODetailArray.put(TODODetailArrayObject);
					}
					TODODetail.put("DETAILLIST", TODODetailArray);
				}
				
				TODOSubjectArrayObject.put("DETAILS", TODODetail);
				TODOSubjectArray.put(TODOSubjectArrayObject);
			}
			TODOSubject.put("SUBJECTLIST", TODOSubjectArray);
		}
		
		TODOTileArrayObject.put("SUBJECTS", TODOSubject);
		TODOTileArray.put(TODOTileArrayObject);
	}
	
	TODOTile.put("TODOTILELIST", TODOTileArray);
	json.put("TODOTILES", TODOTile);
	response.getWriter().write(json.toString());
%>