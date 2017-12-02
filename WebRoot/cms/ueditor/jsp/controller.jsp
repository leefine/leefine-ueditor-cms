<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.baidu.ueditor.ActionEnter" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	if(session.getAttribute("CurrentUser")==null) {
		out.write("<script>alert('No Permission!');window.history.go(-1);</script>");
	}else {
		String rootPath = application.getRealPath("/");
		out.write(new ActionEnter(request, rootPath).exec());
	}
%>