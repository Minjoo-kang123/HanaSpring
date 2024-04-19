package com.hana.app.repository;

import com.hana.app.data.entity.CateEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<CateEntity, Integer> {
}
