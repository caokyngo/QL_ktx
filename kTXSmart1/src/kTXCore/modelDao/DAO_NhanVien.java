package kTXCore.modelDao;

import kTXCore.dao.ObjectDAO;
import kTXCore.model.NhanVien;

public class DAO_NhanVien extends ObjectDAO<NhanVien> {
	public DAO_NhanVien() {
		this.table = "NhanVien";
	}
}
