package kTXSm4.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import kTXCore.model.SinhVien;
import kTXSm3.model.DichVu;

@Entity

public class PhanHoi implements Comparable<PhanHoi> {
	@Id
	public String maPhanHoi;
	@ManyToOne
	public DichVu dichVu;
	@ManyToOne
	public SinhVien sinhVien;
	@Type(type = "text")
	public String noiDungPhanHoi;
	public Date ngayPhanHoi;
	public Date thoiGianCapNhat;

	public PhanHoi() {
		super();
	}

	public PhanHoi(String maPhanHoi, DichVu dichVu, SinhVien sinhVien, String noiDungPhanHoi, Date ngayPhanHoi,
			Date thoiGianCapNhat) {
		super();
		this.maPhanHoi = maPhanHoi;
		this.dichVu = dichVu;
		this.sinhVien = sinhVien;
		this.noiDungPhanHoi = noiDungPhanHoi;
		this.ngayPhanHoi = ngayPhanHoi;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaPhanHoi() {
		return maPhanHoi;
	}

	public void setMaPhanHoi(String maPhanHoi) {
		this.maPhanHoi = maPhanHoi;
	}

	public DichVu getDichVu() {
		return dichVu;
	}

	public void setDichVu(DichVu dichVu) {
		this.dichVu = dichVu;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public String getNoiDungPhanHoi() {
		return noiDungPhanHoi;
	}

	public void setNoiDungPhanHoi(String noiDungPhanHoi) {
		this.noiDungPhanHoi = noiDungPhanHoi;
	}

	public Date getNgayPhanHoi() {
		return ngayPhanHoi;
	}

	public void setNgayPhanHoi(Date ngayPhanHoi) {
		this.ngayPhanHoi = ngayPhanHoi;
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
		result = prime * result + ((dichVu == null) ? 0 : dichVu.hashCode());
		result = prime * result + ((maPhanHoi == null) ? 0 : maPhanHoi.hashCode());
		result = prime * result + ((ngayPhanHoi == null) ? 0 : ngayPhanHoi.hashCode());
		result = prime * result + ((noiDungPhanHoi == null) ? 0 : noiDungPhanHoi.hashCode());
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
		PhanHoi other = (PhanHoi) obj;
		if (dichVu == null) {
			if (other.dichVu != null)
				return false;
		} else if (!dichVu.equals(other.dichVu))
			return false;
		if (maPhanHoi == null) {
			if (other.maPhanHoi != null)
				return false;
		} else if (!maPhanHoi.equals(other.maPhanHoi))
			return false;
		if (ngayPhanHoi == null) {
			if (other.ngayPhanHoi != null)
				return false;
		} else if (!ngayPhanHoi.equals(other.ngayPhanHoi))
			return false;
		if (noiDungPhanHoi == null) {
			if (other.noiDungPhanHoi != null)
				return false;
		} else if (!noiDungPhanHoi.equals(other.noiDungPhanHoi))
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

	@Override
	public String toString() {
		return "PhanHoi [maPhanHoi=" + maPhanHoi + ", dichVu=" + dichVu + ", sinhVien=" + sinhVien + ", noiDungPhanHoi="
				+ noiDungPhanHoi + ", ngayPhanHoi=" + ngayPhanHoi + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(PhanHoi o) {
		return this.maPhanHoi.compareTo(o.maPhanHoi);
	}

}
