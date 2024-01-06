package service;

public class Student implements IStudent {
    int id;
    String name;
    int group;


    public Student() {
    }

    public Student(int i, String name, int i1) {
        this.name = name;
    }

    @Override
    public void diemDanh() {
        System.out.println(name + " điểm danh");
    }

    @Override
    public void hocBai() {
        System.out.println(name + " đang học bài");

    }

    @Override
    public void didonVeSinh() {
        System.out.println(name + " đi dọn vệ sinh");

    }
}
