package el;

public class MyELClass {
    // 주민번호를 입력받아 성별을 반환합니다
	public String getGender(String jumin) {
	    // 결과를 저장할 문자열 변수 선언
	    String returnStr = "";

	    // 주민번호에서 '-' 위치를 찾고, 그 위치에서 한 칸 뒤의 인덱스를 계산
	    int beginIdx = jumin.indexOf("-") + 1;

	    // beginIdx 위치에서부터 한 글자를 추출해 성별을 나타내는 문자열을 얻음
	    String genderStr = jumin.substring(beginIdx, beginIdx + 1);

	    // 추출한 성별 문자열을 정수로 변환 (예: "1" -> 1)
	    int genderInt = Integer.parseInt(genderStr);

	    // 성별 숫자가 1 또는 3인 경우, 남성으로 판별
	    if (genderInt == 1 || genderInt == 3)
	        returnStr = "남자";
	    // 성별 숫자가 2 또는 4인 경우, 여성으로 판별
	    else if (genderInt == 2 || genderInt == 4) 
	        returnStr = "여자";
	    // 그 외의 경우, 잘못된 주민번호로 판단하여 오류 메시지를 설정
	    else
	        returnStr = "주민번호 오류입니다.";

	    // 결과를 반환 (성별 또는 오류 메시지)
	    return returnStr;
	}

    // 입력받은 문자열이 숫자인지 판별해줍니다.
    public static boolean isNumber(String value) {
        char[] chArr = value.toCharArray();
        for (int i = 0; i < chArr.length; i++) {
            if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
                return false;
            }
        }
        return true;
    }

    // 입력받은 정수까지의 구구단을 HTML 테이블로 출력해줍니다.
    public static String showGugudan(int limitDan) {
        StringBuffer sb = new StringBuffer();
        try {
            sb.append("<table border='1'>");
            for (int i = 2; i <= limitDan; i++) {
                sb.append("<tr>");
                for (int j = 1; j <= 9; j++) {
                    sb.append("<td>" + i + "*" + j + "=" + (i * j) + "</td>");
                }
                sb.append("</tr>");
            }
            sb.append("</table>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}