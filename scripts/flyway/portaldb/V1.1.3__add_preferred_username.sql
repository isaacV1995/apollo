--
-- Copyright 2021 Apollo Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
Use ApolloPortalDB;

ALTER TABLE `Users`
    MODIFY COLUMN `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户登录账户',
    ADD COLUMN `UserDisplayName` varchar(512) NOT NULL DEFAULT 'default' COMMENT '用户名称' AFTER `Password`;
UPDATE `Users` SET `UserDisplayName`=`Username` WHERE `UserDisplayName` = 'default';