package kTXCore.modelDao;

import kTXCore.dao.ObjectDAO;
import kTXCore.model.TaiKhoanNhanVien;

public class DAO_TaiKhoanNhanVien extends ObjectDAO<TaiKhoanNhanVien> {
	public DAO_TaiKhoanNhanVien() {
		this.table = "TaiKhoanNhanVien";
	}
}
