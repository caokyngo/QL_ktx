package kTXSm2.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import kTXCore.model.NhanVien;
import kTXSm3.model.DichVu;

@Entity
public class MatHang_NhanVien extends MatHang {
	@ManyToOne
	public NhanVien nhanVien;

	public MatHang_NhanVien() {

	}

	public MatHang_NhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		MatHang_NhanVien other = (MatHang_NhanVien) obj;
		if (nhanVien == null) {
			if (other.nhanVien != null)
				return false;
		} else if (!nhanVien.equals(other.nhanVien))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MatHang_QuanLy [nhanVien=" + nhanVien + "]";
	}

}
