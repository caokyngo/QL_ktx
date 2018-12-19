package kTXSm2.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import kTXCore.dao.ObjectDAO;
import kTXCore.model.SinhVien;
@Entity
public class MatHang_SinhVien extends MatHang{
	@ManyToOne
	public SinhVien sinhVien;
	public MatHang_SinhVien() {		
	}
	public MatHang_SinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	public SinhVien getSinhVien() {
		return sinhVien;
	}
	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
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
		MatHang_SinhVien other = (MatHang_SinhVien) obj;
		if (sinhVien == null) {
			if (other.sinhVien != null)
				return false;
		} else if (!sinhVien.equals(other.sinhVien))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "MatHang_SinhVien [sinhVien=" + sinhVien + "]";
	}
	
}
