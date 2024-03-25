package com.hana.spring1.exception;

public class DuplicatedIdException extends Exception{
    public DuplicatedIdException(String msg){
        super(msg);
    }

}
