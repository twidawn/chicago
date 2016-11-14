package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.WriterVO;

public interface WriterService {
	public List<WriterVO> printWriter(Map map) throws Exception;
	public int printWriterTotalPage(Map map) throws Exception;
	public List<WriterVO> printSearchWriter(Map map) throws Exception;
	public int printSearchWriterTotalPage(Map map) throws Exception;
	public WriterVO detailWriter(int writer_no) throws Exception;
}
