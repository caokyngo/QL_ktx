package kTXCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class TaiKhoanSinhVien extends TaiKhoan {
	@OneToOne(fetch = FetchType.EAGER)
	public SinhVien sinhVien;

	public TaiKhoanSinhVien() {
	}

	public TaiKhoanSinhVien(kTXCore.model.SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

}
