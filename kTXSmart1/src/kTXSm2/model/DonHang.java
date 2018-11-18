package kTXSm2.model;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import kTXCore.model.NhanVien;
import kTXCore.model.SinhVien;

@Entity
public class DonHang implements Comparable<DonHang>{
	@Id
	public String maDonHang;
	@ManyToOne
	public SinhVien sinhVien;
	@ManyToOne
	public NhanVien nhanVien;
	@ManyToOne
	public LoaiDonHang loaiDonHang;
	@ManyToOne 
	public TinhTrangDonHang tinhTrangDonHang;
	public String hoDemNguoiDat;
	public String tenNguoiDat;
	public String diaChi;
	public String soDienThoai;
	public Date ngayDat;
	public Double tongTien;
	public String soDiemDuocTich;
	@Type(type="text")
	public String ghiChu;
	public Date thoiGianCapNhat;
	
	
	public DonHang() {
	}

	public DonHang(String maDonHang, SinhVien sinhVien, NhanVien nhanVien, LoaiDonHang loaiDonHang,
			TinhTrangDonHang tinhTrangDonHang, String hoDemNguoiDat, String tenNguoiDat, String diaChi,
			String soDienThoai, Date ngayDat, Double tongTien, String soDiemDuocTich, String ghiChu,
			Date thoiGianCapNhat) {
		super();
		this.maDonHang = maDonHang;
		this.sinhVien = sinhVien;
		this.nhanVien = nhanVien;
		this.loaiDonHang = loaiDonHang;
		this.tinhTrangDonHang = tinhTrangDonHang;
		this.hoDemNguoiDat = hoDemNguoiDat;
		this.tenNguoiDat = tenNguoiDat;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.ngayDat = ngayDat;
		this.tongTien = tongTien;
		this.soDiemDuocTich = soDiemDuocTich;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaDonHang() {
		return maDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public LoaiDonHang getLoaiDonHang() {
		return loaiDonHang;
	}

	public void setLoaiDonHang(LoaiDonHang loaiDonHang) {
		this.loaiDonHang = loaiDonHang;
	}

	public TinhTrangDonHang getTinhTrangDonHang() {
		return tinhTrangDonHang;
	}

	public void setTinhTrangDonHang(TinhTrangDonHang tinhTrangDonHang) {
		this.tinhTrangDonHang = tinhTrangDonHang;
	}

	public String getHoDemNguoiDat() {
		return hoDemNguoiDat;
	}

	public void setHoDemNguoiDat(String hoDemNguoiDat) {
		this.hoDemNguoiDat = hoDemNguoiDat;
	}

	public String getTenNguoiDat() {
		return tenNguoiDat;
	}

	public void setTenNguoiDat(String tenNguoiDat) {
		this.tenNguoiDat = tenNguoiDat;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public Date getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}

	public Double getTongTien() {
		return tongTien;
	}

	public void setTongTien(Double tongTien) {
		this.tongTien = tongTien;
	}

	public String getSoDiemDuocTich() {
		return soDiemDuocTich;
	}

	public void setSoDiemDuocTich(String soDiemDuocTich) {
		this.soDiemDuocTich = soDiemDuocTich;
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
		result = prime * result + ((diaChi == null) ? 0 : diaChi.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((hoDemNguoiDat == null) ? 0 : hoDemNguoiDat.hashCode());
		result = prime * result + ((loaiDonHang == null) ? 0 : loaiDonHang.hashCode());
		result = prime * result + ((maDonHang == null) ? 0 : maDonHang.hashCode());
		result = prime * result + ((ngayDat == null) ? 0 : ngayDat.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soDiemDuocTich == null) ? 0 : soDiemDuocTich.hashCode());
		result = prime * result + ((soDienThoai == null) ? 0 : soDienThoai.hashCode());
		result = prime * result + ((tenNguoiDat == null) ? 0 : tenNguoiDat.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((tinhTrangDonHang == null) ? 0 : tinhTrangDonHang.hashCode());
		result = prime * result + ((tongTien == null) ? 0 : tongTien.hashCode());
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
		DonHang other = (DonHang) obj;
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
		if (hoDemNguoiDat == null) {
			if (other.hoDemNguoiDat != null)
				return false;
		} else if (!hoDemNguoiDat.equals(other.hoDemNguoiDat))
			return false;
		if (loaiDonHang == null) {
			if (other.loaiDonHang != null)
				return false;
		} else if (!loaiDonHang.equals(other.loaiDonHang))
			return false;
		if (maDonHang == null) {
			if (other.maDonHang != null)
				return false;
		} else if (!maDonHang.equals(other.maDonHang))
			return false;
		if (ngayDat == null) {
			if (other.ngayDat != null)
				return false;
		} else if (!ngayDat.equals(other.ngayDat))
			return false;
		if (nhanVien == null) {
			if (other.nhanVien != null)
				return false;
		} else if (!nhanVien.equals(other.nhanVien))
			return false;
		if (sinhVien == null) {
			if (other.sinhVien != null)
				return false;
		} else if (!sinhVien.equals(other.sinhVien))
			return false;
		if (soDiemDuocTich == null) {
			if (other.soDiemDuocTich != null)
				return false;
		} else if (!soDiemDuocTich.equals(other.soDiemDuocTich))
			return false;
		if (soDienThoai == null) {
			if (other.soDienThoai != null)
				return false;
		} else if (!soDienThoai.equals(other.soDienThoai))
			return false;
		if (tenNguoiDat == null) {
			if (other.tenNguoiDat != null)
				return false;
		} else if (!tenNguoiDat.equals(other.tenNguoiDat))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (tinhTrangDonHang == null) {
			if (other.tinhTrangDonHang != null)
				return false;
		} else if (!tinhTrangDonHang.equals(other.tinhTrangDonHang))
			return false;
		if (tongTien == null) {
			if (other.tongTien != null)
				return false;
		} else if (!tongTien.equals(other.tongTien))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DonHang [maDonHang=" + maDonHang + ", sinhVien=" + sinhVien + ", nhanVien=" + nhanVien
				+ ", loaiDonHang=" + loaiDonHang + ", tinhTrangDonHang=" + tinhTrangDonHang + ", hoDemNguoiDat="
				+ hoDemNguoiDat + ", tenNguoiDat=" + tenNguoiDat + ", diaChi=" + diaChi + ", soDienThoai=" + soDienThoai
				+ ", ngayDat=" + ngayDat + ", tongTien=" + tongTien + ", soDiemDuocTich=" + soDiemDuocTich + ", ghiChu="
				+ ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(DonHang o) {
		return this.maDonHang.compareTo(o.maDonHang);
	}
	

}
