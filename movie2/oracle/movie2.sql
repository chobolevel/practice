
/* Drop Tables */

DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE m_order CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE p_order CASCADE CONSTRAINTS;
DROP TABLE m_member CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;




/* Create Tables */

-- 이벤트 게시판
CREATE TABLE event
(
	-- 글번호
	num number(11) NOT NULL,
	-- 글제목
	title varchar2(60),
	-- 내용
	memo number(3000),
	-- 글 작성 시간
	time date,
	-- 조회수
	hit number(11),
	-- 부모글번호
	ref number(11),
	-- 댓글 들여쓰기
	indent number(11),
	-- 댓글 순서
	step number(11),
	-- id
	id varchar2(45) NOT NULL,
	-- 회원 비밀번호
	password varchar2(45) NOT NULL,
	PRIMARY KEY (num)
);


-- 영화 정보 테이블
CREATE TABLE movie
(
	-- 영화코드
	m_code number(3) NOT NULL,
	-- 영화 이름
	m_name varchar2(45) NOT NULL,
	-- m_price
	m_price number(6) NOT NULL,
	-- 영화 감독
	m_director varchar2(20),
	-- 출연 배우
	m_actor varchar2(80),
	-- 영화 장르
	m_category varchar2(15),
	-- 상영 시간
	m_duration number(4),
	PRIMARY KEY (m_code)
);


-- 회원정보
CREATE TABLE m_member
(
	-- id
	id varchar2(45) NOT NULL,
	-- password
	password varchar2(45) NOT NULL,
	-- name
	name varchar2(13),
	-- nickname
	nickname varchar2(15),
	-- birth
	birth date,
	-- phone
	phone varchar2(13),
	-- address
	address varchar2(80),
	-- grade
	grade varchar2(11) DEFAULT 'one',
	-- point
	point number(11) DEFAULT 0,
	PRIMARY KEY (id)
);


-- 영화 에매 정보
CREATE TABLE m_order
(
	-- 예매 번호
	orderno number(11) NOT NULL,
	-- 예매 시간
	m_time varchar2(11),
	-- 예매 좌석
	order_seat varchar2(80),
	-- 예매 인원
	order_cnt number(7),
	-- 예매 금액
	order_price number(20),
	-- 영화코드
	m_code number(3) NOT NULL,
	-- id
	id varchar2(45) NOT NULL,
	PRIMARY KEY (orderno)
);


-- 포인트 샵 상품
CREATE TABLE product
(
	-- 상품 코드
	p_code varchar2(15) NOT NULL,
	-- 상품이름
	p_name varchar2(45) NOT NULL,
	-- 재고수량
	p_qty number(11) NOT NULL,
	-- 상품가격
	p_price number(11) NOT NULL,
	PRIMARY KEY (p_code)
);


-- 상품 주문 정보
CREATE TABLE p_order
(
	-- 상품주문번호
	p_orderno number(11) NOT NULL,
	-- 배송지주소
	address varchar2(80) NOT NULL,
	-- 요청사항
	request varchar2(80),
	-- 주문 개수
	order_qty number(5) NOT NULL,
	-- 최종 주문 가격
	total number(11),
	-- id
	id varchar2(45) NOT NULL,
	-- 상품 코드
	p_code varchar2(15) NOT NULL,
	PRIMARY KEY (p_orderno)
);



/* Create Foreign Keys */

ALTER TABLE m_order
	ADD FOREIGN KEY (m_code)
	REFERENCES movie (m_code)
;


ALTER TABLE event
	ADD FOREIGN KEY (id)
	REFERENCES m_member (id)
	ON DELETE CASCADE
;


ALTER TABLE m_order
	ADD FOREIGN KEY (id)
	REFERENCES m_member (id)
	ON DELETE CASCADE
;


ALTER TABLE p_order
	ADD FOREIGN KEY (id)
	REFERENCES m_member (id)
	ON DELETE CASCADE
;


ALTER TABLE p_order
	ADD FOREIGN KEY (p_code)
	REFERENCES product (p_code)
;



/* Comments */

COMMENT ON TABLE event IS '이벤트 게시판';
COMMENT ON COLUMN event.num IS '글번호';
COMMENT ON COLUMN event.title IS '글제목';
COMMENT ON COLUMN event.memo IS '내용';
COMMENT ON COLUMN event.time IS '글 작성 시간';
COMMENT ON COLUMN event.hit IS '조회수';
COMMENT ON COLUMN event.reff IS '부모글번호';
COMMENT ON COLUMN event.indent IS '댓글 들여쓰기';
COMMENT ON COLUMN event.step IS '댓글 순서';
COMMENT ON COLUMN event.id IS 'id';
COMMENT ON COLUMN event.password IS '회원 비밀번호';
COMMENT ON TABLE movie IS '영화 정보 테이블';
COMMENT ON COLUMN movie.m_code IS '영화코드';
COMMENT ON COLUMN movie.m_name IS '영화 이름';
COMMENT ON COLUMN movie.m_price IS 'm_price';
COMMENT ON COLUMN movie.m_director IS '영화 감독';
COMMENT ON COLUMN movie.m_actor IS '출연 배우';
COMMENT ON COLUMN movie.m_category IS '영화 장르';
COMMENT ON COLUMN movie.m_duration IS '상영 시간';
COMMENT ON TABLE m_member IS '회원정보';
COMMENT ON COLUMN m_member.id IS 'id';
COMMENT ON COLUMN m_member.password IS 'password';
COMMENT ON COLUMN m_member.name IS 'name';
COMMENT ON COLUMN m_member.nickname IS 'nickname';
COMMENT ON COLUMN m_member.birth IS 'birth';
COMMENT ON COLUMN m_member.phone IS 'phone';
COMMENT ON COLUMN m_member.address IS 'address';
COMMENT ON COLUMN m_member.grade IS 'grade';
COMMENT ON COLUMN m_member.point IS 'point';
COMMENT ON TABLE m_order IS '영화 에매 정보';
COMMENT ON COLUMN m_order.orderno IS '예매 번호';
COMMENT ON COLUMN m_order.m_time IS '예매 시간';
COMMENT ON COLUMN m_order.order_seat IS '예매 좌석';
COMMENT ON COLUMN m_order.order_cnt IS '예매 인원';
COMMENT ON COLUMN m_order.order_price IS '예매 금액';
COMMENT ON COLUMN m_order.m_code IS '영화코드';
COMMENT ON COLUMN m_order.id IS 'id';
COMMENT ON TABLE product IS '포인트 샵 상품';
COMMENT ON COLUMN product.p_code IS '상품 코드';
COMMENT ON COLUMN product.p_name IS '상품이름';
COMMENT ON COLUMN product.p_qty IS '재고수량';
COMMENT ON COLUMN product.p_price IS '상품가격';
COMMENT ON TABLE p_order IS '상품 주문 정보';
COMMENT ON COLUMN p_order.p_orderno IS '상품주문번호';
COMMENT ON COLUMN p_order.address IS '배송지주소';
COMMENT ON COLUMN p_order.request IS '요청사항';
COMMENT ON COLUMN p_order.order_qty IS '주문 개수';
COMMENT ON COLUMN p_order.total IS '최종 주문 가격';
COMMENT ON COLUMN p_order.id IS 'id';
COMMENT ON COLUMN p_order.p_code IS '상품 코드';



