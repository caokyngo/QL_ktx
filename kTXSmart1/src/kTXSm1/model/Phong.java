package kTXSm1.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity
public class Phong implements Comparable<Phong> {
	@Id
	public String maPhong;
	public String tenPhong;
	public String diaChi;
	public String soGiuong;
	public String soGiuongConTrong;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public String getTenPhong() {
		return tenPhong;
	}

	public void setTenPhong(String tenPhong) {
		this.tenPhong = tenPhong;
	}

	

	

	public String getSoGiuong() {
		return soGiuong;
	}

	public void setSoGiuong(String soGiuong) {
		this.soGiuong = soGiuong;
	}

	public String getSoGiuongConTrong() {
		return soGiuongConTrong;
	}

	public void setSoGiuongConTrong(String soGiuongConTrong) {
		this.soGiuongConTrong = soGiuongConTrong;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}


	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public Phong() {
	}
	

	


	

	public Phong(String maPhong, String tenPhong, String diaChi, String soGiuong, String soGiuongConTrong, String moTa,
			String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maPhong = maPhong;
		this.tenPhong = tenPhong;
		this.diaChi = diaChi;
		this.soGiuong = soGiuong;
		this.soGiuongConTrong = soGiuongConTrong;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((diaChi == null) ? 0 : diaChi.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maPhong == null) ? 0 : maPhong.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((soGiuong == null) ? 0 : soGiuong.hashCode());
		result = prime * result + ((soGiuongConTrong == null) ? 0 : soGiuongConTrong.hashCode());
		result = prime * result + ((tenPhong == null) ? 0 : tenPhong.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Phong other = (Phong) obj;
		if (diaChi == null) {
			if (other.diaChi != null)
				return false;
		} else if (!diaChi.equals(other.diaChi))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maPhong == null) {
			if (other.maPhong != null)
				return false;
		} else if (!maPhong.equals(other.maPhong))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (soGiuong == null) {
			if (other.soGiuong != null)
				return false;
		} else if (!soGiuong.equals(other.soGiuong))
			return false;
		if (soGiuongConTrong == null) {
			if (other.soGiuongConTrong != null)
				return false;
		} else if (!soGiuongConTrong.equals(other.soGiuongConTrong))
			return false;
		if (tenPhong == null) {
			if (other.tenPhong != null)
				return false;
		} else if (!tenPhong.equals(other.tenPhong))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Phong [maPhong=" + maPhong + ", tenPhong=" + tenPhong + ", diaChi=" + diaChi + ", soGiuong=" + soGiuong
				+ ", soGiuongConTrong=" + soGiuongConTrong + ", moTa=" + moTa + ", ghiChu=" + ghiChu
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(Phong o) {
		return this.maPhong.compareTo(o.maPhong);
	}

}
