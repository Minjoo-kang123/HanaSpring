package com.hana.app.frame;

import com.hana.app.exception.DuplicatedIdException;

import java.util.List;

public interface HanaDao<K,V> {
    /**
     * 2024.3.13
     * JMLEE
     * @param v: CustDto
     * @return int
     */
    int insert(V v) throws DuplicatedIdException, Exception;
    int delete(K k) throws Exception;
    int update(V v) throws Exception;
    V select(K k) throws Exception;
    List<V> select() throws Exception;
}