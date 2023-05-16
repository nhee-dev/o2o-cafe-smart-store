drop database if exists ssf_mobile_cafe;
select @@global.transaction_isolation, @@transaction_isolation;
set @@transaction_isolation="read-committed";

create database ssf_mobile_cafe;
use ssf_mobile_cafe;

create table t_user(
	id varchar(100) primary key,
    name varchar(100) not null,
    pass varchar(100) not null,
    stamps integer default 0
);
create table t_product(
	id integer auto_increment primary key,
    name varchar(100) not null,
    type varchar(20) not null,
    price integer not null,
    img varchar(100) not null
);


create  table t_order(
	o_id integer auto_increment primary key,
    user_id varchar(100) not null,
    order_table varchar(20),
    order_time timestamp default CURRENT_TIMESTAMP,    
    completed char(1) default 'N',
    constraint fk_order_user foreign key (user_id) references t_user(id) on delete cascade
);

create table t_order_detail(
	d_id integer auto_increment primary key,
    order_id integer not null,
    product_id integer not null,
    quantity integer not null default 1,
    constraint fk_order_detail_product foreign key (product_id) references t_product(id) on delete cascade,
    constraint fk_order_detail_order foreign key(order_id) references t_order(o_id) on delete cascade
);                                                 

create table t_stamp(
	id integer auto_increment primary key,
    user_id varchar(100) not null,
    order_id integer not null,
    quantity integer not null default 1,
    constraint fk_stamp_user foreign key (user_id) references t_user(id) on delete cascade,
    constraint fk_stamp_order foreign key (order_id) references t_order(o_id) on delete cascade
);

create table t_comment(
	id integer auto_increment primary key,
    user_id varchar(100) not null,
    product_id integer not null,
    rating float not null default 1,
    comment varchar(200),
    constraint fk_comment_user foreign key(user_id) references t_user(id) on delete cascade,
    constraint fk_comment_product foreign key(product_id) references t_product(id) on delete cascade
);


INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf01', '김싸피', 'pass01', 5);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf02', '황원태', 'pass02', 0);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf03', '한정일', 'pass03', 3);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf04', '반장운', 'pass04', 4);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf05', '박하윤', 'pass05', 5);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf06', '정비선', 'pass06', 6);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf07', '김병관', 'pass07', 7);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf08', '강석우', 'pass08', 8);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf09', '견본무', 'pass09', 9);
INSERT INTO t_user (id, name, pass, stamps) VALUES ('ssaf10', '전인성', 'pass10', 20);

INSERT INTO t_product (name, type, price, img) VALUES ('아메리카노', 'coffee', 4100, 'coffee1.png');
INSERT INTO t_product (name, type, price, img) VALUES ('카페라떼', 'coffee', 4500, 'coffee2.png');
INSERT INTO t_product (name, type, price, img) VALUES ('카라멜 마끼아또', 'coffee', 4800, 'coffee3.png');
INSERT INTO t_product (name, type, price, img) VALUES ('카푸치노', 'coffee', 4800, 'coffee4.png');
INSERT INTO t_product (name, type, price, img) VALUES ('모카라떼', 'coffee', 4800, 'coffee5.png');
INSERT INTO t_product (name, type, price, img) VALUES ('민트라떼', 'coffee', 4300, 'coffee6.png');
INSERT INTO t_product (name, type, price, img) VALUES ('화이트 모카라떼', 'coffee', 4800, 'coffee7.png');
INSERT INTO t_product (name, type, price, img) VALUES ('자몽에이드', 'coffee', 5100, 'coffee8.png');
INSERT INTO t_product (name, type, price, img) VALUES ('레몬에이드', 'coffee', 5100, 'coffee9.png');
INSERT INTO t_product (name, type, price, img) VALUES ('초코칩 쿠키', 'cookie', 1500, 'cookie.png');
commit;
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf01', 1, 1, '신맛 강한 커피는 좀 별루네요.');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf02', 1, 2, '커피 맛을 좀 신경 써야 할 것 같네요.');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf03', 1, 3, '그냥 저냥');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf04', 4, 4, '갠춘한 맛');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf05', 5, 5, 'SoSSo');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf06', 6, 6, '그냥 저냥 먹을만함');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf07', 7, 10, '이집 화이트 모카라떼가 젤 나은듯');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf08', 8, 8, '자몽 특유의 맛이 살아있네요.');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf09', 8, 9, '수제 자몽에이드라 그런지 맛나요.');
INSERT INTO t_comment (user_id, product_id, rating, comment) VALUES ('ssaf10', 10, 10, '초코칩 쿠키 먹으로 여기 옵니다.');

INSERT INTO t_order (user_id, order_table) VALUES ('ssaf01', 'order_table 01');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf01', 'order_table 02');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf03', 'order_table 03');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf04', 'order_table 04');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf05', 'order_table 05');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf06', 'order_table 06');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf07', 'order_table 07');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf08', 'order_table 08');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf09', 'order_table 09');
INSERT INTO t_order (user_id, order_table) VALUES ('ssaf10', 'order_table 10');

INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (1, 1, 1);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (1, 2, 3);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (2, 8, 1);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (3, 3, 3);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (4, 4, 4);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (5, 5, 5);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (6, 6, 6);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (7, 7, 7);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (8, 8, 8);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (9, 9, 9);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (10, 8, 10);
INSERT INTO t_order_detail (order_id, product_id, quantity) VALUES (10, 10, 10);


INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf01', 1, 4);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf01', 2, 1);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf03', 3, 3);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf04', 4, 4);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf05', 5, 5);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf06', 6, 6);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf07', 7, 7);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf08', 8, 8);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf09', 9, 9);
INSERT INTO t_stamp (user_id, order_id, quantity) VALUES ('ssaf10', 10, 20);


commit;