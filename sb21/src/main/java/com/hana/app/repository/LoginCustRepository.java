package com.hana.app.repository;

import com.hana.app.data.dto.LoginCust;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//value key이다 >> jpa동
@Repository
public interface LoginCustRepository extends CrudRepository<LoginCust,String> {
}