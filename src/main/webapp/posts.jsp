<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.project4.dao.BoardDAO, com.example.project4.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #FFFFCC;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #FFFFCC;}
        #list tr:hover {background-color: #FFFFCC;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #FFFFCC;
            color: #FFC41E;
        }
        h1{
            font-family:"Georgia",serif;
            color:#FFCD66;
            display:flex;
            justify-content: center;
            align-items: center;
        }
        #but{
            font-family:"Monaco",Monospace;
            background-color: #FFCCCC;
            color: #FF9696;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            border-radius: 5px;

        }
        #edit{
            font-family:"Monaco",Monospace;
            background-color: #CCE5FF;
            color: #6666FF;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            border-radius: 5px;
        }
        #delete{
            font-family:"Monaco",Monospace;
            background-color: #E5CCFF;
            color: #9933FF;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            border-radius: 5px;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>Drama Storage</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list",list);
%>
<table id="list" width="90%">
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Content</th>
        <th>Regdate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.getSeq()}</td>
            <td>${u.getTitle()}</td>
            <td>${u.getWriter()}</td>
            <td>${u.getContent()}</td>
            <td>${u.getRegdate()}</td>
            <td><a href="editform.jsp?id=${u.getSeq()}" id="edit">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSeq()}')" id="delete">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addpostform.jsp" id="but">Add New Post</a>
</body>
</html>