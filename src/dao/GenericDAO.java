package dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO <T, PK extends Serializable> {

    //CRUD
    T create(T newObjcet);
    T read(PK primaryKey);
    boolean update(T updateObject);
    boolean delete(PK key);
    List<T> getAll();
}
