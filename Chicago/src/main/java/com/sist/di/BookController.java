package com.sist.di;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BookVO;
import com.sist.service.BookService;

@Controller
public class BookController {

	// 내용추가(16.10.31)
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Resource(name = "bookService")
	private BookService bs;

	// 도서 메인 페이지 
	@RequestMapping("book")
	public String login_page(Model model) {

		// 내용추가 (16.10.31)
		List<BookVO> bookList = bs.bookAllList();
		List<BookVO> newBookList1 = bs.newBookCate(1);
		List<BookVO> newBookList2 = bs.newBookCate(2);
		List<BookVO> newBookList3 = bs.newBookCate(3);
		List<BookVO> newBookList4 = bs.newBookCate(4);

		model.addAttribute("bookList", bookList);
		model.addAttribute("newBookCate1", newBookList1);
		model.addAttribute("newBookCate2", newBookList2);
		model.addAttribute("newBookCate3", newBookList3);
		model.addAttribute("newBookCate4", newBookList4);

		// 기존내용
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("book_jsp", "../book/list.jsp");
		return "main/main";
	}
	
	// 카테고리 별 리스트 보여주는 페이지 
	@RequestMapping("categoryList")
	public String book_cate_page1(Model model, String book_category, String page) {
		// 페이지 구하기 
		if(page == null) {
			page = "1"; // 첫번째 페이지를 메인으로 보여주기 
		}
		
		int curPage = Integer.parseInt(page); // 현재 페이지를 숫자값으로 바꿔주기
		int rowSize = 10; // 1페이지에 10개의 목록이 나오도록 값 주기
		int start = (curPage * rowSize) - (rowSize-1); // 시작글
		int end = curPage * rowSize; // 마지막글
		
		int bcate = Integer.parseInt(book_category);
		
		Map map = new HashMap(); // 해쉬맵 생성
		map.put("start", start); // 맵에 시작글 넣어주기
		map.put("end", end); // 맵에 마지막글 넣어주기
		map.put("category", bcate); // 맵에 총 권수 넣어주기

		int totalPage = bs.cateFirTotalPage(bcate);
		int count = bs.cateFirCount(bcate);
		count = count - ((curPage*5)-5);
		
		// 블록 나누기
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		
		List<BookVO> cateList = bs.bookListCateFirst(map);
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("book_category", book_category);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("count", count);
		model.addAttribute("cateList", cateList);
		model.addAttribute("page", page);
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("jsp", "../book/categoryList.jsp");
		return "main/main";
	}

}
