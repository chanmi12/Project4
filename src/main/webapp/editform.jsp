<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.project4.dao.BoardDAO, com.example.project4.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
    <style>
        body{
            background-color: #FFFCF2;
        }
        h1{
            font-family:"Georgia",serif;
            color:#FFCD66;
            display:flex;
            justify-content: center;
            align-items: center;
        }
        form{
            display:flex;
            justify-content: center;
            align-items: center;
        }
        table{
            font-family:"Georgia",serif;
            color:#FFBC35;
            font-weight: bold;
        }
        input[type="submit"]{
            background-color:#FFCCCC;
            border-color:#FF9696;
            border-radius:5px;
        }
        input[type="button"]{
            background-color:#FFCCCC;
            border-color:#FF9696;
            border-radius:5px;
        }
    </style>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post">
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <table>
        <tr><td>드라마명:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
        <tr><td>대표 배우:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
        <tr><td>줄거리:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Post"/>
            <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
    </table>
</form>

</body>
</html>