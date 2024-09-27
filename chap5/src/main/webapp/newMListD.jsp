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
	body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 중앙 정렬에서 위쪽으로 맞추기 */
    min-height: 100vh; /* 전체 뷰포트 높이를 사용 */
	}
	
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
	
	input[type="button"], input[type="submit"] {
	    background-color: #478abc;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    cursor: pointer;
	    font-size: 14px;
	    margin-right: 10px;
	    border-radius: 4px;
	}
	
	input[type="button"]:hover, input[type="submit"]:hover {
	    background-color: #5b9fd6;
	}
</style>

</head>
<body>
<div>
	<h2>회원 삭제</h2>
	<br>
	<br>
	<br>
	<div>
		어떤 회원을 삭제하시겠습니까? <strong>아이디</strong>를 입력해주세요.
		<form name="frmDel" id="frmDel" action="newMListDok.jsp" method="post">		
			<input type="text" id="delId" name="delId" value="" />
			<input type="submit" id="btnDel" value="회원삭제"/>
		</form>
		
	</div>
	<%
	JDBConnect jdbc = new JDBConnect();
	String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member";
	Statement stmt = jdbc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>등록일</th>
				<th>Check</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td>
					<input type="checkbox" value="<%= rs.getString(1) %>" class="delCheck"/>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="2">
					<input type="button" id="btnRegist" onclick="btnRegist()" value="취소하기"/>
				</td>
				<td colspan="3">
					<input type="button" id="btnChkDel" onclick="btnChkDel()" value="다중 삭제"/>
				</td>
				
			</tr>
		</tbody>
	</table>
	
	<form id="frmChkDel" action="newMListDListok.jsp" method="post">
	    <input type="hidden" name="delIds" id="delIds" value=""/>
	</form>
	
</div>
	<script>
		const btnDelete = document.querySelector("#btnDel");
			btnDelete.addEventListener("click", (e) => {
	  		e.preventDefalut();
	  		e.stopPropagation();

			const frm = document.querySelector("#frmDel");
			frm.submit();
		});
		
		const btnRegist = document.querySelector("#btnRegist").addEventListener("click", () => {
			location.assign("newMList.jsp");
		});
		
		const btnChkDel = () => {
		    const delCheckBoxes = document.querySelectorAll(".delCheck:checked");
		    let delIds = [];

		    delCheckBoxes.forEach((checkbox) => {
		        delIds.push(checkbox.value);  // 체크된 값들을 배열에 추가
		    });

		    if (delIds.length > 0) {
		        // 배열을 쉼표로 구분된 문자열로 변환하여 hidden 필드에 넣음
		        document.getElementById("delIds").value = delIds.join(",");
		        console.log(document.getElementById("delIds").value = delIds.join(","))
		        // 다중 삭제 폼 제출
		        document.getElementById("frmChkDel").submit();
		    } else {
		        alert("삭제할 회원을 선택하세요.");
		    }
		}s
	</script>
</body>
</html>