package service;

public class News implements INews {
    int id;
    String title;
    String PublishDate;
    String Author;
    String Content;
    Float AverageRate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishDate() {
        return PublishDate;
    }

    public void setPublishDate(String publishDate) {
        PublishDate = publishDate;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Float getAverageRate() {
        return AverageRate;
    }

    @Override
    public void Display() {
        System.out.println("Title: " + title);
        System.out.println("Publish Date: " + PublishDate);
        System.out.println("Author: " + Author);
        System.out.println("Content: " + Content);
        System.out.println("Average Rate: " + AverageRate);
    }

    @Override
    public float Calculate() {
        int[] mang = {1,2,3};
        int trungCong = (mang[0] + mang[1] + mang[2])/(mang.length);
        return trungCong;
    }
}
