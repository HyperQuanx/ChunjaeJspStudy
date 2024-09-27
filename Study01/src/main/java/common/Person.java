package common; // 규약 1번

public class Person {
	private String name; // 규약 2번
	private int age; // 규약 2번
	
	public Person() {} // 규약 3번

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	// 규약 4, 5번
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
}
