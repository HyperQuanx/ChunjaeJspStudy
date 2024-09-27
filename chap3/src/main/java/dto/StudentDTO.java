package dto;

public class StudentDTO {
		public StudentDTO() {}
		public StudentDTO(String no, String name, int age, String dept, int grade) {
			this.no = no;
			this.name = name;
			this.age = age;
			this.dept = dept;
			this.grade = grade;
		}
		
		private String no;
		private String name;
		private int age;
		private String dept;
		private int grade;
		
		public String getNo() {
			return no;
		}
		public void setNo(String no) {
			this.no = no;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getDept() {
			return dept;
		}
		public void setDept(String dept) {
			this.dept = dept;
		}
		public int getGrade() {
			return grade;
		}
		public void setGrade(int grade) {
			this.grade = grade;
		}
		
}

