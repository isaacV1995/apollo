/*
 Navicat Premium Data Transfer

 Source Server         : pg_postgres_admin
 Source Server Type    : PostgreSQL
 Source Server Version : 130003
 Source Host           : localhost:5432
 Source Catalog        : pg-configdb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130003
 File Encoding         : 65001

 Date: 07/06/2021 22:55:06
*/


-- ----------------------------
-- Sequence structure for access_key_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."access_key_id_seq";
CREATE SEQUENCE "public"."access_key_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

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
-- Sequence structure for audit_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."audit_id_seq";
CREATE SEQUENCE "public"."audit_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cluster_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cluster_id_seq";
CREATE SEQUENCE "public"."cluster_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for commit_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."commit_id_seq";
CREATE SEQUENCE "public"."commit_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gray_release_rule_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gray_release_rule_id_seq";
CREATE SEQUENCE "public"."gray_release_rule_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for instance_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."instance_config_id_seq";
CREATE SEQUENCE "public"."instance_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for instance_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."instance_id_seq";
CREATE SEQUENCE "public"."instance_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for item_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."item_id_seq";
CREATE SEQUENCE "public"."item_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for namespace_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."namespace_id_seq";
CREATE SEQUENCE "public"."namespace_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for namespace_lock_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."namespace_lock_id_seq";
CREATE SEQUENCE "public"."namespace_lock_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for release_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."release_history_id_seq";
CREATE SEQUENCE "public"."release_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for release_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."release_id_seq";
CREATE SEQUENCE "public"."release_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for release_message_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."release_message_id_seq";
CREATE SEQUENCE "public"."release_message_id_seq" 
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
-- Table structure for access_key
-- ----------------------------
DROP TABLE IF EXISTS "public"."access_key";
CREATE TABLE "public"."access_key" (
  "id" int8 NOT NULL DEFAULT nextval('access_key_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "secret" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "is_enabled" bool NOT NULL DEFAULT false,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."access_key"."id" IS 'ID';
COMMENT ON COLUMN "public"."access_key"."app_id" IS 'app_id';
COMMENT ON COLUMN "public"."access_key"."secret" IS 'secret';
COMMENT ON COLUMN "public"."access_key"."is_enabled" IS 'true: enabled, false: disabled';
COMMENT ON COLUMN "public"."access_key"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."access_key"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."access_key"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."access_key"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."access_key"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of access_key
-- ----------------------------

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
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS "public"."audit";
CREATE TABLE "public"."audit" (
  "id" int8 NOT NULL DEFAULT nextval('audit_id_seq'::regclass),
  "entity_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "entity_id" int8,
  "op_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "comment" text COLLATE "pg_catalog"."default",
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."audit"."id" IS 'ID';
COMMENT ON COLUMN "public"."audit"."entity_name" IS '表名';
COMMENT ON COLUMN "public"."audit"."entity_id" IS '记录ID';
COMMENT ON COLUMN "public"."audit"."op_name" IS '操作类型';
COMMENT ON COLUMN "public"."audit"."comment" IS '备注';
COMMENT ON COLUMN "public"."audit"."is_deleted" IS '是否删除';
COMMENT ON COLUMN "public"."audit"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."audit"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."audit"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."audit"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of audit
-- ----------------------------

-- ----------------------------
-- Table structure for cluster
-- ----------------------------
DROP TABLE IF EXISTS "public"."cluster";
CREATE TABLE "public"."cluster" (
  "id" int8 NOT NULL DEFAULT nextval('cluster_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "parent_cluster_id" int8 NOT NULL DEFAULT 0,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."cluster"."id" IS 'ID';
COMMENT ON COLUMN "public"."cluster"."name" IS '集群名字';
COMMENT ON COLUMN "public"."cluster"."app_id" IS 'app id';
COMMENT ON COLUMN "public"."cluster"."parent_cluster_id" IS '父cluster';
COMMENT ON COLUMN "public"."cluster"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."cluster"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."cluster"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."cluster"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."cluster"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of cluster
-- ----------------------------

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS "public"."commit";
CREATE TABLE "public"."commit" (
  "id" int8 NOT NULL DEFAULT nextval('commit_id_seq'::regclass),
  "change_sets" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "comment" text COLLATE "pg_catalog"."default",
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."commit"."id" IS 'ID';
COMMENT ON COLUMN "public"."commit"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."commit"."cluster_name" IS 'ClusterName';
COMMENT ON COLUMN "public"."commit"."namespace_name" IS 'namespaceName';
COMMENT ON COLUMN "public"."commit"."comment" IS '备注';
COMMENT ON COLUMN "public"."commit"."is_deleted" IS '是否删除';
COMMENT ON COLUMN "public"."commit"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."commit"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."commit"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."commit"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of commit
-- ----------------------------

-- ----------------------------
-- Table structure for gray_release_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."gray_release_rule";
CREATE TABLE "public"."gray_release_rule" (
  "id" int8 NOT NULL DEFAULT nextval('gray_release_rule_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "branch_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "rules" text COLLATE "pg_catalog"."default" DEFAULT '[]'::text,
  "release_id" int8 NOT NULL DEFAULT 0,
  "branch_status" int2 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."gray_release_rule"."id" IS 'ID';
COMMENT ON COLUMN "public"."gray_release_rule"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."gray_release_rule"."cluster_name" IS 'cluster_name';
COMMENT ON COLUMN "public"."gray_release_rule"."namespace_name" IS 'namespace_name';
COMMENT ON COLUMN "public"."gray_release_rule"."branch_name" IS 'branch_name';
COMMENT ON COLUMN "public"."gray_release_rule"."rules" IS '灰度规则';
COMMENT ON COLUMN "public"."gray_release_rule"."release_id" IS '灰度对应的release';
COMMENT ON COLUMN "public"."gray_release_rule"."branch_status" IS '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布';
COMMENT ON COLUMN "public"."gray_release_rule"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."gray_release_rule"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."gray_release_rule"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gray_release_rule"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."gray_release_rule"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of gray_release_rule
-- ----------------------------

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS "public"."instance";
CREATE TABLE "public"."instance" (
  "id" int8 NOT NULL DEFAULT nextval('instance_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "data_center" text COLLATE "pg_catalog"."default" NOT NULL,
  "ip" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" timestamp(6) NOT NULL,
  "last_modified_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."instance"."id" IS 'ID';
COMMENT ON COLUMN "public"."instance"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."instance"."cluster_name" IS 'cluster_name';
COMMENT ON COLUMN "public"."instance"."data_center" IS 'Data Center Name';
COMMENT ON COLUMN "public"."instance"."ip" IS 'instance ip';
COMMENT ON COLUMN "public"."instance"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."instance"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of instance
-- ----------------------------

-- ----------------------------
-- Table structure for instance_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."instance_config";
CREATE TABLE "public"."instance_config" (
  "id" int8 NOT NULL DEFAULT nextval('instance_config_id_seq'::regclass),
  "instance_id" int8,
  "config_app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "config_cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "config_namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "release_key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "release_delivery_time" timestamp(6),
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_time" timestamp(6) NOT NULL DEFAULT now()
)
;
COMMENT ON COLUMN "public"."instance_config"."id" IS 'ID';
COMMENT ON COLUMN "public"."instance_config"."instance_id" IS 'Instance Id';
COMMENT ON COLUMN "public"."instance_config"."config_app_id" IS 'Config App Id';
COMMENT ON COLUMN "public"."instance_config"."config_cluster_name" IS 'Config Cluster Name';
COMMENT ON COLUMN "public"."instance_config"."config_namespace_name" IS 'Config Namespace Name';
COMMENT ON COLUMN "public"."instance_config"."release_key" IS '发布的Key';
COMMENT ON COLUMN "public"."instance_config"."release_delivery_time" IS '配置获取时间';
COMMENT ON COLUMN "public"."instance_config"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."instance_config"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of instance_config
-- ----------------------------

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS "public"."item";
CREATE TABLE "public"."item" (
  "id" int8 NOT NULL DEFAULT nextval('item_id_seq'::regclass),
  "namespace_id" int8 NOT NULL DEFAULT 0,
  "key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "value" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "comment" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "line_num" int8 DEFAULT 0,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."item"."id" IS 'ID';
COMMENT ON COLUMN "public"."item"."namespace_id" IS '集群NamespaceId';
COMMENT ON COLUMN "public"."item"."key" IS '配置项Key';
COMMENT ON COLUMN "public"."item"."value" IS '配置项Value';
COMMENT ON COLUMN "public"."item"."comment" IS '注释';
COMMENT ON COLUMN "public"."item"."line_num" IS '行号';
COMMENT ON COLUMN "public"."item"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."item"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."item"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."item"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."item"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of item
-- ----------------------------

-- ----------------------------
-- Table structure for namespace
-- ----------------------------
DROP TABLE IF EXISTS "public"."namespace";
CREATE TABLE "public"."namespace" (
  "id" int8 NOT NULL DEFAULT nextval('namespace_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."namespace"."id" IS 'ID';
COMMENT ON COLUMN "public"."namespace"."app_id" IS 'AppID';
COMMENT ON COLUMN "public"."namespace"."cluster_name" IS 'Cluster Name';
COMMENT ON COLUMN "public"."namespace"."namespace_name" IS 'Namespace Name';
COMMENT ON COLUMN "public"."namespace"."is_deleted" IS '是否删除';
COMMENT ON COLUMN "public"."namespace"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."namespace"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."namespace"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."namespace"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of namespace
-- ----------------------------

-- ----------------------------
-- Table structure for namespace_lock
-- ----------------------------
DROP TABLE IF EXISTS "public"."namespace_lock";
CREATE TABLE "public"."namespace_lock" (
  "id" int8 NOT NULL DEFAULT nextval('namespace_lock_id_seq'::regclass),
  "namespace_id" int8 NOT NULL DEFAULT 0,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."namespace_lock"."id" IS 'ID';
COMMENT ON COLUMN "public"."namespace_lock"."namespace_id" IS '集群NamespaceId';
COMMENT ON COLUMN "public"."namespace_lock"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."namespace_lock"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."namespace_lock"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."namespace_lock"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."namespace_lock"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of namespace_lock
-- ----------------------------

-- ----------------------------
-- Table structure for release
-- ----------------------------
DROP TABLE IF EXISTS "public"."release";
CREATE TABLE "public"."release" (
  "id" int8 NOT NULL DEFAULT nextval('release_id_seq'::regclass),
  "release_key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "comment" text COLLATE "pg_catalog"."default",
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "configurations" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "is_abandoned" bool NOT NULL DEFAULT false,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."release"."id" IS 'ID';
COMMENT ON COLUMN "public"."release"."release_key" IS '发布的Key';
COMMENT ON COLUMN "public"."release"."name" IS '发布名字';
COMMENT ON COLUMN "public"."release"."comment" IS '发布说明';
COMMENT ON COLUMN "public"."release"."app_id" IS 'app_id';
COMMENT ON COLUMN "public"."release"."cluster_name" IS 'cluster_name';
COMMENT ON COLUMN "public"."release"."namespace_name" IS 'namespace_name';
COMMENT ON COLUMN "public"."release"."configurations" IS '发布配置';
COMMENT ON COLUMN "public"."release"."is_abandoned" IS '是否废弃';
COMMENT ON COLUMN "public"."release"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."release"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."release"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."release"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."release"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of release
-- ----------------------------

-- ----------------------------
-- Table structure for release_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."release_history";
CREATE TABLE "public"."release_history" (
  "id" int8 NOT NULL DEFAULT nextval('release_history_id_seq'::regclass),
  "app_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "namespace_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "branch_name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "release_id" int8 NOT NULL DEFAULT 0,
  "previous_release_id" int8 NOT NULL DEFAULT 0,
  "operation" int2 NOT NULL DEFAULT 0,
  "operation_context" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "is_deleted" bool NOT NULL DEFAULT false,
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "created_time" timestamp(6) NOT NULL DEFAULT now(),
  "last_modified_by" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "last_modified_time" timestamp(6) DEFAULT now()
)
;
COMMENT ON COLUMN "public"."release_history"."id" IS 'ID';
COMMENT ON COLUMN "public"."release_history"."app_id" IS 'app_id';
COMMENT ON COLUMN "public"."release_history"."cluster_name" IS 'cluster_name';
COMMENT ON COLUMN "public"."release_history"."namespace_name" IS 'namespace_name';
COMMENT ON COLUMN "public"."release_history"."branch_name" IS '发布分支名';
COMMENT ON COLUMN "public"."release_history"."release_id" IS '关联的Release Id';
COMMENT ON COLUMN "public"."release_history"."previous_release_id" IS '前一次发布的ReleaseId';
COMMENT ON COLUMN "public"."release_history"."operation" IS '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度';
COMMENT ON COLUMN "public"."release_history"."operation_context" IS '发布上下文信息';
COMMENT ON COLUMN "public"."release_history"."is_deleted" IS 'true: deleted, false: normal';
COMMENT ON COLUMN "public"."release_history"."created_by" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."release_history"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."release_history"."last_modified_by" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."release_history"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of release_history
-- ----------------------------

-- ----------------------------
-- Table structure for release_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."release_message";
CREATE TABLE "public"."release_message" (
  "id" int8 NOT NULL DEFAULT nextval('release_message_id_seq'::regclass),
  "message" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "last_modified_time" timestamp(6) NOT NULL DEFAULT now()
)
;
COMMENT ON COLUMN "public"."release_message"."id" IS 'ID';
COMMENT ON COLUMN "public"."release_message"."message" IS '发布的消息内容';
COMMENT ON COLUMN "public"."release_message"."last_modified_time" IS '最后修改时间';

-- ----------------------------
-- Records of release_message
-- ----------------------------

-- ----------------------------
-- Table structure for server_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."server_config";
CREATE TABLE "public"."server_config" (
  "id" int8 NOT NULL DEFAULT nextval('server_config_id_seq'::regclass),
  "key" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
  "cluster" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::text,
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
COMMENT ON COLUMN "public"."server_config"."cluster" IS '配置对应的集群，default为不针对特定的集群';
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
INSERT INTO "public"."server_config" VALUES (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', 'f', 'default', '2021-06-02 10:15:16', '', '2021-06-02 10:15:16');
INSERT INTO "public"."server_config" VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', 'f', 'default', '2021-06-02 10:15:16', '', '2021-06-02 10:15:16');
INSERT INTO "public"."server_config" VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', 'f', 'default', '2021-06-02 10:15:16', '', '2021-06-02 10:15:16');
INSERT INTO "public"."server_config" VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', 'f', 'default', '2021-06-02 10:15:16', '', '2021-06-02 10:15:16');
INSERT INTO "public"."server_config" VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', 'f', 'default', '2021-06-02 10:15:16', '', '2021-06-02 10:15:16');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."access_key_id_seq"
OWNED BY "public"."access_key"."id";
SELECT setval('"public"."access_key_id_seq"', 1, false);

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
ALTER SEQUENCE "public"."audit_id_seq"
OWNED BY "public"."audit"."id";
SELECT setval('"public"."audit_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cluster_id_seq"
OWNED BY "public"."cluster"."id";
SELECT setval('"public"."cluster_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."commit_id_seq"
OWNED BY "public"."commit"."id";
SELECT setval('"public"."commit_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gray_release_rule_id_seq"
OWNED BY "public"."gray_release_rule"."id";
SELECT setval('"public"."gray_release_rule_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."instance_config_id_seq"
OWNED BY "public"."instance_config"."id";
SELECT setval('"public"."instance_config_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."instance_id_seq"
OWNED BY "public"."instance"."id";
SELECT setval('"public"."instance_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."item_id_seq"
OWNED BY "public"."item"."id";
SELECT setval('"public"."item_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."namespace_id_seq"
OWNED BY "public"."namespace"."id";
SELECT setval('"public"."namespace_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."namespace_lock_id_seq"
OWNED BY "public"."namespace_lock"."id";
SELECT setval('"public"."namespace_lock_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."release_history_id_seq"
OWNED BY "public"."release_history"."id";
SELECT setval('"public"."release_history_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."release_id_seq"
OWNED BY "public"."release"."id";
SELECT setval('"public"."release_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."release_message_id_seq"
OWNED BY "public"."release_message"."id";
SELECT setval('"public"."release_message_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."server_config_id_seq"
OWNED BY "public"."server_config"."id";
SELECT setval('"public"."server_config_id_seq"', 5, true);

-- ----------------------------
-- Indexes structure for table access_key
-- ----------------------------
CREATE INDEX "access_key_app_id_index" ON "public"."access_key" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "access_key_last_modified_time_index" ON "public"."access_key" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table access_key
-- ----------------------------
ALTER TABLE "public"."access_key" ADD CONSTRAINT "access_key_pkey" PRIMARY KEY ("id");

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
-- Indexes structure for table audit
-- ----------------------------
CREATE INDEX "audit_last_modified_time_index" ON "public"."audit" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table audit
-- ----------------------------
ALTER TABLE "public"."audit" ADD CONSTRAINT "audit_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cluster
-- ----------------------------
CREATE INDEX "cluster_app_id_cluster_name_index" ON "public"."cluster" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cluster_last_modified_time_index" ON "public"."cluster" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "cluster_parent_cluster_id_index" ON "public"."cluster" USING btree (
  "parent_cluster_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cluster
-- ----------------------------
ALTER TABLE "public"."cluster" ADD CONSTRAINT "cluster_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table commit
-- ----------------------------
CREATE INDEX "commit_app_id_index" ON "public"."commit" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "commit_cluster_name_index" ON "public"."commit" USING btree (
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "commit_last_modified_time_index" ON "public"."commit" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "commit_namespace_name_index" ON "public"."commit" USING btree (
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table commit
-- ----------------------------
ALTER TABLE "public"."commit" ADD CONSTRAINT "commit_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gray_release_rule
-- ----------------------------
CREATE INDEX "gray_release_rule_app_id_cluster_name_namespace_name_index" ON "public"."gray_release_rule" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "gray_release_rule_last_modified_time_index" ON "public"."gray_release_rule" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table instance
-- ----------------------------
CREATE UNIQUE INDEX "instance_app_id_cluster_name_ip_data_center_unique_index" ON "public"."instance" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "data_center" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ip" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "instance_ip_index" ON "public"."instance" USING btree (
  "ip" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "instance_last_modified_time_index" ON "public"."instance" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table instance
-- ----------------------------
ALTER TABLE "public"."instance" ADD CONSTRAINT "instance_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table instance_config
-- ----------------------------
CREATE INDEX "instance_config_config_app_id_config_cluster_name_config_namesp" ON "public"."instance_config" USING btree (
  "config_app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "config_cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "config_namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "instance_config_last_modified_time_index" ON "public"."instance_config" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "instance_config_release_key_index" ON "public"."instance_config" USING btree (
  "release_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "instance_instance_id_config_app_id_config_namespace_name_unique" ON "public"."instance_config" USING btree (
  "instance_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "config_app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "config_namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table instance_config
-- ----------------------------
ALTER TABLE "public"."instance_config" ADD CONSTRAINT "instance_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table item
-- ----------------------------
CREATE INDEX "item_last_modified_time_index" ON "public"."item" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "item_namespace_id_index" ON "public"."item" USING btree (
  "namespace_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table item
-- ----------------------------
ALTER TABLE "public"."item" ADD CONSTRAINT "item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table namespace
-- ----------------------------
CREATE INDEX "namespace_app_id_cluster_name_namespace_name_index" ON "public"."namespace" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "namespace_last_modified_time_index" ON "public"."namespace" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "namespace_namespace_name_index" ON "public"."namespace" USING btree (
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table namespace
-- ----------------------------
ALTER TABLE "public"."namespace" ADD CONSTRAINT "namespace_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table namespace_lock
-- ----------------------------
CREATE INDEX "namespace_lock_last_modified_time_index" ON "public"."namespace_lock" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "namespace_lock_namespace_id_unique_index" ON "public"."namespace_lock" USING btree (
  "namespace_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table namespace_lock
-- ----------------------------
ALTER TABLE "public"."namespace_lock" ADD CONSTRAINT "namespace_lock_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table release
-- ----------------------------
CREATE INDEX "release_app_id_cluster_name_namespace_name_index" ON "public"."release" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "release_last_modified_time_index" ON "public"."release" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "release_release_key_index" ON "public"."release" USING btree (
  "release_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table release
-- ----------------------------
ALTER TABLE "public"."release" ADD CONSTRAINT "release_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table release_history
-- ----------------------------
CREATE INDEX "release_history_app_id_cluster_name_namespace_name_branch_name_" ON "public"."release_history" USING btree (
  "app_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "cluster_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "namespace_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "branch_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "release_history_last_modified_time_index" ON "public"."release_history" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "release_history_release_id_index" ON "public"."release_history" USING btree (
  "release_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table release_history
-- ----------------------------
ALTER TABLE "public"."release_history" ADD CONSTRAINT "release_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table release_message
-- ----------------------------
CREATE INDEX "release_message_last_modified_time_index" ON "public"."release_message" USING btree (
  "last_modified_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "release_message_message_index" ON "public"."release_message" USING btree (
  "message" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table release_message
-- ----------------------------
ALTER TABLE "public"."release_message" ADD CONSTRAINT "release_message_pkey" PRIMARY KEY ("id");

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
