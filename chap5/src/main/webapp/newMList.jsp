<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
		table {
        border-collapse: collapse;
        width: 100%;
        max-width: 800px;
        margin: 20px auto;
        font-family: Arial, sans-serif;
    }

    th, td {
        border: 1px solid #333;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    td {
        background-color: #fafafa;
        width: 250px;
        height: 30px;
    }

    .input_title {
        width: 120px;
        font-weight: bold;
    }

    .input_col input {
        width: 95%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="button"] {
        background-color: #478abc;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 10px;
        border-radius: 4px;
    }

    input[type="button"]:hover {
        background-color: #5b9fd6;
    }

    td[colspan="4"] {
        text-align: center;
        font-size: 14px;
        color: #555;
        padding: 15px 0;
        padding-right: 0px;
    }

    @media screen and (max-width: 800px) {
        table {
            width: 100%;
        }

        .input_title {
            font-size: 14px;
        }

        .input_col input {
            width: 100%;
        }

        input[type="button"] {
            width: 100%;
            margin-bottom: 10px;
        }

        td[colspan="4"] {
            font-size: 12px;
        }
    }
    
	a {
		text-decoration: none;
		color: #478abc;
	}
	
	a:hover {
		font-size: 20px;
		font-weight: bold;
	}
	
	#pageArr a {
		text-decoration: none;
		color: black;
	}
	
	#pageArr a:hover {
		font-size: 20px;
		font-weight: bold;
	}
	
</style>

</head>
<body>
<div>

	<h2>회원 목록 조회(statement)</h2>
	

	<%
	String pageParam = request.getParameter("page");
	Integer pageNum = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
	
	Integer nowPageNum = (pageNum -1) * 10;

	JDBConnect jdbc = new JDBConnect();
	String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member limit 10 OFFSET ?";
	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	pstmt.setInt(1, nowPageNum);
	ResultSet rs = pstmt.executeQuery();
	
	String sql2 = "SELECT COUNT(*) AS count FROM tbl_member";
	PreparedStatement pstmt2 = jdbc.con.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
	int count = 0;

	if (rs2.next()) {
	    count = rs2.getInt("count");
	}

	%>
	<h3>현재 <%= pageNum %> 페이지</h3>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><a href="newMListV.jsp?memberId=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
			</tr>
			<%
			}
			%>	
			<tr>
				<td colspan="4" style="textAligin: center">
					<div id="pageArr"></div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" id="btnRegist" value="회원등록"/>
					<input type="button" id="btnDelete" value="회원삭제"/>
				</td>
				
			</tr>
		</tbody>
	</table>
	
	
	<script>
		const btnRegist = document.querySelector("#btnRegist");
		btnRegist.addEventListener("click", () => {
			location.href="newMListR.jsp"
		})
		
		const btnDelete = document.querySelector("#btnDelete");
		btnDelete.addEventListener("click", () => {
			location.href="newMListD.jsp"
		})
		
		let pageTotal = <%= count %>;
		let pageCnt = Math.ceil(pageTotal / 10);
		console.log(pageCnt);
		
		let pageArr = document.querySelector("#pageArr");
		
		for (let i = 1; i <= pageCnt; i++) {
			let span = document.createElement("span");
			span.innerHTML = '<a href="?page=' + i + '" id="btnPage' + i + '">[' + i + ']</a>&nbsp;';
			pageArr.appendChild(span);
		}
		
		let nowPage = document.querySelector('#btnPage' + <%= pageNum %>);
		nowPage.style.color = "#478abc";
		
	</script>
</div>
</body>
</html>