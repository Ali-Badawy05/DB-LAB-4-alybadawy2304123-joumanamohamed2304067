-- Problem 2: Library database
DROP DATABASE IF EXISTS library;
CREATE DATABASE library CHARACTER SET utf8mb4;
USE library;

CREATE TABLE author (
    author_id INT          NOT NULL AUTO_INCREMENT,
    name      VARCHAR(100) NOT NULL,
    country   VARCHAR(50)  NOT NULL,
    photo     VARCHAR(255) NULL,
    PRIMARY KEY (author_id)
) ENGINE = InnoDB;


CREATE TABLE publisher (
    publisher_id INT          NOT NULL AUTO_INCREMENT,
    name         VARCHAR(100) NOT NULL,
    country      VARCHAR(50)  NOT NULL,
    PRIMARY KEY (publisher_id)
) ENGINE = InnoDB;


CREATE TABLE category (
    category_id INT         NOT NULL AUTO_INCREMENT,
    name        VARCHAR(50) NOT NULL,
    PRIMARY KEY (category_id)
) ENGINE = InnoDB;


CREATE TABLE book (
    book_id      INT           NOT NULL AUTO_INCREMENT,
    title        VARCHAR(200)  NOT NULL,
    price        DECIMAL(10,2) NOT NULL,
    publish_year INT           NOT NULL,
    author_id    INT           NOT NULL,
    publisher_id INT           NOT NULL,
    category_id  INT           NOT NULL,
    cover        VARCHAR(255)  NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id)    REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
    FOREIGN KEY (category_id)  REFERENCES category (category_id)
) ENGINE = InnoDB;


CREATE TABLE member (
    member_id INT          NOT NULL AUTO_INCREMENT,
    name      VARCHAR(100) NOT NULL,
    email     VARCHAR(100) NOT NULL,
    join_date DATE         NOT NULL,
    PRIMARY KEY (member_id),
    UNIQUE (email)
) ENGINE = InnoDB;


CREATE TABLE loan (
    loan_id     INT  NOT NULL AUTO_INCREMENT,
    book_id     INT  NOT NULL,
    member_id   INT  NOT NULL,
    loan_date   DATE NOT NULL,
    return_date DATE NULL,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (book_id)   REFERENCES book (book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES member (member_id)
) ENGINE = InnoDB;
CREATE TABLE users (
    user_id           INT          NOT NULL AUTO_INCREMENT,
    email             VARCHAR(255) NOT NULL,
    name              VARCHAR(100) NOT NULL,
    password_hash     VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id),
    UNIQUE (email)
) ENGINE = InnoDB;
