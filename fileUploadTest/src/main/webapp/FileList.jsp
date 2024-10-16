<%@page import="net.fullstack7.fileupload.MyFileDTO"%>
<%@page import="net.fullstack7.fileupload.MyFileDAO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>FileUpload</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	color: #333;
	margin: 20px;
}

h2 {
	color: #444;
	text-align: center;
	margin-bottom: 20px;
}

a {
	text-decoration: none;
	color: #007BFF;
	margin-right: 10px;
}

a:hover {
	color: #0056b3;
	text-decoration: underline;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #007BFF;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.btn-download {
	background-color: #28a745;
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	text-decoration: none;
}

.thumbnail, .video-preview {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일등록1</a>
	<a href="MultiUploadMain.jsp">파일등록2</a>
	<%
    MyFileDAO dao = new MyFileDAO();
    List<MyFileDTO> fileLists = dao.myFileList();
    dao.close();
    
    // 이미지 및 동영상 파일 확장자 목록
    List<String> imageExtensions = List.of("jpg", "jpeg", "png", "gif", "bmp", "webp");
    List<String> videoExtensions = List.of("mp4", "webm", "ogg");
    %>
	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>미리보기</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th>다운로드</th>
			<th>삭제</th>
		</tr>
		<%
    for (MyFileDTO f : fileLists) {
        // 파일의 확장자 추출
        String fileName = f.getOfile();
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        boolean isImage = imageExtensions.contains(fileExt);
        boolean isVideo = videoExtensions.contains(fileExt);
    %>
		<tr>
			<td><%= f.getIdx() %></td>
			<td><%= f.getTitle() %></td>
			<td><%= f.getCate() %></td>
			<td><%= f.getOfile() %></td>
			<td>
				<% if (isImage) { %> <!-- 이미지 파일일 경우 썸네일 표시 --> <img class="thumbnail"
				src="Uploads/<%= URLEncoder.encode(f.getSfile(), "UTF-8") %>"
				alt="썸네일"> <% } else if (isVideo) { %> <!-- 동영상 파일일 경우 미리보기 제공 -->
				<video class="video-preview" controls>
					<source
						src="Uploads/<%= URLEncoder.encode(f.getSfile(), "UTF-8") %>"
						type="video/<%= fileExt %>">브라우저가 동영상을 지원하지 않습니다.
				</video> <% } else { %> <!-- 이미지나 동영상이 아닐 경우 텍스트로 표시 --> <span>미리보기 없음</span>
				<% } %>
			</td>
			<td><%= f.getSfile() %></td>
			<td><%= f.getPostdate() %></td>
			<td><a class="btn-download"
				href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(), "UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(), "UTF-8") %>">
					[다운로드] </a></td>
			<td>
			    <a href="fileDelete.jsp?idx=<%= f.getIdx() %>" 
			       onclick="return confirm('삭제하시겠습니까?');">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	<script>
		const del = () => {
			
		}
	</script>
</body>
</html>
