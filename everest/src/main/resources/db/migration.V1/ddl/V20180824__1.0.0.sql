/**
 * 客户端表
 */
CREATE TABLE client
(
  id                     BIGINT AUTO_INCREMENT
  COMMENT '客户端 ID'
    PRIMARY KEY,
  client_id              VARCHAR(32)                                                                                       NOT NULL
  COMMENT '客户端 ID',
  client_secret          VARCHAR(64)                                                                                       NOT NULL,
  resource_ids           VARCHAR(256)                                                                                      NULL
  COMMENT '资源 ID 集合 逗号分隔',
  scope                  VARCHAR(64) DEFAULT 'read,write'                                                                  NOT NULL
  COMMENT '操作范围，read,write',
  authorized_grant_types VARCHAR(256) DEFAULT 'authorization_code, password, client_credentials, implicit, refresh_token'  NOT NULL
  COMMENT '授权类型',
  authorities            VARCHAR(512)                                                                                      NULL
  COMMENT '默认权限集合，逗号分隔',
  access_token_validity  INT DEFAULT '86400'                                                                               NULL
  COMMENT 'AccessToken 有效期，单位：秒',
  refresh_token_validity INT DEFAULT '86400'                                                                               NULL
  COMMENT 'RefreshToken 有效期，默认单位：秒',
  autoapprove            VARCHAR(50) DEFAULT '.*'                                                                          NOT NULL
  COMMENT '自动授予',
  enabled                TINYINT(1) DEFAULT '1'                                                                            NOT NULL,
  created_at             TIMESTAMP DEFAULT CURRENT_TIMESTAMP                                                               NOT NULL,
  updated_at             TIMESTAMP DEFAULT CURRENT_TIMESTAMP                                                               NOT NULL,
  CONSTRAINT client_client_id_uindex
  UNIQUE (client_id)
)
  ENGINE = InnoDB;

/**
 * 用户登陆表表
 */
CREATE TABLE global_user
(
  id         BIGINT AUTO_INCREMENT
  COMMENT '用户 ID'
    PRIMARY KEY,
  guid       VARCHAR(64)                                   NOT NULL
  COMMENT '用户全局 ID',
  username   VARCHAR(20)                                   NOT NULL
  COMMENT '用户名',
  password   VARCHAR(128)                                  NOT NULL
  COMMENT '密码',
  locked     TINYINT(1) DEFAULT '0'                        NULL
  COMMENT '用户锁定',
  enabled    TINYINT(1) DEFAULT '1'                        NOT NULL,
  expired    TINYINT(1) DEFAULT '0'                        NULL
  COMMENT '用户过期',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP           NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP           NOT NULL,
  CONSTRAINT user_guid_uindex
  UNIQUE (guid)
)
  ENGINE = InnoDB;

CREATE TABLE user(
  id         BIGINT AUTO_INCREMENT
  COMMENT '用户 ID'
    PRIMARY KEY,
  guid       VARCHAR(64)                                   NOT NULL
  COMMENT '用户全局 ID',
  real_name  VARCHAR (10)                                  NULL
  COMMENT '真实姓名',
  identity_type VARCHAR(10)                                NULL
  COMMENT '证件类型： 身份证， 军官证， 护照',
  identity_no VARCHAR(20)                                  NULL
  COMMENT '证件号码',
  gender CHAR(1)                                           NULL
  COMMENT '性别',
  mobile_phone INT(11)                                     NOT NULL
  COMMENT '手机号码',
  register_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP        NOT NULL
  COMMENT '注册时间',
)