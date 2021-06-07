/*
 * Copyright 2021 Apollo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
//@Table(name = "AccessKey")
//@SQLDelete(sql = "Update AccessKey set isDeleted = 1 where id = ?")
//@Where(clause = "isDeleted = 0")
@Table(name = "access_key")
@SQLDelete(sql = "UPDATE access_key set is_deleted = TRUE where id = ?")
@Where(clause = "NOT is_deleted")
@SequenceGenerator(name = "sequence", sequenceName = "access_key_id_seq", allocationSize = 1)
public class AccessKey extends BaseEntity {

  @Column(name = "app_id", nullable = false)
  private String appId;

  @Column(name = "secret", nullable = false)
  private String secret;

  @Column(name = "is_enabled", nullable = false)
  private boolean enabled;

  public String getAppId() {
    return appId;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public String getSecret() {
    return secret;
  }

  public void setSecret(String secret) {
    this.secret = secret;
  }

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  @Override
  public String toString() {
    return toStringHelper().add("appId", appId).add("secret", secret)
        .add("enabled", enabled).toString();
  }
}
