package kTXSm1.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import kTXCore.model.HocKy;
import kTXCore.model.SinhVien;

@Entity
public class ThongTinNoiTru implements Comparable<ThongTinNoiTru> {
	@Id
	public String maThongTinNoiTru;
	@ManyToOne
	public SinhVien sinhVien;
	@ManyToOne
	public Phong phong;
	@ManyToOne
	public DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru;
	@ManyToOne
	public HocKy hocKy;
	public Date ngayDangKy;
	public Date ngayKeKhaiThongTin;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public ThongTinNoiTru() {
		super();
	}

	public ThongTinNoiTru(String maThongTinNoiTru, SinhVien sinhVien, Phong phong,
			DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru, HocKy hocKy, Date ngayDangKy, Date ngayKeKhaiThongTin,
			String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maThongTinNoiTru = maThongTinNoiTru;
		this.sinhVien = sinhVien;
		this.phong = phong;
		this.dotKeKhaiThongTinNoiTru = dotKeKhaiThongTinNoiTru;
		this.hocKy = hocKy;
		this.ngayDangKy = ngayDangKy;
		this.ngayKeKhaiThongTin = ngayKeKhaiThongTin;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public String toString() {
		return "ThongTinNoiTru [maThongTinNoiTru=" + maThongTinNoiTru + ", sinhVien=" + sinhVien + ", phong=" + phong
				+ ", dotKeKhaiThongTinNoiTru=" + dotKeKhaiThongTinNoiTru + ", hocKy=" + hocKy + ", ngayDangKy="
				+ ngayDangKy + ", ngayKeKhaiThongTin=" + ngayKeKhaiThongTin + ", moTa=" + moTa + ", ghiChu=" + ghiChu
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dotKeKhaiThongTinNoiTru == null) ? 0 : dotKeKhaiThongTinNoiTru.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((hocKy == null) ? 0 : hocKy.hashCode());
		result = prime * result + ((maThongTinNoiTru == null) ? 0 : maThongTinNoiTru.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((ngayDangKy == null) ? 0 : ngayDangKy.hashCode());
		result = prime * result + ((ngayKeKhaiThongTin == null) ? 0 : ngayKeKhaiThongTin.hashCode());
		result = prime * result + ((phong == null) ? 0 : phong.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
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
		ThongTinNoiTru other = (ThongTinNoiTru) obj;
		if (dotKeKhaiThongTinNoiTru == null) {
			if (other.dotKeKhaiThongTinNoiTru != null)
				return false;
		} else if (!dotKeKhaiThongTinNoiTru.equals(other.dotKeKhaiThongTinNoiTru))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (hocKy == null) {
			if (other.hocKy != null)
				return false;
		} else if (!hocKy.equals(other.hocKy))
			return false;
		if (maThongTinNoiTru == null) {
			if (other.maThongTinNoiTru != null)
				return false;
		} else if (!maThongTinNoiTru.equals(other.maThongTinNoiTru))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (ngayDangKy == null) {
			if (other.ngayDangKy != null)
				return false;
		} else if (!ngayDangKy.equals(other.ngayDangKy))
			return false;
		if (ngayKeKhaiThongTin == null) {
			if (other.ngayKeKhaiThongTin != null)
				return false;
		} else if (!ngayKeKhaiThongTin.equals(other.ngayKeKhaiThongTin))
			return false;
		if (phong == null) {
			if (other.phong != null)
				return false;
		} else if (!phong.equals(other.phong))
			return false;
		if (sinhVien == null) {
			if (other.sinhVien != null)
				return false;
		} else if (!sinhVien.equals(other.sinhVien))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}

	public HocKy getHocKy() {
		return hocKy;
	}

	public void setHocKy(HocKy hocKy) {
		this.hocKy = hocKy;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public String getMaThongTinNoiTru() {
		return maThongTinNoiTru;
	}

	public void setMaThongTinNoiTru(String maThongTinNoiTru) {
		this.maThongTinNoiTru = maThongTinNoiTru;
	}

	public Phong getPhong() {
		return phong;
	}

	public void setPhong(Phong phong) {
		this.phong = phong;
	}

	public DotKeKhaiThongTinNoiTru getDotKeKhaiThongTinNoiTru() {
		return dotKeKhaiThongTinNoiTru;
	}

	public void setDotKeKhaiThongTinNoiTru(DotKeKhaiThongTinNoiTru dotKeKhaiThongTinNoiTru) {
		this.dotKeKhaiThongTinNoiTru = dotKeKhaiThongTinNoiTru;
	}

	public Date getNgayDangKy() {
		return ngayDangKy;
	}

	public void setNgayDangKy(Date ngayDangKy) {
		this.ngayDangKy = ngayDangKy;
	}

	public Date getNgayKeKhaiThongTin() {
		return ngayKeKhaiThongTin;
	}

	public void setNgayKeKhaiThongTin(Date ngayKeKhaiThongTin) {
		this.ngayKeKhaiThongTin = ngayKeKhaiThongTin;
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

	@Override
	public int compareTo(ThongTinNoiTru o) {
		return this.maThongTinNoiTru.compareTo(o.maThongTinNoiTru);
	}

}
