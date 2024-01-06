import service.HinhVuong;
import service.Student;

import java.util.Arrays;
import java.util.List;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Student student1 = new Student(1, "Nguyễn Văn A", 1);
        Student student2 = new Student(2, "Nguyễn Văn B", 1);
        Student student3 = new Student(3, "Nguyễn Văn C", 1);
        Student student4 = new Student(4, "Nguyễn Văn D", 2);
        Student student5 = new Student(5, "Nguyễn Văn E", 2);
        Student student6 = new Student(6, "Nguyễn Văn F", 2);
        Student student7 = new Student(7, "Nguyễn Văn G", 3);
        Student student8 = new Student(8, "Nguyễn Văn H", 3);
        Student student9 = new Student(9, "Nguyễn Văn I", 3);
        Student student10 = new Student(10, "Nguyễn Văn J", 3);

        List<Student> group1 = Arrays.asList(student1, student2, student3);
        List<Student> group2 = Arrays.asList(student4, student5, student6);
        List<Student> group3 = Arrays.asList(student7, student8, student9, student10);
        List<Student> allstudent = Arrays.asList(student1,student2,student3,student4,student5,student6,student7,student8,student9,student10);
        for (Student student : allstudent) {
            student.diemDanh();
        }


        for (Student student : group2) {
            student.hocBai();
        }

        for (Student student : group3) {
            student.didonVeSinh();
        }


        HinhVuong a = new HinhVuong();
        a.setChieuDai(1.1);
        a.setChieuRong(a.getChieuDai());
        System.out.println("Dien Tich Hinh Vuong =" + a.tinhDienTich());
    }
}