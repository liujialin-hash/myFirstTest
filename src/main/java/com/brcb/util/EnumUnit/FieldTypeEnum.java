package com.brcb.util.EnumUnit;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;

public enum FieldTypeEnum {

    INTEGER {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getInt(fieldName));
        }
    },
    STRING {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getString(fieldName));
        }
    },
    DATE {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getDate(fieldName));
        }
    },
    DOUBLE {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getDouble(fieldName));
        }
    },
    FLOAT {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getFloat(fieldName));
        }
    },

    LONG {

        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getLong(fieldName));
        }
    },
    BOOLEAN {
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getBoolean(fieldName));
        }
    },
     SHORT{
        @Override
        public void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException {
            field.set(target, rs.getShort(fieldName));
        }
    };


    public abstract void setField(Object target, ResultSet rs, String fieldName, Field field) throws SQLException, IllegalAccessException;


    public static FieldTypeEnum fromClass(Class<?> clazz){
        if (clazz == Integer.class||clazz == int.class){
            return INTEGER;
        }else if (clazz == String.class){
            return STRING;
        }else if (clazz == java.util.Date.class){
            return DATE;
        }else if (clazz == Double.class){
            return DOUBLE;
        }if (clazz == Float.class){
            return FLOAT;
        }if (clazz == Long.class){
            return LONG;
        }if (clazz == Boolean.class){
            return BOOLEAN;
        }if (clazz == Short.class){
            return SHORT;
        }else {
            throw new IllegalArgumentException("Unsupported field type: " + clazz);
        }
    }



}
