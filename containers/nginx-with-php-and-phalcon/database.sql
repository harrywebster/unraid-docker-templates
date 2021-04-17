CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` DATETIME DEFAULT '0000-00-00 00:00:00',
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(220) NOT NULL,
  `content` LONGTEXT DEFAULT NULL,
  `status` enum('draft', 'posted', 'deleted'),
	`display_after` DATETIME DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(220) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO category SET id=1, name='Programming';
INSERT INTO post SET date='2020-04-17', category_id=1, author_id=1, title='Hello world!', content='This is just a test that everything is working as it should be.', status='posted';
