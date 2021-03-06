CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
);

CREATE TABLE `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
);

CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`)
);
CREATE TABLE `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`)
);

CREATE TABLE `accEav` (
  `entity` bigint(20)  NOT NULL,
  `attribute` varchar(250) NOT NULL,
  `value` text NOT NULL
);
CREATE TABLE `accHist` (
  `id` int(11) NOT NULL ,
  `account_id` int(11)  DEFAULT NULL,
  `dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `details` text,
  PRIMARY KEY (`id`)
);
CREATE TABLE `accId6111` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `accTemplate` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `AccType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `accTemplateItem` (
  `id` int(11) NOT NULL ,
  `AccTemplate_id` int(11) NOT NULL,
  `eavFields_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `accType` (
  `id` int(11) NOT NULL ,
  `name` varchar(40) NOT NULL,
  `desc` varchar(40) NOT NULL,
  `openformat` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `accounts` (
  `id` int(11)  NOT NULL ,
  `type` int(11) DEFAULT NULL,
  `id6111` int(10)  DEFAULT NULL,
  `pay_terms` int(11) DEFAULT NULL,
  `src_tax` decimal(5,2) DEFAULT NULL,
  `src_date` timestamp NULL DEFAULT NULL,
  `parent_account_id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `contact` varchar(80) DEFAULT NULL,
  `department` varchar(60) DEFAULT NULL,
  `vatnum` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `dir_phone` varchar(20) DEFAULT NULL,
  `cellular` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `web` varchar(60) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `currency_id` varchar(3) NOT NULL,
  `comments` text,
  `system_acc` tinyint(1) NOT NULL DEFAULT '0',
  `owner` int(11) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
);

CREATE TABLE `bankName` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `bankbook` (
  `id` int(11)  NOT NULL DEFAULT '0',
  `account_id` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `details` varchar(60) DEFAULT NULL,
  `refnum` char(10) DEFAULT NULL,
  `sum` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `cor_num` varchar(30) DEFAULT NULL,
  `currency_id` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `blackList` (
  `id` int(11) NOT NULL ,
  `ip` varchar(20) NOT NULL,
  `time` timestamp NOT NULL ,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `config` (
  `id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `eavType` varchar(255) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `curRates` (
  `id` int(11) NOT NULL ,
  `currency_id` varchar(3) NOT NULL,
  `date` timestamp NOT NULL ,
  `value` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `docCheques` (
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `refnum` varchar(255) NOT NULL,
  `creditcompany` int(11) DEFAULT NULL,
  `cheque_num` char(10) DEFAULT NULL,
  `bank` char(3) DEFAULT NULL,
  `branch` char(3) DEFAULT NULL,
  `cheque_acct` char(20) DEFAULT NULL,
  `cheque_date` timestamp NULL DEFAULT NULL,
  `currency_id` varchar(3) NOT NULL,
  `sum` decimal(20,2) DEFAULT NULL,
  `bank_refnum` char(10) DEFAULT NULL,
  `dep_date` timestamp NULL DEFAULT NULL,
  `line` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doc_id`,`line`)
);

CREATE TABLE `docDetails` (
  `doc_id` int(11)  NOT NULL DEFAULT '0',
  `item_id` int(11)  DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `qty` decimal(5,2) DEFAULT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `currency_id` varchar(3) NOT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `invprice` decimal(20,2) DEFAULT NULL,
  `vat` decimal(20,2) NOT NULL,
  `line` int(11) NOT NULL,
  PRIMARY KEY (`doc_id`,`line`)
);

CREATE TABLE `docStatus` (
  `num` int(11) NOT NULL,
  `doc_type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `looked` tinyint(1) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`num`,`doc_type`)
);

CREATE TABLE `docType` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `openformat` int(11) NOT NULL,
  `isdoc` tinyint(1) NOT NULL,
  `isrecipet` tinyint(1) NOT NULL,
  `iscontract` tinyint(1) NOT NULL,
  `looked` tinyint(1) NOT NULL,
  `stockAction` int(11) NOT NULL,
  `account_type` int(11) NOT NULL,
  `docStatus_id` int(11) NOT NULL,
  `last_docnum` int(11) NOT NULL,
  `oppt_account_type` int(11) DEFAULT NULL,
  `transactionType_id` int(11) DEFAULT NULL,
  `vat_acc_id` int(11) NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `docs` (
  `id` int(11)  NOT NULL ,
  `doctype` int(11) NOT NULL,
  `docnum` int(10)  DEFAULT NULL,
  `account_id` int(10)  DEFAULT NULL,
  `company` varchar(80) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `vatnum` varchar(10) DEFAULT NULL,
  `refnum` varchar(20) DEFAULT NULL,
  `issue_date` timestamp NULL DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount` decimal(20,2) NOT NULL,
  `sub_total` decimal(20,2) DEFAULT NULL,
  `novat_total` decimal(20,2) DEFAULT NULL,
  `vat` decimal(20,2) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `currency_id` varchar(3) NOT NULL,
  `src_tax` decimal(20,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `printed` int(11) DEFAULT NULL,
  `comments` text,
  `description` text NOT NULL,
  `oppt_account_id` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `eavAttr` (
  `entity` bigint(20)  NOT NULL,
  `attribute` varchar(250) NOT NULL,
  `value` text NOT NULL
);
CREATE TABLE `eavFields` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `eavType` varchar(255) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `extCorrelation` (
  `id` int(11) NOT NULL ,
  `in` text NOT NULL,
  `out` text NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `files` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `parent_id` int(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL ,
  `expire` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `intCorrelation` (
  `id` int(11) NOT NULL ,
  `in` text NOT NULL,
  `out` text NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `inventoryItem` (
  `account_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ammount` int(11) NOT NULL,
  `idcode` varchar(255) NOT NULL
);
CREATE TABLE `itemCategories` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `profit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `itemEav` (
  `id` int(11) NOT NULL ,
  `entity` int(11) NOT NULL,
  `attribute` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `itemTemplate` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  `Itemcatagory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `itemTemplateItem` (
  `id` int(11) NOT NULL ,
  `ItemTemplate_id` int(11) NOT NULL,
  `eavFields_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `itemUnits` (
  `id` int(11) NOT NULL ,
  `name` varchar(40) NOT NULL,
  `precision` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `itemVatCat` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `items` (
  `id` int(10)  NOT NULL ,
  `name` varchar(100) DEFAULT NULL,
  `itemVatCat_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `extcatnum` varchar(30) DEFAULT NULL,
  `manufacturer` varchar(40) DEFAULT NULL,
  `saleprice` decimal(20,2) DEFAULT NULL,
  `currency_id` varchar(3) DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `parent_item_id` int(11) NOT NULL,
  `isProduct` tinyint(1) NOT NULL,
  `profit` int(11) NOT NULL,
  `purchaseprice` decimal(20,2) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stockType` int(1) NOT NULL,
  `modified` timestamp NOT NULL ,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
);

CREATE TABLE `language` (
  `id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `paymentType` (
  `id` int(11) NOT NULL ,
  `name` varchar(80) NOT NULL,
  `value` varchar(80) NOT NULL,
  `oppt_account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `stockAction` (
  `id` int(11) NOT NULL ,
  `account_id` int(11) NOT NULL,
  `oppt_account_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createDate` timestamp NOT NULL ,
  `doc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `transactionType` (
  `id` int(11) NOT NULL ,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL ,
  `num` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `refnum1` varchar(255) NOT NULL,
  `refnum2` varchar(255) NOT NULL,
  `valuedate` timestamp NOT NULL ,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `details` varchar(255) NOT NULL,
  `currency_id` varchar(3) NOT NULL,
  `sum` decimal(20,2) NOT NULL,
  `leadsum` decimal(20,2) NOT NULL,
  `secsum` decimal(20,2) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `linenum` int(11)  NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `userIncomeMap` (
  `user_id` int(11) NOT NULL,
  `itemVatCat_id` int(11) NOT NULL,
  `account_id` int(11)  NOT NULL
);

CREATE TABLE `accCountry` (
  `id` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE INDEX `userIncomeMap_itemVatCat_id` ON `userIncomeMap` (`itemVatCat_id`);
CREATE INDEX `userIncomeMap_account_id` ON `userIncomeMap` (`account_id`);
CREATE INDEX `userIncomeMap_user_id` ON `userIncomeMap` (`user_id`);
CREATE INDEX `accTemplate_AccType_id` ON `accTemplate` (`AccType_id`);
CREATE INDEX `eavAttr_ikEntity` ON `eavAttr` (`entity`);
CREATE INDEX `itemTemplateItem_ItemTemplate_id` ON `itemTemplateItem` (`ItemTemplate_id`);
CREATE INDEX `itemTemplateItem_eavFields_id` ON `itemTemplateItem` (`eavFields_id`);
CREATE INDEX `accTemplateItem_AccTemplate_id` ON `accTemplateItem` (`AccTemplate_id`);
CREATE INDEX `accTemplateItem_eavFields_id` ON `accTemplateItem` (`eavFields_id`);
CREATE INDEX `docStatus_doc_type` ON `docStatus` (`doc_type`);
CREATE INDEX `items_currency_id` ON `items` (`currency_id`);
CREATE INDEX `items_category_id` ON `items` (`category_id`);
CREATE INDEX `items_parent_item_id` ON `items` (`parent_item_id`);
CREATE INDEX `items_itemVatCat_id` ON `items` (`itemVatCat_id`);
CREATE INDEX `accounts_id6111` ON `accounts` (`id6111`);
CREATE INDEX `accounts_owner` ON `accounts` (`owner`);
CREATE INDEX `accounts_type` ON `accounts` (`type`);
CREATE INDEX `accounts_parent_account_id` ON `accounts` (`parent_account_id`);
CREATE INDEX `docDetails_doc_id` ON `docDetails` (`doc_id`);
CREATE INDEX `docDetails_item_id` ON `docDetails` (`item_id`);
CREATE INDEX `docDetails_unit_id` ON `docDetails` (`unit_id`);
CREATE INDEX `docDetails_unit_id_2` ON `docDetails` (`unit_id`);
CREATE INDEX `bankbook_num` ON `bankbook` (`id`);
CREATE INDEX `accEav_ikEntity` ON `accEav` (`entity`);
CREATE INDEX `AuthItemChild_child` ON `AuthItemChild` (`child`);
CREATE INDEX `accHist_prefix` ON `accHist` (`account_id`);
CREATE INDEX `itemTemplate_Itemcatagory_id` ON `itemTemplate` (`Itemcatagory_id`);
CREATE INDEX `docType_account_type` ON `docType` (`account_type`);
CREATE INDEX `docType_docStatus_id` ON `docType` (`docStatus_id`);
CREATE INDEX `docType_docStatus_id_2` ON `docType` (`docStatus_id`);
CREATE INDEX `docs_owner` ON `docs` (`owner`);
CREATE INDEX `docs_account_id` ON `docs` (`account_id`);
CREATE INDEX `docs_status` ON `docs` (`status`);
CREATE INDEX `docs_doctype` ON `docs` (`doctype`);