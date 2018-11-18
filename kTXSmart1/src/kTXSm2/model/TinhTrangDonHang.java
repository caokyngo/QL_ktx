package kTXSm2.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity

public class TinhTrangDonHang implements Comparable<TinhTrangDonHang> {
	@Id
	public String maTinhTrangDonHang;
	public String tenTinhTrangDonHang;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public TinhTrangDonHang() {
		super();

	}

	public TinhTrangDonHang(String maTinhTrangDonHang, String tenTinhTrangDonHang, String ghiChu,
			Date thoiGianCapNhat) {
		super();
		this.maTinhTrangDonHang = maTinhTrangDonHang;
		this.tenTinhTrangDonHang = tenTinhTrangDonHang;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaTinhTrangDonHang() {
		return maTinhTrangDonHang;
	}

	public void setMaTinhTrangDonHang(String maTinhTrangDonHang) {
		this.maTinhTrangDonHang = maTinhTrangDonHang;
	}

	public String getTenTinhTrangDonHang() {
		return tenTinhTrangDonHang;
	}

	public void setTenTinhTrangDonHang(String tenTinhTrangDonHang) {
		this.tenTinhTrangDonHang = tenTinhTrangDonHang;
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
		result = prime * result + ((maTinhTrangDonHang == null) ? 0 : maTinhTrangDonHang.hashCode());
		result = prime * result + ((tenTinhTrangDonHang == null) ? 0 : tenTinhTrangDonHang.hashCode());
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
		TinhTrangDonHang other = (TinhTrangDonHang) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maTinhTrangDonHang == null) {
			if (other.maTinhTrangDonHang != null)
				return false;
		} else if (!maTinhTrangDonHang.equals(other.maTinhTrangDonHang))
			return false;
		if (tenTinhTrangDonHang == null) {
			if (other.tenTinhTrangDonHang != null)
				return false;
		} else if (!tenTinhTrangDonHang.equals(other.tenTinhTrangDonHang))
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
		return "TinhTrangDonHang [maTinhTrangDonHang=" + maTinhTrangDonHang + ", tenTinhTrangDonHang="
				+ tenTinhTrangDonHang + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(TinhTrangDonHang o) {

		return this.maTinhTrangDonHang.compareTo(o.maTinhTrangDonHang);
	}

}
