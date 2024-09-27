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
        background-color: #400abc;
    }

    td[colspan="4"] {
        text-align: center;
        font-size: 14px;
        color: #555;
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

        input[type="button"] {
            width: 100%;
            margin-bottom: 10px;
        }

        td[colspan="4"] {
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
	<form name="frmRegist" id="frmRegist" action="member_regist_ok.jsp" method="post">
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
					<td class="input_col"><input type="text" name="name" id="name" value="" maxlength="10" /></td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="submit" id="btnRegist" value="등록"/>
						<input type="submit" id="btnDelete" value="삭제"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	
	<script>
	const btnRegist = document.querySelector("#btnRegist");
	btnRegist.addEventListener("click", (e) => {
	  e.preventDefalut();
	  e.stopPropagation();

	  const frm = document.querySelector("#frmRegist");
	  const memberId = frm.member_id.value;
	  const memberName = frm.name.value;
	  const pwd = frm.pwd.value;

	  if (memberId.length < 4 || memberId.length > 20) {
	    alert("아이디를 4자리 이상 20자리 이하로 입력하세요.");
	    frm.member_id.focus();
	    return;
	  }
	  if (memberName.length < 4 || memberName.length > 20) {
	    alert("이름을 입력하세요.");
	    frm.memberName.focus();
	    return;
	  }
	  if (pwd.length < 4 || pwd.length > 20) {
	    alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요.");
	    frm.pwd.focus();
	    return;
	  }
	  frm.submit();
	});
	</script>
</body>
</html>