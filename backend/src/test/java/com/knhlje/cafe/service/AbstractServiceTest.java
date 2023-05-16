package com.knhlje.cafe.service;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.knhlje.cafe.model.dao.OrderDao;
import com.knhlje.cafe.model.dao.OrderDetailDao;
import com.knhlje.cafe.model.dto.User;
import com.knhlje.cafe.model.service.CommentService;
import com.knhlje.cafe.model.service.OrderService;
import com.knhlje.cafe.model.service.ProductService;
import com.knhlje.cafe.model.service.StampService;
import com.knhlje.cafe.model.service.UserService;

@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
// @Transactional
public abstract class AbstractServiceTest {

	public static User user = new User("ssaf01", "김싸피", "pass01", 5, null);

	/*
    public static UserService userService;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
        userService = UserServiceImpl.getInstance();
        userService.join(user);
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
        userService.leave(user.getId());
    }*/


	@Autowired
	public UserService userService;
	
	@Autowired
	public ProductService prodService;
	
	@Autowired
	public OrderService orderService;
	
	@Autowired
	public CommentService cService;
	
	@Autowired
	public StampService sService;

	@Autowired
	OrderDao oDao;
	
	@Autowired
	OrderDetailDao dDao;

}
