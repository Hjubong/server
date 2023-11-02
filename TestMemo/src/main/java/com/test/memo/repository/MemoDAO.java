package com.test.memo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.memo.model.MemoDTO;

public class MemoDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public MemoDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<MemoDTO> list() {

		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();

		try {

			String sql = "select * from tblMemo";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			while (rs.next()) {

				MemoDTO dto = new MemoDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public MemoDTO get(String seq) {

		try {

			String sql = "select * from tblMemo where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			MemoDTO dto = new MemoDTO();

			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int add(MemoDTO dto) {

		try {

			String sql = "insert into tblMemo (seq, name, pw , memo, regdate) values (seqMemo.nextVal, ?, ?, ?, default)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getMemo());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

}
