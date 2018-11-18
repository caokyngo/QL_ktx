package kTXSm2.model;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

@Entity
public class ChiTietDonHang implements Comparable<ChiTietDonHang>{
	@Id
	public String maChiTietDonHang;
	@ManyToOne
	public MatHang matHang;
	@ManyToOne
	public DonHang donHang;
	public String soLuong;
	public Double giaBan;
	@Type(type="text")
	public String ghiChu;
	public Date thoiGianCapNhat;
	
	
	public ChiTietDonHang() {
		super();
	}


	public ChiTietDonHang(String maChiTietDonHang, MatHang matHang, DonHang donHang, String soLuong, Double giaBan,
			String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maChiTietDonHang = maChiTietDonHang;
		this.matHang = matHang;
		this.donHang = donHang;
		this.soLuong = soLuong;
		this.giaBan = giaBan;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}


	public String getMaChiTietDonHang() {
		return maChiTietDonHang;
	}


	public void setMaChiTietDonHang(String maChiTietDonHang) {
		this.maChiTietDonHang = maChiTietDonHang;
	}


	public MatHang getMatHang() {
		return matHang;
	}


	public void setMatHang(MatHang matHang) {
		this.matHang = matHang;
	}


	public DonHang getDonHang() {
		return donHang;
	}


	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}


	public String getSoLuong() {
		return soLuong;
	}


	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}


	public Double getGiaBan() {
		return giaBan;
	}


	public void setGiaBan(Double giaBan) {
		this.giaBan = giaBan;
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
		result = prime * result + ((donHang == null) ? 0 : donHang.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((giaBan == null) ? 0 : giaBan.hashCode());
		result = prime * result + ((maChiTietDonHang == null) ? 0 : maChiTietDonHang.hashCode());
		result = prime * result + ((matHang == null) ? 0 : matHang.hashCode());
		result = prime * result + ((soLuong == null) ? 0 : soLuong.hashCode());
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
		ChiTietDonHang other = (ChiTietDonHang) obj;
		if (donHang == null) {
			if (other.donHang != null)
				return false;
		} else if (!donHang.equals(other.donHang))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (giaBan == null) {
			if (other.giaBan != null)
				return false;
		} else if (!giaBan.equals(other.giaBan))
			return false;
		if (maChiTietDonHang == null) {
			if (other.maChiTietDonHang != null)
				return false;
		} else if (!maChiTietDonHang.equals(other.maChiTietDonHang))
			return false;
		if (matHang == null) {
			if (other.matHang != null)
				return false;
		} else if (!matHang.equals(other.matHang))
			return false;
		if (soLuong == null) {
			if (other.soLuong != null)
				return false;
		} else if (!soLuong.equals(other.soLuong))
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
		return "ChiTietDonHang [maChiTietDonHang=" + maChiTietDonHang + ", matHang=" + matHang + ", donHang=" + donHang
				+ ", soLuong=" + soLuong + ", giaBan=" + giaBan + ", ghiChu=" + ghiChu + ", thoiGianCapNhat="
				+ thoiGianCapNhat + "]";
	}


	@Override
	public int compareTo(ChiTietDonHang o) {
		return this.maChiTietDonHang.compareTo(o.maChiTietDonHang);
	}
	

}
