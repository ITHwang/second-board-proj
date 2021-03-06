package com.myspring.sbp.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.sbp.board.dao.BoardDAO;
import com.myspring.sbp.board.vo.ArticleVO;
import com.myspring.sbp.board.vo.ImageVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	public List<ArticleVO> listArticles() throws Exception {
		List<ArticleVO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}

	// 다중 이미지 추가하기
	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		int articleNO = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		boardDAO.insertNewImage(articleMap);
		return articleNO;
	}

	// 다중 파일 보이기
	@Override
	public Map viewArticle(int articleNO) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
		articleMap.put("article", articleVO);
		articleMap.put("imageFileList", imageFileList);
		return articleMap;
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
		if (articleMap.get("imageFileList") != null) {
			boardDAO.updateImageFileList((List) articleMap.get("imageFileList"));
		}
	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

}
