package kTXSm2.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import kTXCore.model.ChucNang;
import kTXSm3.model.DichVu;

@Entity

public class MatHang implements Comparable<MatHang> {
	@Id
	public String maMatHang;
	public String tenMatHang;
	@ManyToOne
	public DichVu dichVu;
	@ManyToOne
	public KhuyenMai khuyenMai;
	@ManyToOne
	public NhaCungCap nhaCungCap;

	@ManyToMany(mappedBy = "mathangs", fetch = FetchType.EAGER)
	public Set<DonHang> donhangs = new HashSet<>();
	public Date ngayNhap;
	public String hanSuDung;
	public String soLuongTon;
	public Double giaNhap;
	public Double giaBan;
	public Double giaSauKhuyenMai;
	public String anhMoTa;
	public String soDiemDoi;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	public MatHang() {

	}


	public MatHang(String maMatHang, String tenMatHang, DichVu dichVu, KhuyenMai khuyenMai, NhaCungCap nhaCungCap,
			 Date ngayNhap, String hanSuDung, String soLuongTon, Double giaNhap, Double giaBan,
			Double giaSauKhuyenMai, String anhMoTa, String soDiemDoi, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maMatHang = maMatHang;
		this.tenMatHang = tenMatHang;
		this.dichVu = dichVu;
		this.khuyenMai = khuyenMai;
		this.nhaCungCap = nhaCungCap;
		
		this.ngayNhap = ngayNhap;
		this.hanSuDung = hanSuDung;
		this.soLuongTon = soLuongTon;
		this.giaNhap = giaNhap;
		this.giaBan = giaBan;
		this.giaSauKhuyenMai = giaSauKhuyenMai;
		this.anhMoTa = anhMoTa;
		this.soDiemDoi = soDiemDoi;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}


	

	

	public String getMaMatHang() {
		return maMatHang;
	}

	public void setMaMatHang(String maMatHang) {
		this.maMatHang = maMatHang;
	}

	public String getTenMatHang() {
		return tenMatHang;
	}

	public void setTenMatHang(String tenMatHang) {
		this.tenMatHang = tenMatHang;
	}

	public DichVu getDichVu() {
		return dichVu;
	}

	public void setDichVu(DichVu dichVu) {
		this.dichVu = dichVu;
	}

	public KhuyenMai getKhuyenMai() {
		return khuyenMai;
	}

	public void setKhuyenMai(KhuyenMai khuyenMai) {
		this.khuyenMai = khuyenMai;
	}

	public NhaCungCap getNhaCungCap() {
		return nhaCungCap;
	}

	public void setNhaCungCap(NhaCungCap nhaCungCap) {
		this.nhaCungCap = nhaCungCap;
	}

	public Date getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public String getHanSuDung() {
		return hanSuDung;
	}

	public void setHanSuDung(String hanSuDung) {
		this.hanSuDung = hanSuDung;
	}

	public String getSoLuongTon() {
		return soLuongTon;
	}

	public void setSoLuongTon(String soLuongTon) {
		this.soLuongTon = soLuongTon;
	}

	public Double getGiaNhap() {
		return giaNhap;
	}

	public void setGiaNhap(Double giaNhap) {
		this.giaNhap = giaNhap;
	}

	public Double getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(Double giaBan) {
		this.giaBan = giaBan;
	}

	public Double getGiaSauKhuyenMai() {
		return giaSauKhuyenMai;
	}

	public void setGiaSauKhuyenMai(Double giaSauKhuyenMai) {
		giaSauKhuyenMai = getGiaBan() - khuyenMai.mucKhuyenMai;
		this.giaSauKhuyenMai = giaSauKhuyenMai;
	}

	public String getAnhMoTa() {
		return anhMoTa;
	}

	public void setAnhMoTa(String anhMoTa) {
		this.anhMoTa = anhMoTa;
	}

	public String getSoDiemDoi() {
		return soDiemDoi;
	}

	public void setSoDiemDoi(String soDiemDoi) {
		this.soDiemDoi = soDiemDoi;
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
		result = prime * result + ((anhMoTa == null) ? 0 : anhMoTa.hashCode());
		result = prime * result + ((dichVu == null) ? 0 : dichVu.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((giaBan == null) ? 0 : giaBan.hashCode());
		result = prime * result + ((giaNhap == null) ? 0 : giaNhap.hashCode());
		result = prime * result + ((giaSauKhuyenMai == null) ? 0 : giaSauKhuyenMai.hashCode());
		result = prime * result + ((hanSuDung == null) ? 0 : hanSuDung.hashCode());
		result = prime * result + ((khuyenMai == null) ? 0 : khuyenMai.hashCode());
		
		result = prime * result + ((maMatHang == null) ? 0 : maMatHang.hashCode());
		result = prime * result + ((ngayNhap == null) ? 0 : ngayNhap.hashCode());
		result = prime * result + ((nhaCungCap == null) ? 0 : nhaCungCap.hashCode());
		result = prime * result + ((soDiemDoi == null) ? 0 : soDiemDoi.hashCode());
		result = prime * result + ((soLuongTon == null) ? 0 : soLuongTon.hashCode());
		result = prime * result + ((tenMatHang == null) ? 0 : tenMatHang.hashCode());
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
		MatHang other = (MatHang) obj;
		if (anhMoTa == null) {
			if (other.anhMoTa != null)
				return false;
		} else if (!anhMoTa.equals(other.anhMoTa))
			return false;
		if (dichVu == null) {
			if (other.dichVu != null)
				return false;
		} else if (!dichVu.equals(other.dichVu))
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
		if (giaNhap == null) {
			if (other.giaNhap != null)
				return false;
		} else if (!giaNhap.equals(other.giaNhap))
			return false;
		if (giaSauKhuyenMai == null) {
			if (other.giaSauKhuyenMai != null)
				return false;
		} else if (!giaSauKhuyenMai.equals(other.giaSauKhuyenMai))
			return false;
		if (hanSuDung == null) {
			if (other.hanSuDung != null)
				return false;
		} else if (!hanSuDung.equals(other.hanSuDung))
			return false;
		if (khuyenMai == null) {
			if (other.khuyenMai != null)
				return false;
		} else if (!khuyenMai.equals(other.khuyenMai))
			return false;
		
		if (maMatHang == null) {
			if (other.maMatHang != null)
				return false;
		} else if (!maMatHang.equals(other.maMatHang))
			return false;
		if (ngayNhap == null) {
			if (other.ngayNhap != null)
				return false;
		} else if (!ngayNhap.equals(other.ngayNhap))
			return false;
		if (nhaCungCap == null) {
			if (other.nhaCungCap != null)
				return false;
		} else if (!nhaCungCap.equals(other.nhaCungCap))
			return false;
		if (soDiemDoi == null) {
			if (other.soDiemDoi != null)
				return false;
		} else if (!soDiemDoi.equals(other.soDiemDoi))
			return false;
		if (soLuongTon == null) {
			if (other.soLuongTon != null)
				return false;
		} else if (!soLuongTon.equals(other.soLuongTon))
			return false;
		if (tenMatHang == null) {
			if (other.tenMatHang != null)
				return false;
		} else if (!tenMatHang.equals(other.tenMatHang))
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
		return "MatHang [maMatHang=" + maMatHang + ", tenMatHang=" + tenMatHang + ", dichVu=" + dichVu + ", khuyenMai="
				+ khuyenMai + ", nhaCungCap=" + nhaCungCap + ", ngayNhap=" + ngayNhap
				+ ", hanSuDung=" + hanSuDung + ", soLuongTon=" + soLuongTon + ", giaNhap=" + giaNhap + ", giaBan="
				+ giaBan + ", giaSauKhuyenMai=" + giaSauKhuyenMai + ", anhMoTa=" + anhMoTa + ", soDiemDoi=" + soDiemDoi
				+ ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(MatHang o) {
		return this.maMatHang.compareTo(o.maMatHang);
	}

}
