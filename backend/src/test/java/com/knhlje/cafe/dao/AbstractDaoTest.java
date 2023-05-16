package com.knhlje.cafe.dao;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.knhlje.cafe.model.dao.CommentDao;
import com.knhlje.cafe.model.dao.OrderDao;
import com.knhlje.cafe.model.dao.OrderDetailDao;
import com.knhlje.cafe.model.dao.ProductDao;
import com.knhlje.cafe.model.dao.StampDao;
import com.knhlje.cafe.model.dao.UserDao;

@SpringBootTest
//@Transactional
@TestMethodOrder(OrderAnnotation.class)
abstract class AbstractDaoTest {

	@Autowired
	UserDao uDao;

	@Autowired
	ProductDao pDao;

	@Autowired
	OrderDao oDao;

	@Autowired
	OrderDetailDao dDao;

	@Autowired
	CommentDao cDao;

	@Autowired
	StampDao sDao;

}
