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
	'abc123',
	'abc123!@',
	NULL,
	'010-1234-5678',
	'홍길동',
	'abc123@gmail.com',
	'대한민국 동에번쩍 서에번쩍',
	'M',
	'1900-01-01',
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
  'abc123',
  (SELECT `productid` FROM `selreMarket`.`product` WHERE pname = '우유')
);