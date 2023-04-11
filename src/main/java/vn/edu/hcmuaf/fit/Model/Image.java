package vn.edu.hcmuaf.fit.Model;

public class Image {
    private int id;
    private String src;
    private int display;

    public Image() {
    }

    public Image(int id, String src, int display) {
        this.id = id;
        this.src = src;
        this.display = display;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", src='" + src + '\'' +
                ", display=" + display +
                '}';
    }
}
