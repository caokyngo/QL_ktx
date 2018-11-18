package kTXSm2.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity
public class LoaiDonHang implements Comparable<LoaiDonHang> {
	@Id
	public String maLoai;
	public String tenLoaiDonHang;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public LoaiDonHang() {
		super();

	}

	public LoaiDonHang(String maLoai, String tenLoaiDonHang, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maLoai = maLoai;
		this.tenLoaiDonHang = tenLoaiDonHang;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenLoaiDonHang() {
		return tenLoaiDonHang;
	}

	public void setTenLoaiDonHang(String tenLoaiDonHang) {
		this.tenLoaiDonHang = tenLoaiDonHang;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maLoai == null) ? 0 : maLoai.hashCode());
		result = prime * result + ((tenLoaiDonHang == null) ? 0 : tenLoaiDonHang.hashCode());
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
		LoaiDonHang other = (LoaiDonHang) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maLoai == null) {
			if (other.maLoai != null)
				return false;
		} else if (!maLoai.equals(other.maLoai))
			return false;
		if (tenLoaiDonHang == null) {
			if (other.tenLoaiDonHang != null)
				return false;
		} else if (!tenLoaiDonHang.equals(other.tenLoaiDonHang))
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
		return "LoaiDonHang [maLoai=" + maLoai + ", tenLoaiDonHang=" + tenLoaiDonHang + ", ghiChu=" + ghiChu
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(LoaiDonHang o) {

		return this.maLoai.compareTo(o.maLoai);
	}

}
