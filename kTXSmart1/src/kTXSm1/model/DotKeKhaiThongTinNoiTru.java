package kTXSm1.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Type;

@Entity
public class DotKeKhaiThongTinNoiTru {
	@Id
	public String maDotKeKhaiThongTinNoiTru;
	public String tenDotKeKhaiThongTinNoiTru;
	public Date ngayBatDau;
	public Date ngayKetThuc;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	
	public String getMaDotKeKhaiThongTinNoiTru() {
		return maDotKeKhaiThongTinNoiTru;
	}

	public void setMaDotKeKhaiThongTinNoiTru(String maDotKeKhaiThongTinNoiTru) {
		this.maDotKeKhaiThongTinNoiTru = maDotKeKhaiThongTinNoiTru;
	}

	public String getTenDotKeKhaiThongTinNoiTru() {
		return tenDotKeKhaiThongTinNoiTru;
	}

	public void setTenDotKeKhaiThongTinNoiTru(String tenDotKeKhaiThongTinNoiTru) {
		this.tenDotKeKhaiThongTinNoiTru = tenDotKeKhaiThongTinNoiTru;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}


	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
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

	public Date getNgayCapNhat() {
		return thoiGianCapNhat;
	}

	public void setNgayCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	
	public DotKeKhaiThongTinNoiTru(String maDotKeKhaiThongTinNoiTru, String tenDotKeKhaiThongTinNoiTru, Date ngayBatDau,
			Date ngayKetThuc, String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maDotKeKhaiThongTinNoiTru = maDotKeKhaiThongTinNoiTru;
		this.tenDotKeKhaiThongTinNoiTru = tenDotKeKhaiThongTinNoiTru;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}	

	public DotKeKhaiThongTinNoiTru() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "DotKeKhaiThongTinNoiTru [maDotKeKhaiThongTinNoiTru=" + maDotKeKhaiThongTinNoiTru
				+ ", tenDotKeKhaiThongTinNoiTru=" + tenDotKeKhaiThongTinNoiTru + ", ngayBatDau=" + ngayBatDau
				+ ", ngayKetThuc=" + ngayKetThuc + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat="
				+ thoiGianCapNhat + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maDotKeKhaiThongTinNoiTru == null) ? 0 : maDotKeKhaiThongTinNoiTru.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((ngayBatDau == null) ? 0 : ngayBatDau.hashCode());
		result = prime * result + ((ngayKetThuc == null) ? 0 : ngayKetThuc.hashCode());
		result = prime * result + ((tenDotKeKhaiThongTinNoiTru == null) ? 0 : tenDotKeKhaiThongTinNoiTru.hashCode());
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
		DotKeKhaiThongTinNoiTru other = (DotKeKhaiThongTinNoiTru) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maDotKeKhaiThongTinNoiTru == null) {
			if (other.maDotKeKhaiThongTinNoiTru != null)
				return false;
		} else if (!maDotKeKhaiThongTinNoiTru.equals(other.maDotKeKhaiThongTinNoiTru))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (ngayBatDau == null) {
			if (other.ngayBatDau != null)
				return false;
		} else if (!ngayBatDau.equals(other.ngayBatDau))
			return false;
		if (ngayKetThuc == null) {
			if (other.ngayKetThuc != null)
				return false;
		} else if (!ngayKetThuc.equals(other.ngayKetThuc))
			return false;
		if (tenDotKeKhaiThongTinNoiTru == null) {
			if (other.tenDotKeKhaiThongTinNoiTru != null)
				return false;
		} else if (!tenDotKeKhaiThongTinNoiTru.equals(other.tenDotKeKhaiThongTinNoiTru))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}

}
