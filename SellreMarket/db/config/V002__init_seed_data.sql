INSERT INTO `selreMarket`.`product` (
  `pname`,
  `pEngname`,
  `allery`,
  `nutrition`,
  `pstock`,
  `pinsertdate`,
  `origin`,
  `expirationdate`,
  `description`,
  `status`
) VALUES (
	'우유',
	'milk',
	'(알러지 목록)',
	'(영양분 목록)',
	100,
	NOW(),
	'국산',
	NULL,
	'좋은 우유',
	'Y'
);

INSERT INTO `selreMarket`.`price` (
  `price`,
  `productid`
) VALUES (
  1000,
  (SELECT `productid` FROM `selreMarket`.`product` WHERE pname = '우유')
);

INSERT INTO `selreMarket`.`customer` (
  `userid`,
  `password`,
  `password2`,
  `tel_no`,
  `name`,
  `email`,
  `address`,
  `gender`,
  `birthdate`,
  `status`,
  `insertdate`,
  `updatedate`
) VALUES (
	'angel1004',
	'abc123!@',
	NULL,
	'010-7918-1994',
	'다오니',
	'angel77@naver.com',
	'대한민국 서울특별시 강남구',
	'F',
	'1999-01-01',
	'Y',
	NOW(),
	NOW()
);

INSERT INTO `selreMarket`.`cart` (
  `qty`,
  `userid`,
  `productid`
) VALUES (
  1,
  'angel1004',
  (SELECT `productid` FROM `selreMarket`.`product` WHERE pname = '우유')
);