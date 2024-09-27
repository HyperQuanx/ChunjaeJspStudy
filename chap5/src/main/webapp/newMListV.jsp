<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String currentTime = sdf.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<style>
	#editBox {
		display: none;
	}
	
	form * {
		display: block;
	}
	
	form > div {
		display: flex;
	}
	
	label {
		cursor: pointer;
	}
</style>
</head>
<body>
	<%
      String memberId = request.getParameter("memberId");
      JDBConnect jdbc = new JDBConnect();
      try {
    	// 아래 세개 동작성 복습하자
      	String sql = "SELECT * FROM tbl_member WHERE memberId = ?";
      	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
      	pstmt.setString(1, memberId);
		
      	// SELECT 쿼리는 executeQuery 사용
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
        	String id = rs.getString("memberId");
        	String na = rs.getString("name");
        	String pw = rs.getString("pwd");
        	String rd = rs.getString("regDate");
    %>
    <script>
	    const memberIdValue = "<%= id %>";
	    const nameValue = "<%= na %>";
	    const pwValue = "<%= pw %>";
	    const regDateValue = "<%= rd %>";
	    const time = "<%= currentTime %>";
	</script>

    <div>
	    	회원 조회 성공<br/>
	    	ID : <%= id %><br/>
	    	Name : <%= na %><br/>
	    	Password : <%= pw %><br/>
	    	RegDate : <%= rd %><br/>
    	
	    	<br/>
	    	<br/>
    	
	    	<button onclick="editOk()" id="btnEdit"><span id="btnEditText">수정하기</span></button>
	    	<button onclick="backMain()">메인 페이지로 돌아가기</button>
    </div>
    <div id="editBox">
	    <form name="frmEdit" id="frmEdit" action="newMListEok.jsp?existingId=<%= id %>" method="post">
	        <label for="editId">ID</label>
	        <input type="text" name="editId" id="editId" />

	        <div>
	            <input type="checkbox" name="existingId" id="existingId" />
	            <label for="existingId">기존 ID</label>
	        </div>

	        <label for="editName">Name</label>
	        <input type="text" name="editName" id="editName" />

	        <div>
	            <input type="checkbox" name="existingName" id="existingName" />
	            <label for="existingName">기존 이름</label>
	        </div>

	        <label for="editPw">Password</label>
	        <input type="password" name="editPw" id="editPw" />

	        <div>
	            <input type="checkbox" name="existingPw" id="existingPw" />
	            <label for="existingPw">기존 비밀번호</label>
	        </div>
	        
	        <label for="editReg">RegDate</label>
	        <input type="text" name="editReg" id="editReg" value="<%= currentTime %>" maxlength="20" readonly />

	        <div>
	            <input type="checkbox" name="existingReg" id="existingReg" />
	            <label for="existingReg">기존 등록일</label>
	        </div>
	        <input type="submit" id="btnEditSubmit" value="수정하기" />
    	  </form>
	  </div>

    <%
        } else {
        	out.println("회원 조회 실패: 해당 아이디가 존재하지 않습니다.<br/>");
        }
		} catch (Exception e) {
       	out.println("오류가 발생했습니다: " + e.getMessage());
	  } finally {
		jdbc.close();
		
	  }
    %>
		
    <script>
   		let editState = false;
   		
   		let editOk = () => {
   			editState = !editState;
    			document.querySelector("#editBox").style.display = editState ? "inline" : "none";
    			document.querySelector("#btnEditText").textContent = editState ? "취소" : "수정하기";
   		}
   		
    	let backMain = () => {
    			location.assign("newMList.jsp");
    	}

	    const existingId = document.getElementById('existingId');
	    const existingName = document.getElementById('existingName');
	    const existingPw = document.getElementById('existingPw');
	    const existingReg = document.getElementById('existingReg');
	
	    const editId = document.getElementById('editId');
	    const editName = document.getElementById('editName');
	    const editPw = document.getElementById('editPw');
	    const editReg = document.getElementById('editReg');
	
	    existingId.addEventListener('change', function() {
	    	if (this.checked) {
	    		editId.value = memberIdValue;
	    		editId.readOnly = true;
	    		editId.style.backgroundColor = "#f0f0f0";
	    	} else {
	    		editId.value = '';
	    		editId.readOnly = false;
	    		editId.style.backgroundColor = "";
	    	}
	    });
	
	   	existingName.addEventListener('change', function() {
	    	if (this.checked) {
	    		editName.value = nameValue;
	    		editName.readOnly = true;
	    		editName.style.backgroundColor = "#f0f0f0";
	    	} else {
	    		editName.value = '';
	    		editName.readOnly = false;
	    		editName.style.backgroundColor = "";
	    	}
	    });
	
	    existingPw.addEventListener('change', function() {
	    	if (this.checked) {
	    		editPw.value = pwValue;
	    		editPw.readOnly = true;
	    		editPw.style.backgroundColor = "#f0f0f0";
	    		
	    	} else {
	    		editPw.value = '';
	    		editPw.readOnly = false;
	    		editPw.style.backgroundColor = "";
	    	}
	    });
	
	    existingReg.addEventListener('change', function() {
	    	if (this.checked) {
	    		editReg.value = regDateValue;
	    		editReg.readOnly = true;
	    		editReg.style.backgroundColor = "#f0f0f0";
	    	} else {
	    		editReg.value = time;
	    		editReg.readOnly = false;
	    		editReg.style.backgroundColor = "";
	    	}
	    });
	    	
	    const btnEditSubmit = document.querySelector("#btnEditSubmit");
	    btnEditSubmit.addEventListener("click", (e) => {
		  	e.preventDefalut();
		  	e.stopPropagation();
	
			const frm = document.querySelector("#frmEdit");
			frm.submit();
		});
    </script>
</body>
</html>
