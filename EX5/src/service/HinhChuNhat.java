package service;

public class HinhChuNhat implements IHinhChuNhat{
    double chieuDai;
    double chieuRong;

    @Override
    public double tinhDienTich() {
        return (this.chieuDai * this.chieuRong);
    }

    @Override
    public double tinhChuvi() {
        return 2 * (chieuDai + chieuRong);
    }

    public double getChieuDai() {
        return chieuDai;
    }

    public void setChieuDai(double chieuDai) {
        this.chieuDai = chieuDai;
    }

    public double getChieuRong() {
        return chieuRong;
    }

    public void setChieuRong(double chieuRong) {
        this.chieuRong = chieuRong;
    }
}
