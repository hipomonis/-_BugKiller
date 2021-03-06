-- +---------------------------------------------------------
-- | MODEL       : project
-- | AUTHOR      : Lee
-- | GENERATED BY: Open System Architect
-- +---------------------------------------------------------
-- | WARNING     : Review before execution
-- +---------------------------------------------------------

-- +---------------------------------------------------------
-- | CREATE
-- +---------------------------------------------------------
CREATE TABLE `cinema`
(
  cinname VARCHAR(20) NOT NULL,
  cinid INTEGER NOT NULL,
  address VARCHAR(200),
  phoneNum CHAR(15),
  PRIMARY KEY (cinid)
);

CREATE TABLE `film`
(
  fname VARCHAR(20) NOT NULL,
  fid INTEGER(100) NOT NULL,
  description VARCHAR(200),
  length INTEGER,
  releaseDate DATE,
  PRIMARY KEY (fid)
);

CREATE TABLE `room`
(
  roonname VARCHAR(20) NOT NULL,
  rid INTEGER NOT NULL,
  cinid INTEGER NOT NULL,
  PRIMARY KEY (rid)
);

CREATE TABLE `customer`
(
  cusid INTEGER NOT NULL,
  userName VARCHAR(20) NOT NULL,
  password VARCHAR(20) NOT NULL,
  PRIMARY KEY (cusid)
);

CREATE TABLE `order`
(
  oid INTEGER NOT NULL,
  cinid INTEGER,
