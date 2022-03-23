package sec01_exam;

// 클래스를 만든것을 JSP에서는 빈을 만들었다라고 하는 것이다. useBean액션태그를 이용해서
// 데이터를 저장, 수정, 읽기가 가능해진다.
public class Student {
	
	private String name;
	private int age;
	private int grade;
	private int studentNum;
	
	
	// 기본 생성자
	public Student() {
		
		
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


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public int getStudentNum() {
		return studentNum;
	}


	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
}
