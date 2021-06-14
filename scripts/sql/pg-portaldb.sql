/*
 Navicat Premium Data Transfer

 Source Server         : pg_postgres_admin
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : pg-portaldb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 07/06/2021 22:57:53
*/


-- ----------------------------
-- Sequence structure for app_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."app_id_seq";
CREATE SEQUENCE "public"."app_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for app_namespace_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."app_namespace_id_seq";
CREATE SEQUENCE "public"."app_namespace_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for authorities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."authorities_id_seq";
CREATE SEQUENCE "public"."authorities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for consumer_audit_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."consumer_audit_id_seq";
CREATE SEQUENCE "public"."consumer_audit_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for consumer_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."consumer_id_seq";
CREATE SEQUENCE "public"."consumer_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for consumer_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."consumer_role_id_seq";
CREATE SEQUENCE "public"."consumer_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for consumer_token_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."consumer_token_id_seq";
CREATE SEQUENCE "public"."consumer_token_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for favorite_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."favorite_id_seq";
CREATE SEQUENCE "public"."favorite_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permission_id_seq";
CREATE SEQUENCE "public"."permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_id_seq";
CREATE SEQUENCE "public"."role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_permission_id_seq";
CREATE SEQUENCE "public"."role_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for server_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."server_config_id_seq";
CREATE SEQUENCE "public"."server_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_role_id_seq";
CREATE SEQUENCE "public"."user_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS "public"."app";
CREATE TABLE "public"."app" (
  "id" int8 NOT NULL DEFAULT nextval('app_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "org_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "org_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "owner_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "owner_email" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."app"."id" IS 'ID';
COMMENT ON COLUMN "public"."app"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."app"."name" IS '应用名';
COMMENT ON COLUMN "public"."app"."org_id" IS '部门ID';
COMMENT ON COLUMN "public"."app"."org_name" IS '部门名字';
COMMENT ON COLUMN "public"."app"."owner_name" IS 'ownerName';
COMMENT ON COLUMN "public"."app"."owner_email" IS 'ownerEmail';
COMMENT ON COLUMN "public"."app"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."app"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."app"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."app"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."app"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of app
-- ----------------------------

-- ----------------------------
-- Table structure for app_namespace
-- ----------------------------
DROP TABLE IF EXISTS "public"."app_namespace";
CREATE TABLE "public"."app_namespace" (
  "id" int8 NOT NULL DEFAULT nextval('app_namespace_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "format" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'properties'::text,
  "is_public" bool NOT NULL DEFAULT false,
  "comment" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."app_namespace"."id" IS 'ID';
COMMENT ON COLUMN "public"."app_namespace"."name" IS 'namespace名字，注意，需要全局唯一';
COMMENT ON COLUMN "public"."app_namespace"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."app_namespace"."format" IS 'namespace的format类型';
COMMENT ON COLUMN "public"."app_namespace"."is_public" IS 'namespace是否为公共';
COMMENT ON COLUMN "public"."app_namespace"."comment" IS '注释';
COMMENT ON COLUMN "public"."app_namespace"."is_deleted" IS '是否删除';
COMMENT ON COLUMN "public"."app_namespace"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."app_namespace"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."app_namespace"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."app_namespace"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of app_namespace
-- ----------------------------

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS "public"."authorities";
CREATE TABLE "public"."authorities" (
  "id" int8 NOT NULL DEFAULT nextval('authorities_id_seq'::regclass),
  "username" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "authority" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text
)
;
COMMENT ON COLUMN "public"."authorities"."id" IS 'ID';

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO "public"."authorities" VALUES (1, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS "public"."consumer";
CREATE TABLE "public"."consumer" (
  "id" int8 NOT NULL DEFAULT nextval('consumer_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "org_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "org_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "owner_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "owner_email" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."consumer"."id" IS 'ID';
COMMENT ON COLUMN "public"."consumer"."app_id" IS 'app_id';
COMMENT ON COLUMN "public"."consumer"."name" IS '应用名';
COMMENT ON COLUMN "public"."consumer"."org_id" IS '部门Id';
COMMENT ON COLUMN "public"."consumer"."org_name" IS '部门名字';
COMMENT ON COLUMN "public"."consumer"."owner_name" IS 'ownerName';
COMMENT ON COLUMN "public"."consumer"."owner_email" IS 'ownerEmail';
COMMENT ON COLUMN "public"."consumer"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."consumer"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."consumer"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."consumer"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."consumer"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of consumer
-- ----------------------------

-- ----------------------------
-- Table structure for consumer_audit
-- ----------------------------
DROP TABLE IF EXISTS "public"."consumer_audit";
CREATE TABLE "public"."consumer_audit" (
  "id" int8 NOT NULL DEFAULT nextval('consumer_audit_id_seq'::regclass),
  "consumer_id" int8,
  "uri" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "method" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."consumer_audit"."id" IS 'ID';
COMMENT ON COLUMN "public"."consumer_audit"."consumer_id" IS 'Consumer Id';
COMMENT ON COLUMN "public"."consumer_audit"."uri" IS '访问的Uri';
COMMENT ON COLUMN "public"."consumer_audit"."method" IS '访问的Method';
COMMENT ON COLUMN "public"."consumer_audit"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."consumer_audit"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of consumer_audit
-- ----------------------------

-- ----------------------------
-- Table structure for consumer_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."consumer_role";
CREATE TABLE "public"."consumer_role" (
  "id" int8 NOT NULL DEFAULT nextval('consumer_role_id_seq'::regclass),
  "consumer_id" int8,
  "role_id" int8,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."consumer_role"."id" IS 'ID';
COMMENT ON COLUMN "public"."consumer_role"."consumer_id" IS 'Consumer Id';
COMMENT ON COLUMN "public"."consumer_role"."role_id" IS 'Role Id';
COMMENT ON COLUMN "public"."consumer_role"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."consumer_role"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."consumer_role"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."consumer_role"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."consumer_role"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of consumer_role
-- ----------------------------

-- ----------------------------
-- Table structure for consumer_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."consumer_token";
CREATE TABLE "public"."consumer_token" (
  "id" int8 NOT NULL DEFAULT nextval('consumer_token_id_seq'::regclass),
  "consumer_id" int8,
  "token" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "expires" timestamp(6) NOT NULL DEFAULT '2099-12-31 23:59:59'::timestamp without time zone,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."consumer_token"."id" IS 'ID';
COMMENT ON COLUMN "public"."consumer_token"."consumer_id" IS 'ConsumerId';
COMMENT ON COLUMN "public"."consumer_token"."token" IS 'token';
COMMENT ON COLUMN "public"."consumer_token"."expires" IS 'token失效时间';
COMMENT ON COLUMN "public"."consumer_token"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."consumer_token"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."consumer_token"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."consumer_token"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."consumer_token"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of consumer_token
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS "public"."favorite";
CREATE TABLE "public"."favorite" (
  "id" int8 NOT NULL DEFAULT nextval('favorite_id_seq'::regclass),
  "user_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "position" int8 NOT NULL DEFAULT 10000,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."favorite"."id" IS 'ID';
COMMENT ON COLUMN "public"."favorite"."user_id" IS '收藏的用户';
COMMENT ON COLUMN "public"."favorite"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."favorite"."position" IS '收藏顺序';
COMMENT ON COLUMN "public"."favorite"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."favorite"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."favorite"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."favorite"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."favorite"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission";
CREATE TABLE "public"."permission" (
  "id" int8 NOT NULL DEFAULT nextval('permission_id_seq'::regclass),
  "permission_type" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "target_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."permission"."id" IS 'ID';
COMMENT ON COLUMN "public"."permission"."permission_type" IS '权限类型';
COMMENT ON COLUMN "public"."permission"."target_id" IS '权限对象类型';
COMMENT ON COLUMN "public"."permission"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."permission"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."permission"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."permission"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."permission"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "id" int8 NOT NULL DEFAULT nextval('role_id_seq'::regclass),
  "role_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."role"."id" IS 'ID';
COMMENT ON COLUMN "public"."role"."role_name" IS 'role_name';
COMMENT ON COLUMN "public"."role"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."role"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."role"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."role"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."role"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permission";
CREATE TABLE "public"."role_permission" (
  "id" int8 NOT NULL DEFAULT nextval('role_permission_id_seq'::regclass),
  "role_id" int8,
  "permission_id" int8,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."role_permission"."id" IS 'ID';
COMMENT ON COLUMN "public"."role_permission"."role_id" IS 'Role Id';
COMMENT ON COLUMN "public"."role_permission"."permission_id" IS 'Permission Id';
COMMENT ON COLUMN "public"."role_permission"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."role_permission"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."role_permission"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."role_permission"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."role_permission"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for server_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."server_config";
CREATE TABLE "public"."server_config" (
  "id" int8 NOT NULL DEFAULT nextval('server_config_id_seq'::regclass),
  "key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "value" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "comment" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."server_config"."id" IS 'ID';
COMMENT ON COLUMN "public"."server_config"."key" IS '配置项Key';
COMMENT ON COLUMN "public"."server_config"."value" IS '配置项值';
COMMENT ON COLUMN "public"."server_config"."comment" IS '注释';
COMMENT ON COLUMN "public"."server_config"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."server_config"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."server_config"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."server_config"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."server_config"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of server_config
-- ----------------------------
INSERT INTO "public"."server_config" VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (2, 'organizations', '[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"}]', '部门列表', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');
INSERT INTO "public"."server_config" VALUES (8, 'apollo.portal.meta.servers', '{}', '各环境Meta Service列表', 'f', 'default', '2021-06-02 10:15:39', '', '2021-06-02 10:15:39');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_role";
CREATE TABLE "public"."user_role" (
  "id" int8 NOT NULL DEFAULT nextval('user_role_id_seq'::regclass),
  "user_id" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "role_id" int8,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."user_role"."id" IS 'ID';
COMMENT ON COLUMN "public"."user_role"."user_id" IS '用户身份标识';
COMMENT ON COLUMN "public"."user_role"."role_id" IS 'Role Id';
COMMENT ON COLUMN "public"."user_role"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."user_role"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."user_role"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."user_role"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."user_role"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "username" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "password" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "user_display_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "email" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "enabled" bool
)
;
COMMENT ON COLUMN "public"."users"."id" IS 'ID';
COMMENT ON COLUMN "public"."users"."username" IS '用户登录账户';
COMMENT ON COLUMN "public"."users"."password" IS '密码';
COMMENT ON COLUMN "public"."users"."user_display_name" IS '用户名称';
COMMENT ON COLUMN "public"."users"."email" IS '邮箱地址';
COMMENT ON COLUMN "public"."users"."enabled" IS '是否有效';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', 't');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."app_id_seq"
OWNED BY "public"."app"."id";
SELECT setval('"public"."app_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."app_namespace_id_seq"
OWNED BY "public"."app_namespace"."id";
SELECT setval('"public"."app_namespace_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."authorities_id_seq"
OWNED BY "public"."authorities"."id";
SELECT setval('"public"."authorities_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."consumer_audit_id_seq"
OWNED BY "public"."consumer_audit"."id";
SELECT setval('"public"."consumer_audit_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."consumer_id_seq"
OWNED BY "public"."consumer"."id";
SELECT setval('"public"."consumer_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."consumer_role_id_seq"
OWNED BY "public"."consumer_role"."id";
SELECT setval('"public"."consumer_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."consumer_token_id_seq"
OWNED BY "public"."consumer_token"."id";
SELECT setval('"public"."consumer_token_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."favorite_id_seq"
OWNED BY "public"."favorite"."id";
SELECT setval('"public"."favorite_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permission_id_seq"
OWNED BY "public"."permission"."id";
SELECT setval('"public"."permission_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_id_seq"
OWNED BY "public"."role"."id";
SELECT setval('"public"."role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_permission_id_seq"
OWNED BY "public"."role_permission"."id";
SELECT setval('"public"."role_permission_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."server_config_id_seq"
OWNED BY "public"."server_config"."id";
SELECT setval('"public"."server_config_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_role_id_seq"
OWNED BY "public"."user_role"."id";
SELECT setval('"public"."user_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 1, true);

-- ----------------------------
-- Indexes structure for table app
-- ----------------------------
CREATE INDEX "app_app_id_index" ON "public"."app" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "app_app_name_index" ON "public"."app" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "app_last_modified_time_index" ON "public"."app" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table app
-- ----------------------------
ALTER TABLE "public"."app" ADD CONSTRAINT "app_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table app_namespace
-- ----------------------------
CREATE INDEX "app_namespace_app_id_index" ON "public"."app_namespace" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "app_namespace_last_modified_time_index" ON "public"."app_namespace" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "app_namespace_namespace_name_app_id_index" ON "public"."app_namespace" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table app_namespace
-- ----------------------------
ALTER TABLE "public"."app_namespace" ADD CONSTRAINT "app_namespace_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table authorities
-- ----------------------------
ALTER TABLE "public"."authorities" ADD CONSTRAINT "authorities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table consumer
-- ----------------------------
CREATE INDEX "consumer_app_id_index" ON "public"."consumer" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "consumer_last_modified_time_index" ON "public"."consumer" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table consumer
-- ----------------------------
ALTER TABLE "public"."consumer" ADD CONSTRAINT "consumer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table consumer_audit
-- ----------------------------
CREATE INDEX "consumer_audit_consumer_id_index" ON "public"."consumer_audit" USING btree (
  "consumer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "consumer_audit_last_modified_time_index" ON "public"."consumer_audit" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table consumer_audit
-- ----------------------------
ALTER TABLE "public"."consumer_audit" ADD CONSTRAINT "consumer_audit_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table consumer_role
-- ----------------------------
CREATE INDEX "consumer_role_consumer_id_role_id_index" ON "public"."consumer_role" USING btree (
  "consumer_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "consumer_role_last_modified_time_index" ON "public"."consumer_role" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "consumer_role_role_id_index" ON "public"."consumer_role" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table consumer_role
-- ----------------------------
ALTER TABLE "public"."consumer_role" ADD CONSTRAINT "consumer_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table consumer_token
-- ----------------------------
CREATE INDEX "consumer_token_last_modified_time_index" ON "public"."consumer_token" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "consumer_token_token_unique_index" ON "public"."consumer_token" USING btree (
  "token" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table consumer_token
-- ----------------------------
ALTER TABLE "public"."consumer_token" ADD CONSTRAINT "consumer_token_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table favorite
-- ----------------------------
CREATE INDEX "favorite_app_id_index" ON "public"."favorite" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "favorite_last_modified_time_index" ON "public"."favorite" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "favorite_user_id_index" ON "public"."favorite" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table favorite
-- ----------------------------
ALTER TABLE "public"."favorite" ADD CONSTRAINT "favorite_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table permission
-- ----------------------------
CREATE INDEX "permission_last_modified_time_index" ON "public"."permission" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "permission_permission_type_target_id_index" ON "public"."permission" USING btree (
  "permission_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "target_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table permission
-- ----------------------------
ALTER TABLE "public"."permission" ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table role
-- ----------------------------
CREATE INDEX "role_last_modified_time_index" ON "public"."role" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "role_role_name_index" ON "public"."role" USING btree (
  "role_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table role_permission
-- ----------------------------
CREATE INDEX "role_permission_last_modified_time_index" ON "public"."role_permission" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "role_permission_permission_id_index" ON "public"."role_permission" USING btree (
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "role_permission_role_id_index" ON "public"."role_permission" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table role_permission
-- ----------------------------
ALTER TABLE "public"."role_permission" ADD CONSTRAINT "role_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table server_config
-- ----------------------------
CREATE INDEX "server_config_key_index" ON "public"."server_config" USING btree (
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "server_config_last_modified_time_index" ON "public"."server_config" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table server_config
-- ----------------------------
ALTER TABLE "public"."server_config" ADD CONSTRAINT "server_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user_role
-- ----------------------------
CREATE INDEX "user_role_last_modified_time_index" ON "public"."user_role" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "user_role_role_id_index" ON "public"."user_role" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "user_role_user_id_role_id_index" ON "public"."user_role" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
