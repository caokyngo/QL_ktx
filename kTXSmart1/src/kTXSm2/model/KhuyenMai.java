package kTXSm2.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity

public class KhuyenMai implements Comparable<KhuyenMai> {
	@Id
	public String maKhuyenMai;
	public String tenKhuyenMai;
	public Date thoiGianBatDau;
	public Date thoiGianKetThuc;
	public Double mucKhuyenMai;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public KhuyenMai() {
		super();

	}

	public String getMaKhuyenMai() {
		return maKhuyenMai;
	}

	public void setMaKhuyenMai(String maKhuyenMai) {
		this.maKhuyenMai = maKhuyenMai;
	}

	public String getTenKhuyenMai() {
		return tenKhuyenMai;
	}

	public void setTenKhuyenMai(String tenKhuyenMai) {
		this.tenKhuyenMai = tenKhuyenMai;
	}

	public Date getThoiGianBatDau() {
		return thoiGianBatDau;
	}

	public void setThoiGianBatDau(Date thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}

	public Date getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}

	public void setThoiGianKetThuc(Date thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	public Double getMucKhuyenMai() {
		return mucKhuyenMai;
	}

	public void setMucKhuyenMai(Double mucKhuyenMai) {
		this.mucKhuyenMai = mucKhuyenMai;
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

	public KhuyenMai(String maKhuyenMai, String tenKhuyenMai, Date thoiGianBatDau, Date thoiGianKetThuc,
			Double mucKhuyenMai, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maKhuyenMai = maKhuyenMai;
		this.tenKhuyenMai = tenKhuyenMai;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
		this.mucKhuyenMai = mucKhuyenMai;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maKhuyenMai == null) ? 0 : maKhuyenMai.hashCode());
		result = prime * result + ((mucKhuyenMai == null) ? 0 : mucKhuyenMai.hashCode());
		result = prime * result + ((tenKhuyenMai == null) ? 0 : tenKhuyenMai.hashCode());
		result = prime * result + ((thoiGianBatDau == null) ? 0 : thoiGianBatDau.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianKetThuc == null) ? 0 : thoiGianKetThuc.hashCode());
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
		KhuyenMai other = (KhuyenMai) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maKhuyenMai == null) {
			if (other.maKhuyenMai != null)
				return false;
		} else if (!maKhuyenMai.equals(other.maKhuyenMai))
			return false;
		if (mucKhuyenMai == null) {
			if (other.mucKhuyenMai != null)
				return false;
		} else if (!mucKhuyenMai.equals(other.mucKhuyenMai))
			return false;
		if (tenKhuyenMai == null) {
			if (other.tenKhuyenMai != null)
				return false;
		} else if (!tenKhuyenMai.equals(other.tenKhuyenMai))
			return false;
		if (thoiGianBatDau == null) {
			if (other.thoiGianBatDau != null)
				return false;
		} else if (!thoiGianBatDau.equals(other.thoiGianBatDau))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (thoiGianKetThuc == null) {
			if (other.thoiGianKetThuc != null)
				return false;
		} else if (!thoiGianKetThuc.equals(other.thoiGianKetThuc))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "KhuyenMai [maKhuyenMai=" + maKhuyenMai + ", tenKhuyenMai=" + tenKhuyenMai + ", thoiGianBatDau="
				+ thoiGianBatDau + ", thoiGianKetThuc=" + thoiGianKetThuc + ", mucKhuyenMai=" + mucKhuyenMai
				+ ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(KhuyenMai o) {
		return this.maKhuyenMai.compareTo(o.maKhuyenMai);
	}

}
