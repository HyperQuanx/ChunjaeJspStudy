<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록하기</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        max-width: 600px;
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

    input[type="submit"] {
        background-color: #478abc;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 10px;
        border-radius: 4px;
    }

    input[type="submit"]:hover {
        background-color: #5b9fd6;
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

    td[colspan="2"] {
        text-align: center;
        padding: 15px 0;
    }

    @media screen and (max-width: 600px) {
        table {
            width: 100%;
        }

        .input_title {
            font-size: 14px;
        }

        .input_col input {
            width: 100%;
        }

        input[type="submit"] {
            width: 100%;
            margin-bottom: 10px;
        }

        td[colspan="2"] {
            font-size: 12px;
        }
    }
</style>

</head>
<body>
	<h2>회원 등록</h2>

	<%
	JDBConnect jdbc = new JDBConnect();
	String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member";
	Statement stmt = jdbc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<%
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String currentTime = sdf.format(new Date());
	%>
	
	<div>
		<form name="frmRegist" id="frmRegist" action="newMListRok.jsp" method="post">
			<table>
				<tbody>
					<tr>
						<td class="input_title">아이디 : </td>
						<td class="input_col"><input type="text" name="member_id" id="member_id" value="" maxlength="10" /></td>
					</tr>
					<tr>
						<td class="input_title">이름 : </td>
						<td class="input_col"><input type="text" name="name" id="name" value="" maxlength="10" /></td>
					</tr>
					<tr>
						<td class="input_title">비밀번호 : </td>
						<td class="input_col"><input type="password" name="pwd" id="pwd" value="" maxlength="20" /></td>
					</tr>
					<tr>
					    <td class="input_title">등록일 : </td>
					    <td class="input_col"><input type="text" name="regDate" id="regDate" value="<%= currentTime %>" maxlength="20" readonly /></td>
					</tr>
					<tr>
					    <td colspan="2">
						    <input type="submit" id="btnRegist" value="회원등록">
						    <input type="button" id="btnBackMain" value="메인페이지로 돌아가기"  onclick="backMain()">
					    </td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<script>
		const btnRegist = document.querySelector("#btnRegist");
		btnRegist.addEventListener("click", (e) => {
		  e.preventDefault();
		  e.stopPropagation();
	
		const frm = document.querySelector("#frmRegist");
		const memberId = frm.member_id.value;
		const memberName = frm.name.value;
		const pwd = frm.pwd.value;
	
		if (memberId.length < 2 || memberId.length > 20) {
		    alert("아이디를 2자리 이상 20자리 이하로 입력하세요.");
		    frm.member_id.focus();
		    return;
		}
		if (pwd.length < 4 || pwd.length > 20) {
		  alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요.");
		  frm.pwd.focus();
		  return;
		}
		  frm.submit();
		});
		
		let backMain = () => {
			location.assign("newMList?page=0.jsp");
		}
	</script>
</body>
</html>